#include "wrapping_integers.hh"
#include <cstdint>

using namespace std;
enum
{
  UINT32_BLOCK_SIZE = static_cast<uint64_t>( UINT32_MAX ) + 1
};

Wrap32 Wrap32::wrap( uint64_t n, Wrap32 zero_point )
{
  return zero_point + n;
}

uint64_t Wrap32::unwrap( Wrap32 zero_point, uint64_t checkpoint ) const
{
  uint64_t unwrapped = ( zero_point.raw_value_ <= this->raw_value_ )
                         ? this->raw_value_ - zero_point.raw_value_
                         : this->raw_value_ + UINT32_BLOCK_SIZE - zero_point.raw_value_;
  const uint64_t num_blocks_to_checkpoint = checkpoint / UINT32_BLOCK_SIZE;
  unwrapped += num_blocks_to_checkpoint * UINT32_BLOCK_SIZE;
  if ( checkpoint < unwrapped && unwrapped >= UINT32_BLOCK_SIZE
       && unwrapped - checkpoint >= checkpoint - ( unwrapped - UINT32_BLOCK_SIZE ) ) {
    unwrapped -= UINT32_BLOCK_SIZE;
  } else if ( checkpoint > unwrapped && checkpoint - unwrapped >= unwrapped + UINT32_BLOCK_SIZE - checkpoint ) {
    unwrapped += UINT32_BLOCK_SIZE;
  }
  return unwrapped;
}
