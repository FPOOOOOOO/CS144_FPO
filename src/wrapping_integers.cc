// /home/cs144/minnow/src/wrapping_integers.cc
#include "wrapping_integers.hh"

using namespace std;

Wrap32 Wrap32::wrap( uint64_t n, Wrap32 zero_point )
{
  // return Wrap32 { zero_point + static_cast<uint32_t>(n) }; // No need，buz it has been reload operator +

  return zero_point + static_cast<uint32_t>( n );
}

uint64_t Wrap32::unwrap( Wrap32 zero_point, uint64_t checkpoint ) const
{
  const uint32_t seqno_offset = this->raw_value_ - zero_point.raw_value_;
  uint64_t n = 0;
  // seqno_offset + (n-1)* 2^32 < checkpoint  < seqno_offset + n * 2^32
  constexpr uint64_t UINT32_SIZE = 1ULL << 32;
  if ( checkpoint > seqno_offset ) {
    n = ( checkpoint - seqno_offset + ( UINT32_SIZE >> 1 ) ) / UINT32_SIZE;
  }

  // UINT32_SIZE/2 - 1   3 * UINT32_SIZE

  return seqno_offset + n * UINT32_SIZE;
}
