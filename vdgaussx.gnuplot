set terminal postscript eps enhanced color "NimbusSanL-Regu"30 fontfile "uhvr8a.pfb"
set output "vdgaussx.eps"
set title "1th component of Gauss gradient"
set isosample 30
set hidden
set pm3d
set xtics 1.0
set ytics 1.0
set ztics 0.05
set cbtics 0.1
set xlabel "x"
set ylabel "y"
set zlabel "z"
SIGMA=1.0
dgaussx(x,y)=1.0/((SIGMA**4)*2*pi)*x*exp(-(x**2+y**2)/(2*(SIGMA**2)))
set zrange [dgaussx(-SIGMA,0):dgaussx(SIGMA,0)]
splot [-3:3] [-3:3] dgaussx(x,y)
# pause -1 "Hit return to continue"
