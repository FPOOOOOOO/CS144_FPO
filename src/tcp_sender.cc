/// home/cs144/minnow/src/tcp_sender.cc
#include "tcp_sender.hh"
#include "tcp_config.hh"

using namespace std;

uint64_t TCPSender::sequence_numbers_in_flight() const
{
  // Your code here.
  return sequence_numbers_in_flight_cnt_;
}

uint64_t TCPSender::consecutive_retransmissions() const
{
  // Your code here.
  return consecutive_retransmissions_cnt_;
}

void TCPSender::push( const TransmitFunction& transmit )
{
  // Your code here.
  //(void)transmit;
  Reader& bytestream_reader = input_.reader();
  fin_flag_ |= bytestream_reader.is_finished();
  if ( sent_fin_ )
    return;
  uint64_t window_size_push_ = window_size_ == 0 ? 1 : window_size_;
  // 不断组装并发送分组数据报，直到达到窗口上限或没数据读，并且在 FIN 发出后不再尝试组装报文
  for ( string payload {}; sequence_numbers_in_flight_cnt_ < window_size_push_ && !sent_fin_; payload.clear() ) {
    string_view now_bytes_seg = bytestream_reader.peek();
    // string_view test = {};
    if ( sent_syn_ && now_bytes_seg.empty() && !fin_flag_ ) {
      break;
    }

    while ( payload.size() + sequence_numbers_in_flight_cnt_ + ( !sent_syn_ ) < window_size_push_
            && payload.size() < TCPConfig::MAX_PAYLOAD_SIZE ) {
      if ( now_bytes_seg.empty() || fin_flag_ )
        break;

      uint64_t available_size
        = min( TCPConfig::MAX_PAYLOAD_SIZE - payload.size(),
               window_size_push_ - ( payload.size() + sequence_numbers_in_flight_cnt_ + ( !sent_syn_ ) ) );

      if ( now_bytes_seg.size() > available_size ) {
        now_bytes_seg.remove_suffix( now_bytes_seg.size() - available_size );
      }

      payload.append( now_bytes_seg );
      bytestream_reader.pop( now_bytes_seg.size() );
      fin_flag_ |= bytestream_reader.is_finished();
      now_bytes_seg = bytestream_reader.peek();
    }

    TCPSenderMessage noww_msg;
    noww_msg.seqno = Wrap32::wrap( next_absolute_seqno_, isn_ );
    noww_msg.SYN = sent_syn_ ? syn_flag_ : true;
    noww_msg.FIN = fin_flag_;
    noww_msg.payload = payload;
    noww_msg.RST = input_.reader().has_error();

    TCPSenderMessage& now_msg = outstanding_seg_.emplace( noww_msg );

    // auto& now_msg = outstanding_seg_.emplace(
    //   make_message( next_absolute_seqno_, move( payload ), sent_syn_ ? syn_flag_ : true, fin_flag_ ) );

    uint8_t margin = sent_syn_ ? syn_flag_ : 0;
    if ( fin_flag_
         && ( now_msg.sequence_length() - margin ) + sequence_numbers_in_flight_cnt_ > window_size_push_ ) {
      now_msg.FIN = false;
    } else if ( fin_flag_ ) {
      sent_fin_ = true;
    }

    uint64_t correct_len = now_msg.sequence_length() - margin;

    sequence_numbers_in_flight_cnt_ += correct_len;
    next_absolute_seqno_ += correct_len;
    sent_syn_ = true;
    transmit( now_msg );

    if ( correct_len )
      is_active_ = true;
  }
}

TCPSenderMessage TCPSender::make_empty_message() const
{
  // Your code here.
  TCPSenderMessage empty_msg;
  empty_msg.seqno = Wrap32::wrap( next_absolute_seqno_, isn_ );
  empty_msg.RST = input_.reader().has_error();
  return empty_msg;
}

// TCPSenderMessage TCPSender::make_empty_message() const
// {
//   // Your code here.
//   return make_message( next_absolute_seqno_, {}, false );
// }

void TCPSender::receive( const TCPReceiverMessage& msg )
{
  // Your code here.
  //(void)msg;
  window_size_ = msg.window_size;
  if ( !msg.ackno.has_value() ) {
    if ( msg.window_size == 0 ) {
      input_.set_error();
    }
    return;
  }

  uint64_t expecting_seqno = msg.ackno->unwrap( isn_, next_absolute_seqno_ );
  if ( expecting_seqno > next_absolute_seqno_ )
    return;

  bool is_acked = false;
  while ( !outstanding_seg_.empty() ) {
    TCPSenderMessage buffered_msg = outstanding_seg_.front();
    const uint64_t final_seqo = acked_seqno_ + buffered_msg.sequence_length() - buffered_msg.SYN;

    if ( expecting_seqno <= acked_seqno_ || expecting_seqno < final_seqo )
      break;

    is_acked = true;
    sequence_numbers_in_flight_cnt_ -= buffered_msg.sequence_length() - syn_flag_;
    acked_seqno_ += buffered_msg.sequence_length() - syn_flag_;

    syn_flag_ = sent_syn_ ? syn_flag_ : expecting_seqno <= next_absolute_seqno_;

    outstanding_seg_.pop();
  }

  if ( is_acked ) {
    if ( outstanding_seg_.empty() ) {
      RTO_timeout_ = initial_RTO_ms_;
      timer_ = 0;
      consecutive_retransmissions_cnt_ = 0;
      is_active_ = false;
    } else {
      RTO_timeout_ = initial_RTO_ms_;
      timer_ = 0;
      is_active_ = true;
      consecutive_retransmissions_cnt_ = 0;
    }
  }
}

void TCPSender::tick( uint64_t ms_since_last_tick, const TransmitFunction& transmit )
{
  // Your code here.
  // (void)ms_since_last_tick;
  // (void)transmit;
  // (void)initial_RTO_ms_;
  timer_ += is_active_ ? ms_since_last_tick : 0;

  if ( timer_ >= RTO_timeout_ ) {
    transmit( outstanding_seg_.front() );

    if ( window_size_ ) {
      RTO_timeout_ *= 2;
      consecutive_retransmissions_cnt_++; // should be here maybe？
    }

    timer_ = 0;
  }
}

TCPSenderMessage TCPSender::make_message( uint64_t seqno, string payload, bool SYN, bool FIN ) const
{
  return { .seqno = Wrap32::wrap( seqno, isn_ ),
           .SYN = SYN,
           .payload = move( payload ),
           .FIN = FIN,
           .RST = input_.reader().has_error() };
}