# generate  Fig2, Fig.3, Fig.4 and Fig.5 from Backer2005
# J. Chem. Phys. 122, 154503 (2005)
set xlabel "x"
set ylabel "v_{y}, velosity" offset character 2.5, 0
set y2label "tau_{xy}, shear stress"

set key left

L = 6.0
rho = 6.0
gz = 0.0557
eta = 2.09 # page 154503-4
par(x) = rho*gz/(2*eta)*(x*L - x**2) # Eq (2)
f(x) = -par(x)*(x<L)*(x>0) +par(x-L)*(x>L)*(x<2*L)

set term x11 1
plot [0:2*L] \
     "vy.av.dim3" u 2:4 w lp t "v_{y}", \
     "sxy.av.dim3" u 2:4 w lp t "tau_{xy}", \
     f(x) t "Backer2005"
call "saver.gp" "av"

set term x11 3
set xlabel "x"
set ylabel "T, temperature"
unset y2label
plot [][0.40:0.60] "simtemp.av.dim3" u 2:4 w lp t "DPD temperature", \
     0.5 t "theoretical"
call "saver.gp" "temp"

set term x11 2
set xlabel "x"
set ylabel "rho, density"
unset y2label
plot [][5:7] "rho.av.dim3" u 2:4 w lp t "density", \
     6.0 t "average density"
call "saver.gp" "rho"