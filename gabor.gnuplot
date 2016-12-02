set terminal postscript eps enhanced color
set output "gabor.eps"

set title "Gabor filter"
# set samples 100
# set xtics 1.0
# set ytics 0.1
set xlabel "t"
set ylabel "g(t)"
SIGMA=2.0
K=3.0
g(t)=1/(sqrt(2*pi)*SIGMA)*exp(-t**2/(2*SIGMA**2))*exp({0,1}*K*t)
# set yrange [0:1]
plot [-6:6] real(g(x)),imag(g(x))

# g:=(t,sigma,k)->(1/sqrt(2*PI))*exp(-t^2/(2*sigma^2))*exp(-I*k*t);
