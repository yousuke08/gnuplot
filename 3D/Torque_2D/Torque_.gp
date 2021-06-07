set samples 1000
set border lt -1 lw 3
set grid
#set lmargin 8
#set bmargin 0
set key

set xr[0.8:1.2]
set yr[0.8:1.2]
set zr[-0.1:0.1]
set format x "%1.2f"
set format y "%1.2f"
set format z "%1.2f"
set xtics .05
set mxtics 1
set ytics .05
set mytics 1
set ztics .001
set mztics 1
set xlabel "x" offset 0,0
set ylabel "y" offset -1,0
set zlabel "Torque [Nm]" offset -1,0

set isosamples 50,50
set view map
set size square
set cbrange[-0.05:0.05]
set palette defined (-1 "blue", 0 "white", 1 "red")

if(exist("n")==0 || n<0.0) n = n0  # ループ変数の初期化

omega = 2*pi*50
theta = n
array Iuvw[3]
U = 1.0
V = 0.8
W = 0.8
P = 2
Phi = 0.137
Ld = 10.2e-3
Lq = 20.1e-3

t = 0.005

u(x,y) = sin(omega*t)
v(x,y) = x*sin(omega*t)
w(x,y) = y*sin(omega*t)
#v((x,y)) = Iuvw[2]*sin(omega*t + 2.0/3.0*pi)
#w(x,y) = Iuvw[3]*sin(omega*t - 2.0/3.0*pi)

a(x,y) = 2.0/3.0 * ( u(x,y) - v(x,y)*1.0/2.0 - w(x,y)*1.0/2.0)
b(x,y) = 2.0/3.0 * ( v(x,y)*sqrt(3)/2.0 - w(x,y)*sqrt(3)/2.0)
z(x,y) = 2.0/3.0 * 1.0/2.0 * (u(x,y) + v(x,y) + w(x,y))

d(x,y) = a(x,y)*cos(theta) - b(x,y)*sin(theta)
q(x,y) = a(x,y)*sin(theta) + b(x,y)*cos(theta)
#d(x,y) = 2.0/3.0 * ( u(x,y)*cos(omega*t) + v(x,y)*(-0.5*cos(omega*t) + sqrt(3)/2.0*sin(omega*t)) + w(x,y)*(-0.5*cos(omega*t) - sqrt(3)/2.0*sin(omega*t)))
#q(x,y) = 2.0/3.0 * (-u(x,y)*sin(omega*t) + v(x,y)*( 0.5*sin(omega*t) + sqrt(3)/2.0*cos(omega*t)) + w(x,y)*( 0.5*sin(omega*t) - sqrt(3)/2.0*cos(omega*t)))
T(x,y) = 3/2 * P * (Phi*q(x,y) + (Ld-Lq)*d(x,y)*q(x,y))

set label 1 sprintf("{/symbol q}_e = %.0f [deg]", 360.0*theta/2.0/pi) left at screen 0.6,0.9
splot T(x,y) with pm3d

n = n + dn
if (n < n1) reread
undefine n