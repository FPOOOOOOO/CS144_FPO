///home/cs144/minnow/src/router.cc
#include "router.hh"

#include <iostream>
#include <limits>

using namespace std;

// route_prefix: The "up-to-32-bit" IPv4 address prefix to match the datagram's destination address against
// prefix_length: For this route to be applicable, how many high-order (most-significant) bits of
//    the route_prefix will need to match the corresponding bits of the datagram's destination address?
// next_hop: The IP address of the next hop. Will be empty if the network is directly attached to the router (in
//    which case, the next hop address should be the datagram's final destination).
// interface_num: The index of the interface to send the datagram out on.
void Router::add_route( const uint32_t route_prefix,
                        const uint8_t prefix_length,
                        const optional<Address> next_hop,
                        const size_t interface_num )
{
  cerr << "DEBUG: adding route " << Address::from_ipv4_numeric( route_prefix ).ip() << "/"
       << static_cast<int>( prefix_length ) << " => " << ( next_hop.has_value() ? next_hop->ip() : "(direct)" )
       << " on interface " << interface_num << "\n";

  // Your code here.
  HJYRoute new_route = {route_prefix, prefix_length, next_hop, interface_num};
  routing_table_.push_back(new_route);
  sort(routing_table_.begin(), routing_table_.end());
}

// Go through all the interfaces, and route every incoming datagram to its proper outgoing interface.
void Router::route()
{
  // Your code here.
  // 遍历接口
  for(auto& interf : _interfaces){
    auto& incoming_dgram = interf->datagrams_received();
    //遍历当前接口queue里的数据包
    while(!incoming_dgram.empty()){
      auto& dgram = incoming_dgram.front();
      auto route = longest_prefix_match(dgram.header.dst);
      if(!route || dgram.header.ttl <= 1){
        incoming_dgram.pop();
        continue;
      }
      dgram.header.ttl--;
      dgram.header.compute_checksum();
      interface(route->interface_index)->send_datagram(dgram, route->next_hop.has_value()?route->next_hop.value():Address::from_ipv4_numeric(dgram.header.dst));
      incoming_dgram.pop();
    }
  }
}

uint32_t generate_mask(uint8_t length){
  //return 0xFFFFFFFFu << (32 -length); //length = 0的时候会移动32位超限
  return ~(0xFFFFFFFFu >> length);
}

std::optional<Router::HJYRoute> Router::longest_prefix_match(uint32_t dst_ip){
  std::optional<Router::HJYRoute> best_route = std::nullopt;
  for(const auto& route : routing_table_){
    if((dst_ip & generate_mask(route.length)) == (route.prefix & generate_mask(route.length))){
      if(!best_route || best_route->length < route.length){
        best_route = route;
      }
    }
  }

  return best_route;
}

