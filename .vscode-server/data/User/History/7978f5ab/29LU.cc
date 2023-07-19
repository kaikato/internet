#include "wrapping_integers.hh"
#include <cmath>
#include <cstdint>

using namespace std;
#define M ( UINT32_MAX + 1 )

Wrap32 Wrap32::wrap( uint64_t n, Wrap32 zero_point )
{
  return zero_point + n;
}

uint64_t Wrap32::unwrap( Wrap32 zero_point, uint64_t checkpoint ) const
{
  uint64_t unwrapped = ( zero_point.raw_value_ <= this->raw_value_ ) ? this->raw_value_ - zero_point.raw_value_
                                                                     : this->raw_value_ + M - zero_point.raw_value_;
  uint64_t num_mult = floor( ( checkpoint ) / ( M ) );
  unwrapped += ( num_mult ) * ( M );
  if ( checkpoint > unwrapped ) {
    if ( checkpoint - ( unwrapped ) >= unwrapped + M - checkpoint ) {
      unwrapped += M;
    }
  } else if ( unwrapped >= M && unwrapped - checkpoint >= checkpoint - ( unwrapped - M ) ) {
    unwrapped -= M;
  }
  return unwrapped;
}
