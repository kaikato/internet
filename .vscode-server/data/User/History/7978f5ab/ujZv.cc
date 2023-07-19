#include "wrapping_integers.hh"
#include <cmath>
#include <cstdint>

using namespace std;
#define M 4294967296

Wrap32 Wrap32::wrap( uint64_t n, Wrap32 zero_point )
{
  return zero_point + n;
}

uint64_t Wrap32::unwrap( Wrap32 zero_point, uint64_t checkpoint ) const
{
  uint64_t unwrapped = 0;
  if ( zero_point.raw_value_ <= this->raw_value_ ) {
    unwrapped = this->raw_value_ - zero_point.raw_value_;
  } else {
    unwrapped = this->raw_value_ + M - zero_point.raw_value_;
  }
  if ( checkpoint < unwrapped ) {
    return unwrapped;
  }
  uint64_t num_mult = floor( ( checkpoint ) / ( M ) );
  unwrapped += ( num_mult ) * ( M );
  if ( checkpoint > unwrapped && checkpoint - ( unwrapped ) >= unwrapped + M - checkpoint ) {

    unwrapped += M;

  } else if ( unwrapped >= M && unwrapped - checkpoint >= checkpoint - ( unwrapped - M ) ) {
    unwrapped -= M;
  }
  return unwrapped;
}
