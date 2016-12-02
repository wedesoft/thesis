/* This file is generated automatically. It is pointless to edit this file. */
#include <ruby.h>
#include <math.h>

inline void *mallocToPtr( VALUE rbMalloc )
{
  void *retVal; Data_Get_Struct( rbMalloc, void, retVal );
  return retVal;
}

static unsigned long make_mask( unsigned long x )
{
  x = x | x >> 1;
  x = x | x >> 2;
  x = x | x >> 4;
  x = x | x >> 8;
  x = x | x >> 16;
#if 4 < SIZEOF_LONG
  x = x | x >> 32;
#endif
  return x;
}

static unsigned long limited_rand(unsigned long limit)
{
  int i;
  unsigned long mask, val;
  if (limit < 2) return 0;
  mask = make_mask(limit - 1);
  retry:
  val = 0;
  for (i = SIZEOF_LONG / 4 - 1; 0 <= i; i--) {
    if ((mask >> (i * 32)) & 0xffffffff) {
      val |= (unsigned long)rb_genrand_int32() << (i * 32);
      val &= mask;
      if (limit <= val)
        goto retry;
    };
  };
  return val;
}

VALUE _Store0Lambda0Variable60INDEX0Variable20INT1112Lookup0Variable0050UBYTE112Variable60INDEX0Variable20INT1112Variable10INT1112490Lambda0Variable60INDEX0Variable50INT1112Lookup0Variable3050UBYTE112Variable60INDEX0Variable50INT1112Variable40INT11111( unsigned char * param0, int param1, int param2, unsigned char * param3, int param4, int param5 )
{
printf( "hi\n" );
  unsigned char *p;
  unsigned char *pend = param3 + param2;
  unsigned char *q = param0;
  for (p = param3; p != pend; p++)
    *q = -*p;
  return;
}

VALUE wrap_store0lambda0variable60index0variable20int1112lookup0variable0050ubyte112variable60index0variable20int1112variable10int1112490lambda0variable60index0variable50int1112lookup0variable3050ubyte112variable60index0variable50int1112variable40int11111( int argc, VALUE *argv, VALUE rbSelf )
{
  _Store0Lambda0Variable60INDEX0Variable20INT1112Lookup0Variable0050UBYTE112Variable60INDEX0Variable20INT1112Variable10INT1112490Lambda0Variable60INDEX0Variable50INT1112Lookup0Variable3050UBYTE112Variable60INDEX0Variable50INT1112Variable40INT11111( (unsigned char *)mallocToPtr( argv[0] ), NUM2INT( argv[1] ), NUM2INT( argv[2] ), (unsigned char *)mallocToPtr( argv[3] ), NUM2INT( argv[4] ), NUM2INT( argv[5] ) );
  return Qnil;
}

void Init_breakdown(void)
{
  VALUE mHornetseye = rb_define_module("Hornetseye");
  VALUE cGCCCache = rb_define_class_under(mHornetseye, "GCCCache", rb_cObject);
  rb_define_singleton_method(cGCCCache, "_Store0Lambda0Variable60INDEX0Variable20INT1112Lookup0Variable0050UBYTE112Variable60INDEX0Variable20INT1112Variable10INT1112490Lambda0Variable60INDEX0Variable50INT1112Lookup0Variable3050UBYTE112Variable60INDEX0Variable50INT1112Variable40INT11111",
                             RUBY_METHOD_FUNC( wrap_store0lambda0variable60index0variable20int1112lookup0variable0050ubyte112variable60index0variable20int1112variable10int1112490lambda0variable60index0variable50int1112lookup0variable3050ubyte112variable60index0variable50int1112variable40int11111 ), -1); 

}
