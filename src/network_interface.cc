/// home/cs144/minnow/src/network_interface.cc
#include <iostream>

#include "exception.hh"
#include "network_interface.hh"

using namespace std;

//! \param[in] ethernet_address Ethernet (what ARP calls "hardware") address of the interface
//! \param[in] ip_address IP (what ARP calls "protocol") address of the interface
NetworkInterface::NetworkInterface( string_view name,
                                    shared_ptr<OutputPort> port,
                                    const EthernetAddress& ethernet_address,
                                    const Address& ip_address )
  : name_( name )
  , port_( notnull( "OutputPort", move( port ) ) )
  , ethernet_address_( ethernet_address )
  , ip_address_( ip_address )
{
  cerr << "DEBUG: Network interface has Ethernet address " << to_string( ethernet_address ) << " and IP address "
       << ip_address.ip() << "\n";
}

//! \param[in] dgram the IPv4 datagram to be sent
//! \param[in] next_hop the IP address of the interface to send it to (typically a router or default gateway, but
//! may also be another host if directly connected to the same network as the destination) Note: the Address type
//! can be converted to a uint32_t (raw 32-bit IP address) by using the Address::ipv4_numeric() method.
void NetworkInterface::send_datagram( const InternetDatagram& dgram, const Address& next_hop )
{
  // // Your code here.
  // (void)dgram;
  // (void)next_hop;
  uint32_t dst_ip = next_hop.ipv4_numeric();
  auto it = ARP_table_.find( dst_ip );
  if ( it != ARP_table_.end() ) {
    transmit( make_eth_frame( EthernetHeader::TYPE_IPv4, serialize( dgram ), it->second ) );
  } else {
    // 需要等待发送的报文
    dgram_pending_.emplace( dst_ip, dgram );
    if ( ARP_timing_.find( dst_ip ) == ARP_timing_.end() ) {
      transmit(
        make_eth_frame( EthernetHeader::TYPE_ARP,
                        serialize( make_arp_frame( ARPMessage::OPCODE_REQUEST, dst_ip, EthernetAddress {} ) ),
                        ETHERNET_BROADCAST ) );
      ARP_timing_.emplace( dst_ip, 0 );
    }
  }
}

//! \param[in] frame the incoming Ethernet frame
void NetworkInterface::recv_frame( const EthernetFrame& frame )
{
  // // Your code here.
  // (void)frame;
  if ( frame.header.dst != ETHERNET_BROADCAST && frame.header.dst != ethernet_address_ )
    return;

  switch ( frame.header.type ) {
    case EthernetHeader::TYPE_IPv4: {
      InternetDatagram ip_dgram;
      if ( !parse( ip_dgram, frame.payload ) )
        return;
      datagrams_received_.emplace( move( ip_dgram ) );
    } break;

    case EthernetHeader::TYPE_ARP: {
      ARPMessage arp_msg;
      if ( !parse( arp_msg, frame.payload ) )
        return;
      ARP_table_.emplace( arp_msg.sender_ip_address, arp_msg.sender_ethernet_address );
      ARP_table_timing_.emplace( arp_msg.sender_ip_address, 0 );
      switch ( arp_msg.opcode ) {
        case ARPMessage::OPCODE_REQUEST: {
          /* code */
          if ( arp_msg.target_ip_address == ip_address_.ipv4_numeric() ) {
            transmit( make_eth_frame( EthernetHeader::TYPE_ARP,
                                      serialize( make_arp_frame( ARPMessage::OPCODE_REPLY,
                                                                 arp_msg.sender_ip_address,
                                                                 arp_msg.sender_ethernet_address ) ),
                                      arp_msg.sender_ethernet_address ) );
          }

        } break;

        case ARPMessage::OPCODE_REPLY: {
          // 遍历队列发出旧数据帧
          for ( auto pair : dgram_pending_ ) {
            if ( pair.first == arp_msg.sender_ip_address ) {
              transmit( make_eth_frame(
                EthernetHeader::TYPE_IPv4, serialize( pair.second ), arp_msg.sender_ethernet_address ) );
            }
          }
          auto [head, tail] = dgram_pending_.equal_range( arp_msg.sender_ip_address );
          if ( head != tail )
            dgram_pending_.erase( head, tail );
          // auto [head, tail] = dgram_pending_.equal_range( arp_msg.sender_ip_address );
          // for_each( head, tail, [this, &arp_msg]( auto&& iter ) -> void {
          //   transmit(
          //     make_frame( EthernetHeader::TYPE_IPv4, serialize( iter.second ), arp_msg.sender_ethernet_address )
          //     );
          // } );
          // if ( head != tail )
          //   dgram_pending_.erase( head, tail );

        } break;

        default:
          break;
      }

    } break;

    default:
      break;
  }
}

//! \param[in] ms_since_last_tick the number of milliseconds since the last call to this method
void NetworkInterface::tick( const size_t ms_since_last_tick )
{
  timer_ += ms_since_last_tick;
  for ( auto it = ARP_timing_.begin(); it != ARP_timing_.end(); ) {
    if ( ( it->second += ms_since_last_tick ) > 5000 ) {
      it = ARP_timing_.erase( it );
    } else {
      it++;
    }
  }

  for ( auto it = ARP_table_timing_.begin(); it != ARP_table_timing_.end(); ) {
    if ( ( it->second += ms_since_last_tick ) > 30000 ) {
      ARP_table_.erase( it->first );
      it = ARP_table_timing_.erase( it );
    } else {
      it++;
    }
  }
}

ARPMessage NetworkInterface::make_arp_frame( uint16_t opcode, uint32_t dst_ip, EthernetAddress dst_mac )
{
  return { .opcode = opcode,
           .sender_ethernet_address = ethernet_address_,
           .sender_ip_address = ip_address_.ipv4_numeric(),
           .target_ethernet_address = dst_mac,
           .target_ip_address = dst_ip };
}

EthernetFrame NetworkInterface::make_eth_frame( uint16_t protocol, vector<string> payload, EthernetAddress dst_mac )
{
  return { .header { .dst = dst_mac, .src = ethernet_address_, .type = protocol }, .payload = move( payload ) };
}