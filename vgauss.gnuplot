set terminal postscript eps enhanced color "NimbusSanL-Regu"22 fontfile "uhvr8a.pfb"
set output "vgauss.eps"
set title "2D Gaussian blur filter"
set isosample 50
set hidden
set pm3d
set xtics 1.0
set ytics 1.0
set ztics 0.2
set cbtics 0.04
set xlabel "x"
set ylabel "y"
set zlabel "z"
SIGMA=1.0
gauss(x,y)=1.0/((SIGMA**2)*2*pi)*exp(-(x**2+y**2)/(2*(SIGMA**2)))
set zrange [0:gauss(0,0)]
splot [-3:3] [-3:3] gauss(x,y)
#pause -1 "Hit return to continue"

