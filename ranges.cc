#include <string>
#include <boost/shared_array.hpp>
#include <boost/shared_ptr.hpp>
#include <sys/resource.h>
#include <sys/time.h>
#include <iostream>
#include <iomanip>
#include <sstream>

/*
  g++ -O -o ranges ranges.cc
  ./ranges | tee cranges.txt
  sed -e "s/.*char\[\([0-9]*\)\]).*(\([0-9 \\.]*\))/(\1,\2)/" cranges.txt
*/

using namespace boost;
using namespace std;

#define W 25
#define N 10

class timer
{
public:
  timer(void) { reset(); }
  void reset(void) {
    gettimeofday( &m_time, NULL );
    getrusage( RUSAGE_SELF, &m_usage );
  }
  void report(void) const;
  const rusage &usage(void) const { return m_usage; }
  const timeval &time(void) const { return m_time; }
protected:
  struct timeval m_time;
  struct rusage m_usage;
};

ostream &operator<<( ostream &stream, const timer &t )
{
  struct timeval current;
  gettimeofday( &current, NULL );
  struct rusage actual;
  getrusage( RUSAGE_SELF, &actual );
  struct timeval user;
  struct timeval system;
  struct timeval real;
  timersub( &actual.ru_utime, &t.usage().ru_utime, &user );
  timersub( &actual.ru_stime, &t.usage().ru_stime, &system );
  timersub( &current, &t.time(), &real );
  stream << setw( N ) << ( user.tv_sec + user.tv_usec * 1.0e-6 )
         << ' ' << setw( N - 1 ) << ( system.tv_sec + system.tv_usec * 1.0e-6 )
         << ' ' << setw( N - 1 ) << ( user.tv_sec + user.tv_usec * 1.0e-6 +
                                      system.tv_sec + system.tv_usec * 1.0e-6 )
         << " (" << setw( N - 1 )
         << ( real.tv_sec + real.tv_usec * 1.0e-6 ) << ')';
  return stream;
}

int main(void) {
  int c = 100;
  cout << setw( W + N ) << "user" << setw( N ) << "system"
       << setw( N ) << "total" << setw( N + 2 ) << "real" << endl;
  for (int i=1; i<=250; i++ ) {
    int s = i * 40000;
    boost::shared_array< char > n( new char[s] );
    timer t;
    for ( int i=0; i<c; i++ ) {
      boost::shared_array< char > result( new char[s] );
      char *p = n.get();
      char *qend = result.get() + s;
      for ( char *q = result.get(); q != qend; p++, q++ )
        *q = *p + 1;
    };
    ostringstream o;
    o << "(new char[" << s << "]) + 1";
    cout << setw( W ) << o.str() << t << endl;
  };
  return 0;
};
