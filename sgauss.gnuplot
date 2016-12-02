set terminal postscript eps enhanced color "NimbusSanL-Regu"22 fontfile "uhvr8a.pfb"
set output "sgauss.eps"
set title "1D Gaussian blur filter"
set samples 50
set xtics 1.0
set ytics 0.1
set xlabel "x"
set ylabel "y"
set style line 1 lc rgb "red" lt 1 lw 3
set style line 2 lc rgb "green" lt 1 lw 3
set style increment user
SIGMA=1.0
gauss(x)=1/(SIGMA*sqrt(2*pi))*exp(-x**2/(2*(SIGMA**2)))
set yrange [-0.1:0.5]
plot [-3:3] gauss(x) with lines linestyle 1, "sgauss.dat" notitle with boxes linestyle 2
#pause -1 "Hit return to continue"

