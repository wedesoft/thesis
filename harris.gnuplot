set terminal postscript eps enhanced color "NimbusSanL-Regu"18 fontfile "uhvr8a.pfb"
set output "harris.eps"
set title "Corner/Edge Response Function (K=0.2)"
set pm3d map
set samples 50
set isosamples 50
set contour base
set cntrparam level incremental -4, 0.5, 4
set style data lines
set style line 1 lc rgb "black" lt 1 lw 3
set style increment user
unset clabel
set xtics 1.0
set ytics 1.0
set cbtics 1.0
set xlabel "lambda 1"
set ylabel "lambda 2"
K=0.2
splot [0:4] [0:4] x*y-K*(x+y)**2 notitle
#pause -1 "Hit return to continue"
