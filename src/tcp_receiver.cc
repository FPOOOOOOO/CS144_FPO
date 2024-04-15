// /home/cs144/minnow/src/tcp_receiver.cc
#include "tcp_receiver.hh"

using namespace std;

void TCPReceiver::receive( TCPSenderMessage message )
{
  if ( message.RST ) {
    reassembler_.reader().set_error();
    return;
  }
  // not begin capture the SYN
  if ( !set_syn_ ) {
    if ( !message.SYN ) {
      return; // SYN not start
    }
    ISN_ = message.seqno; // No.1 SYN's seqno = ISN_
    this_time_data_len = reassembler_.writer().bytes_pushed();
    set_syn_ = true;
  }

  const uint64_t check_point = reassembler_.writer().bytes_pushed() + 1;
  const uint64_t abs_seqno = message.seqno.unwrap( ISN_, check_point );
  const uint64_t stream_index = abs_seqno - 1 + message.SYN;
  reassembler_.insert( stream_index, message.payload, message.FIN );
}

TCPReceiverMessage TCPReceiver::send() const
{
  TCPReceiverMessage back_msg {};

  if ( reassembler_.writer().has_error() ) {
    back_msg.RST = true;
  }

  const uint16_t window_size
    = reassembler_.writer().available_capacity() > UINT16_MAX ? UINT16_MAX : reassembler_.writer().available_capacity();
  back_msg.window_size = window_size;

  if ( !set_syn_ ) {
    return back_msg;
  }

  //uint64_t back_msg_seqno = reassembler_.writer().bytes_pushed() + 1; // 1 for SYN. means like a offset from the ISN_, how many bytes has been pushed ,bytesteam里没有SYN
  uint64_t back_msg_seqno = reassembler_.writer().bytes_pushed() - this_time_data_len + 1;

  if ( reassembler_.writer().is_closed() ) {
    back_msg_seqno++;
  }

  back_msg.ackno = ISN_ + back_msg_seqno;  //So here is the next TCP Segment head index that we need, is the ISN_(absolute) + previous pushed into the bytestream
  //  0                          99  700                             899
  // SYN -------- 100 ---------- FIN SYN ------------ 200 ---------- FIN
  //  |                               |-----70-----|
  // ISN_= 0                      ISN_=700        bytes_pushed() = 70 √  从上一个SYN开始计算
  //                                              bytes_pushed() = 170 X              
  // like every time a message from SYN - FIN finished, bottlm layer of bytestream closed, so the paras about bytestream erased.
  // 问题在于，收到FIN后，会close bytestream，这个close代表什么？

  return back_msg;
}