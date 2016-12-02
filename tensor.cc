#include <string>
#include <boost/shared_array.hpp>
#include <boost/shared_ptr.hpp>
#include <sys/resource.h>
#include <sys/time.h>
#include <iostream>
#include <iomanip>

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
  int v = 100;
  int w = 500;
  int c = 1000;
  boost::shared_array< float > n( new float[ v * v ] );
  boost::shared_array< float > m( new float[ w * w ] );
  cout << setw( W + N ) << "user" << setw( N ) << "system"
       << setw( N ) << "total" << setw( N + 2 ) << "real" << endl;
  {
    timer t;
    for ( int i=0; i<c; i++ ) {
      boost::shared_array< float > m( new float[ w * w ] );
      float *pend = m.get() + w * w;
      for ( float *p = m.get(); p != pend; p++ )
        *p = 0.0;
    };
    cout << setw( W ) << "calloc" << t << endl;
  };
  {
    timer t;
    for ( int i=0; i<c; i++ ) {
      int s = w * w;
      float *pend = m.get() + w * w;
      for ( float *p = m.get(); p != pend; p++ )
        *p = 1.0;
    };
    cout << setw( W ) << "m.fill!( 1.0 )"  << t << endl;
  };
  {
    timer t;
    for ( int i=0; i<c; i++ ) {
      boost::shared_array< float > result( new float[ w * w ] );
      int s = w * w;
      float *p = m.get();
      float *qend = result.get() + w * w;
      for ( float *q = result.get(); q != qend; p++, q++ )
        *q = *p + *p;
    };
    cout << setw( W ) << "m + m" << t << endl;
  };
  {
    timer t;
    for ( int i=0; i<c; i++ ) {
      boost::shared_array< float > result( new float[ w * w ] );
      int s = w * w;
      float *p = m.get();
      float *qend = result.get() + w * w;
      for ( float *q = result.get(); q != qend; p++, q++ )
        *q = *p * *p;
    };
    cout << setw( W ) << "m * m" << t << endl;
  };
  {
    timer t;
    for ( int i=0; i<c; i++ ) {
      boost::shared_array< float > result( new float[ w * w ] );
      int s = w * w;
      float *p = m.get();
      float *qend = result.get() + w * w;
      for ( float *q = result.get(); q != qend; p++, q++ )
        *q = *p + 1;
    };
    cout << setw( W ) << "m + 1" << t << endl;
  };
  {
    timer t;
    for ( int i=0; i<c; i++ ) {
      boost::shared_array< float > result( new float[ w * w ] );
      int s = w * w;
      float *p = m.get();
      float *qend = result.get() + w * w;
      for ( float *q = result.get(); q != qend; p++, q++ )
        *q = *p * 2;
    };
    cout << setw( W ) << "m * 2" << t << endl;
  };
  {
    timer t;
    for ( int l=0; l<c; l++ ) {
      boost::shared_array< float > res( new float[ v * v ] );
      float *r = res.get();
      float *p = n.get();
      float *q = n.get();
      float *pend = p + v;
      while ( p != pend ) {
        float *q2 = q;
        float *q2end = q2 + v * v;
        while ( q2 != q2end ) {
          float *p3 = p;
          float *q3 = q2;
          float *q3end = q3 + v;
          float value = 0.0;
          while ( q3 != q3end ) {
            value += *p3 * *q3;
            p3+=v;
            q3++;
          };
          *r++ = value;
          q2+=v;
        };
        p++;
      };
    };
    cout << setw( W ) << "r[i,k] = n[i,j] * n[j,k]" << t << endl;
  };
  {
    timer t;
    for ( int l=0; l<c; l++ ) {
      boost::shared_array< float > res( new float[ w ] );
      float *r = res.get();
      float *p = m.get();
      float *pend = p + w * w;
      while ( p != pend ) {
        float *p2 = p;
        float *p2end = p2 + w;
        float value = 0.0;
        while ( p2 != p2end ) {
          value += *p2++;
        };
        *r++ = value;
        p += w;
      };
    };
    cout << setw( W ) << "r[j] = m[i,j]" << t << endl;
  };
  {
    timer t;
    for ( int l=0; l<c; l++ ) {
      boost::shared_array< float > res( new float[ w ] );
      float *r = res.get();
      float *p = m.get();
      float *pend = p + w;
      while ( p != pend ) {
        float *p2 = p;
        float *p2end = p2 + w * w;
        float value = 0.0;
        while ( p2 != p2end ) {
          value += *p2;
          p2 += w;
        };
        *r++ = value;
        p++;
      };
    };
    cout << setw( W ) << "r[i] = m[i,j]" << t << endl;
  };
  return 0;
};
