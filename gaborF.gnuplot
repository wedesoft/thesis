set terminal postscript eps enhanced color
set output "gaborF.eps"

set title "Fourier transform of Gabor filter"
# set samples 100
# set xtics 1.0
# set ytics 0.1
set xlabel "t"
set ylabel "g(t)"
SIGMA=2.0
K=3.0
G(s)=abs(SIGMA)*exp(-SIGMA**2*(s-K)**2/2)
# set yrange [0:1]
plot [-2*pi:2*pi] G(x)

# transform::fourier(g(t,sigma,k),t,s);
