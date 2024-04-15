// /home/cs144/minnow/src/reassembler.cc
#include "reassembler.hh"

using namespace std;

void Reassembler::insert( uint64_t first_index, string data, bool is_last_substring )
{
  // Special Condition for is_last_substring to be false
  // When cap = 2;
  // test.execute( Insert { "ab", 0 } );
  // 1. test.execute( Insert { "c", 2 }.is_last() );
  // 2. test.execute( Insert { "abc", 0 }.is_last() );
  // 3 .test.execute( Insert { "", 3 }.is_last() );
  if ( is_last_substring ) {
    if ( first_index >= unassembled_index_ + output_.writer().available_capacity()
         || first_index + data.size() > unassembled_index_ + output_.writer().available_capacity() || ( data.empty() && first_index > unassembled_index_ ) ) {
      closed_ = false;
    } else {
      closed_ = true;
    }
  }
  // Special Condition so can faster return
  // 1. fitst_index out of bound
  // 2. data is empty
  // 3. already in Bytestream
  // 4. no space
  if ( first_index >= unassembled_index_ + output_.writer().available_capacity() || data.empty()
       || first_index + data.size() <= unassembled_index_ || output_.writer().available_capacity() == 0 ) {
    // writer closed
    if ( is_closed_() ) {
      output_.writer().close();
    }
    return;
  }

  const uint64_t cap_reass = output_.writer().available_capacity();
  uint64_t temp_index = first_index;

  // resize the data incase not out of cap
  if ( first_index <= unassembled_index_ ) {
    temp_index = unassembled_index_;
    const uint64_t overlapped_len = temp_index - first_index;
    data = data.substr( overlapped_len, min( cap_reass, data.size() - overlapped_len ) );
  } else {
    if ( data.size() > unassembled_index_ + cap_reass - first_index ) {
      if ( is_last_substring ) {
        closed_ = false;
      }
    }
    data = data.substr( 0, min( unassembled_index_ + cap_reass - first_index, data.size() ) );
  }

  // compare with the rear suybstring
  //|============|
  //                |---|
  //      |----------|
  //    |----｜
  //      ｜？？？｜

  auto rear_it = unassembled_substrings_.lower_bound( temp_index );
  while ( rear_it != unassembled_substrings_.end() ) {
    auto& [rear_index, rear_data] = *rear_it;
    if ( temp_index + data.size() <= rear_index )
      break;
    uint64_t rear_overlapped_len = 0;
    if ( temp_index + data.size() < rear_index + rear_data.size() ) {
      rear_overlapped_len = temp_index + data.size() - rear_index;
    } else {
      rear_overlapped_len = rear_data.size();
    }
    // const uint64_t next_rear = rear_index + rear_data.size() - 1;
    if ( rear_overlapped_len == rear_data.size() ) {
      unassembled_bytes_ -= rear_data.size();
      unassembled_substrings_.erase( rear_index );
    } else {
      data.erase( data.end() - rear_overlapped_len, data.end() );
    }

    rear_it = unassembled_substrings_.lower_bound( temp_index );
  }
  // compare with the front substring
  //                |================|
  //  |-----|
  //            |-------|
  //          |-------------------------|
  if ( first_index > unassembled_index_ ) {
    auto front_it = unassembled_substrings_.upper_bound( temp_index );
    if ( front_it != unassembled_substrings_.begin() ) {
      front_it--;
      auto& [front_index, front_data] = *front_it;
      if ( front_index + front_data.size() > temp_index ) {
        uint64_t front_overlapped_len = 0;
        if ( front_index + front_data.size() <= temp_index + data.size() ) {
          front_overlapped_len = front_index + front_data.size() - temp_index;
        } else {
          front_overlapped_len = data.size();
        }
        // if(front_overlapped_len == data.size()){
        //   //todo

        // }else{
        //   data.erase(data.begin(), data.begin() + front_overlapped_len);
        //   temp_index = temp_index + front_overlapped_len;
        // }
        data.erase( data.begin(), data.begin() + front_overlapped_len );
        temp_index = temp_index + front_overlapped_len;
      }
    }
  }

  if ( data.size() > 0 ) {
    unassembled_bytes_ += data.size();
    unassembled_substrings_.insert( make_pair( temp_index, std::move( data ) ) );
  }

  for ( auto it = unassembled_substrings_.begin(); it != unassembled_substrings_.end(); ) {
    auto& [sub_index, sub_data] = *it;
    if ( sub_index == unassembled_index_ ) {
      const uint64_t prev_bytes_pushed = output_.writer().bytes_pushed();
      output_.writer().push( sub_data );
      const uint64_t bytes_pushed = output_.writer().bytes_pushed();
      if ( bytes_pushed != prev_bytes_pushed + sub_data.size() ) {
        const uint64_t pushed_len = bytes_pushed - prev_bytes_pushed;
        unassembled_index_ += pushed_len;
        unassembled_bytes_ -= pushed_len;
        unassembled_substrings_.insert( make_pair( unassembled_index_, sub_data.substr( pushed_len ) ) );
        unassembled_substrings_.erase( sub_index );
        break;
      }
      unassembled_index_ += sub_data.size();
      unassembled_bytes_ -= sub_data.size();
      unassembled_substrings_.erase( sub_index );
      it = unassembled_substrings_.find( unassembled_index_ ); // 这里应该可以直接放到for循环里 TODO check
    } else {
      break;
    }
  }

  if ( is_closed_() ) {
    output_.writer().close();
  }
}

uint64_t Reassembler::bytes_pending() const
{
  return unassembled_bytes_;
}

bool Reassembler::is_closed_() const
{
  return closed_ && bytes_pending() == 0;
}