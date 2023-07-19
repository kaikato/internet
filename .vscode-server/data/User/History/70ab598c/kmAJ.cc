#include <stdexcept>

#include "byte_stream.hh"

using namespace std;

ByteStream::ByteStream( uint64_t capacity ) : capacity_( capacity ), buffer() {}

void Writer::push( string data )
{
  // Your code here.
  uint32_t i = 0;
  data = data.substr( 0, available_capacity() );
  buffer += data;
  while ( i < data.length() && available_capacity() > 0 ) {
    buffer.push_back( data[i] );
    bytes_pushed_++;
    i++;
  }
}

void Writer::close()
{
  is_closed_ = true;
}

void Writer::set_error()
{
  has_error_ = true;
}

bool Writer::is_closed() const
{
  return is_closed_;
}

uint64_t Writer::available_capacity() const
{
  return capacity_ - bytes_pushed_ + bytes_popped_;
}

uint64_t Writer::bytes_pushed() const
{
  return bytes_pushed_;
}

string_view Reader::peek() const
{
  const string_view sv( buffer );
  return sv;
}

bool Reader::is_finished() const
{
  return ( bytes_buffered() == 0 && is_closed_ );
}

bool Reader::has_error() const
{
  return has_error_;
}

void Reader::pop( uint64_t len )
{
  buffer.erase( 0, len );
  bytes_popped_ += len;
}

uint64_t Reader::bytes_buffered() const
{
  return bytes_pushed_ - bytes_popped_;
}

uint64_t Reader::bytes_popped() const
{
  return bytes_popped_;
}
