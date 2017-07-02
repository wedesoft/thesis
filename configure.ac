#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
AC_INIT(aclocal.m4)
AM_INIT_AUTOMAKE(thesis,0.1)

# Checks for programs.
AM_SANITY_CHECK
AC_PROG_LN_S
AC_CHECK_PROG(PDFLATEX,pdflatex,pdflatex)
AC_CHECK_PROG(PDFFONTS,pdffonts,pdffonts)
AC_CHECK_PROG(THUMBPDF,thumbpdf,thumbpdf)
AC_CHECK_PROG(MAKEINDEX,makeindex,makeindex)
AC_CHECK_PROG(BIBTEX,bibtex,bibtex)
AC_CHECK_PROG(EPS2PDF,epstopdf,epstopdf)
AC_CHECK_PROG(GNUPLOT,gnuplot,gnuplot)
AC_CHECK_PROG(DIA,dia,dia)
AC_CHECK_PROG(CONVERT,convert,convert)
AC_CHECK_PROG(INKSCAPE,inkscape,inkscape)
AC_CHECK_PROG(FIG2DEV,fig2dev,fig2dev)
AC_CHECK_PROG(RUBY,ruby,ruby)
AC_CHECK_PROG(RAKE,rake,rake)
AC_CHECK_PROG(POVRAY,povray,povray)
AC_CHECK_PROG(MENCODER,mencoder,mencoder)
AC_CHECK_PROG(MPLAYER,mplayer,mplayer)
AC_CHECK_PROG(DOT,dot,dot)
AC_PROG_CXX

# Checks for Hornetseye.
AC_ARG_WITH(hornetseye-dir,
       [  --with-hornetseye-dir=DIR  specify directory of Hornetseye build ],
       [  local_hornetseye_prefix="$withval" ],
       [  local_hornetseye_prefix="\
            /home/engjw/test/hornetseye \
            /home/jan/test/hornetseye\
         " ] )
for i in $local_hornetseye_prefix; do
   if test -z "$HORNETSEYE"; then
      if test -f "$i/hornetseye/hornetseye.so"; then
         HORNETSEYE="$i"
      fi
   fi
done
if test -z "$HORNETSEYE"; then
   AC_MSG_ERROR([Could not locate Hornetseye build. Use option --with-hornetseye-dir=DIR.])
fi
AC_SUBST(HORNETSEYE)

# Check for Malloc
AC_ARG_WITH(malloc-dir,
       [  --with-malloc-dir=DIR  specify directory of malloc build ],
       [  local_malloc_prefix="$withval" ],
       [  local_malloc_prefix="\
            /home/engjw/test/hornetseye2/malloc \
            /home/jan/test/hornetseye2/malloc \
         " ] )
for i in $local_malloc_prefix; do
   if test -z "$MALLOC"; then
      if test -f "$i/lib/malloc_ext.rb"; then
         MALLOC="$i"
      fi
   fi
done
if test -z "$MALLOC"; then
   AC_MSG_ERROR([Could not locate malloc build. Use option --with-malloc-dir=DIR.])
fi
AC_SUBST(MALLOC)

# Check for Multiarray
AC_ARG_WITH(multiarray-dir,
       [  --with-multiarray-dir=DIR  specify directory of multiarray build ],
       [  local_multiarray_prefix="$withval" ],
       [  local_multiarray_prefix="\
            /home/engjw/test/hornetseye2/multiarray \
            /home/jan/test/hornetseye2/multiarray \
         " ] )
for i in $local_multiarray_prefix; do
   if test -z "$MULTIARRAY"; then
      if test -f "$i/lib/multiarray.rb"; then
         MULTIARRAY="$i"
      fi
   fi
done
if test -z "$MULTIARRAY"; then
   AC_MSG_ERROR([Could not locate multiarray build. Use option --with-multiarray-dir=DIR.])
fi
AC_SUBST(MULTIARRAY)

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
AC_OUTPUT(Makefile)
