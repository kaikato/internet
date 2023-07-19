#include <stdexcept>

#include "byte_stream.hh"

using namespace std;

ByteStream::ByteStream( uint64_t capacity ) : capacity_( capacity ), Q() {}

void Writer::push( string data )
{
  // Your code here.
  uint32_t i = 0;
  
  while (i < data.length() && available_capacity() > 0){
    buffer.push_back(data[i]);
    bytes_pushed_++;
    i++;
  }
  
}

void Writer::close()
{
  // Your code here.
  is_closed_ = true;
}

void Writer::set_error()
{
  // Your code here.
  has_error_ = true;
}

bool Writer::is_closed() const
{
  // Your code here.
  return is_closed_;
}

uint64_t Writer::available_capacity() const
{
  // Your code here.
  return capacity_ - bytes_pushed_;
}

uint64_t Writer::bytes_pushed() const
{
  // Your code here.
  return bytes_pushed_;
}

string_view Reader::peek() const
{
  // Your code here.
  //char ch = Q.front();
  //string s = "";
  //s = ch;
  string_view sv (buffer);
  return sv;
  //return buffer;
}

bool Reader::is_finished() const
{
  // Your code here.
  return (bytes_buffered() == 0 && is_closed_);
}

bool Reader::has_error() const
{
  // Your code here.
  return has_error_;
}

void Reader::pop( uint64_t len )
{
  // Your code here.
  buffer.erase(0, len);
  bytes_popped_ += len;
}

uint64_t Reader::bytes_buffered() const
{
  // Your code here.
  return bytes_pushed_ - bytes_popped_;
}

uint64_t Reader::bytes_popped() const
{
  // Your code here.
  return bytes_popped_;
}
