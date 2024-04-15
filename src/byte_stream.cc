// //home/cs144/minnow/src/byte_stream.cc
#include "byte_stream.hh"

using namespace std;

ByteStream::ByteStream( uint64_t capacity ) : capacity_( capacity ) {}

bool Writer::is_closed() const
{
  return is_close_;
}

void Writer::push( string data )
{
  // Your code here.
  if(is_closed()) return;

  if(data.size() > available_capacity()) data.resize(available_capacity());

  if(!data.empty()){
      bytes_pushed_ += data.size();
      buffer_.push_back(move(data));
  }

  if(buffer_view_.empty() && !buffer_.empty()){
    buffer_view_ = buffer_.front();
  }
}

void Writer::close()
{
  if(!is_close_){
    is_close_ = true;
    buffer_.emplace_back(string(1,EOF));
  }
}

uint64_t Writer::available_capacity() const
{
  return capacity_ - reader().bytes_buffered();
}

uint64_t Writer::bytes_pushed() const
{
  return bytes_pushed_;
}

bool Reader::is_finished() const
{
  return writer().is_closed() && (bytes_buffered() == 0);
}

uint64_t Reader::bytes_popped() const
{
  return bytes_popped_;
}

string_view Reader::peek() const
{
  return buffer_view_;
}

void Reader::pop( uint64_t len )
{
  if(len > bytes_buffered()) return;
  
  bytes_popped_ += len;
  while(len > 0){
    if(len >= buffer_view_.size()){
      len -= buffer_view_.size();
      buffer_.pop_front();
      buffer_view_ = buffer_.empty() ? ""sv : buffer_.front();
    }else{
      buffer_view_.remove_prefix(len);
      break;
    }
  }

  // while(len > buffer_view_.size()){
  //   len -= buffer_view_.size();
  //   buffer_.pop_front();
  //   buffer_view_ = buffer_.empty() ? ""sv : buffer_.front();
  // }
  // buffer_view_.remove_prefix(len);
}

uint64_t Reader::bytes_buffered() const
{
  return writer().bytes_pushed() - bytes_popped();
}