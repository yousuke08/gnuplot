set term pdfcairo enhanced size 3in, 2in
#set term png enhanced
set output "fullBridge_waveform.pdf"
#set output "fullBridge_waveform.png"
set datafile separator ","

set tics font "Times new roman, 9"
set key font "Times new roman, 12"
set title font "Times new roman, 12"
set label 1 font "Times new roman, 12"
set label 2 font "Times new roman, 12"
set xlabel font "Times new roman, 12"
set ylabel font "Times new roman, 12"

set samples 1000
set border lt -1 lw 3
set grid
#set lmargin 8
#set bmargin 0
#set key horizontal outside center top
unset key
set style arrow 1 size character 0.5,20 filled heads linewidth 2

##############################ファイルのPath
f = "../dat/UVW_T.csv"

set xr[0:20]
set yr[-0.3:0.3]
set format x "%.f"
set format y "%.1f"
set xtics 5
set mxtics 5
set ytics 0.1
set mytics 1
set xlabel "Time t [ms]"offset 0,0
set ylabel "Torque {/Symbol:Italic t} [Nm]" offset 10,0

set ylabel offset 0,0

#set key
#plot f every 1::16 using (($1-TIME_OFFSET)*1000):($0==TIME_OFFSET ? (old = ((Ts*$2 + Tc*$2)/(Ts + Tc)), old) : (old = ((Ts*$2 + Tc*old)/(Ts + Tc)), old)) with line lt -1


#plot f using (($1-TIME_OFFSET)*1000):3 with line lt -1
plot f using ($1*1000):2 with line lt -1 lw 2
     #f using ($1*1000): with line lt -1 lw 2 title "Proposed"
##############################余白の設定
# N = 4                           # グラフの数

# tms = 0.98                      # 上余白
# bms = 0.1                       # 下余白
# lms = 0.1                       # 左余白
# rms = 0.97                      # 右余白
# hms = (1-(1-tms)-bms)/N*0.85    # グラフあたりの幅
# sms = (1-(1-tms)-bms)/N*0.15    # グラフの間隔

# ##############################LPFの設定
# stats f using 2 every ::8::8 nooutput
# Ts = STATS_mean
# Tc = (1.0/100000.0/2.0/pi)
# old = 0

# ##############################ファイルの解析
# stats f using 1 every ::16::16 nooutput
# TIME_OFFSET = STATS_mean
# print(TIME_OFFSET)
# stats f every 1::16 using ($1==TIME_OFFSET ? (old = ((Ts*$5 + Tc*$5)/(Ts + Tc)), 1/0) : (old = ((Ts*$5 + Tc*old)/(Ts + Tc)), (old-1.5)/2.0)) name "T" nooutput
# T_max(x) = T_max
# T_min(x) = T_min

# set multiplot
# ##############################plot1
# set lmargin screen lms
# set rmargin screen rms
# set tmargin screen tms
# set bmargin screen tms - hms

# set label 1 "{/Times-Italic v_{ac}} [V]" at graph 0.02,0.85 left


# ##############################plot2
# set lmargin screen lms
# set rmargin screen rms
# set tmargin screen tms - hms - sms
# set bmargin screen tms - 2*hms - sms

# set label 1 "{/Times-Italic i_{ac}} [A]" at graph 0.02,0.85 left

# #set xr[0:0.050]
# set yr[-10:10]
# set format x ""
# set format y "%3.0f"
# set xtics 5
# set mxtics 5
# set ytics 5
# set mytics 5
# # set xlabel offset 0,-1
# set ylabel "{/Times-Italic i_{ac}} [A]" offset 0.2,0
# # set ylabel offset 0,-1
# #plot f every 10::16 using (($1-TIME_OFFSET)*1000):4 with line lt -1
# old = 0
# plot f every 1::16 using (($1-TIME_OFFSET)*1000):($0==TIME_OFFSET ? (old = ((Ts*$4 + Tc*$4)/(Ts + Tc)), old) : (old = ((Ts*$4 + Tc*old)/(Ts + Tc)), old)) with line lt -1

# ##############################plot3
# set lmargin screen lms
# set rmargin screen rms
# set tmargin screen tms - 2*hms - 2*sms
# set bmargin screen tms - 3*hms - 2*sms

# set label 1 "{/Times-Italic V_{dc}} [V]" at graph 0.02,0.55 left

# #set xr[0:0.050]
# set yr[100:300]
# set format x ""
# set format y "%3.0f"
# set xtics 5
# set mxtics 5
# set ytics 100
# set mytics 1
# # set xlabel offset 0,-1
# set ylabel "{/Times-Italic V_{dc}} [V]" offset 0.2,0
# # set ylabel offset 0,-1
# #plot f every 10::16 using (($1-TIME_OFFSET)*1000):3 with line lt -1
# old = 0
# plot f every 1::16 using (($1-TIME_OFFSET)*1000):($1==TIME_OFFSET ? (old = ((Ts*$3 + Tc*$3)/(Ts + Tc)), old) : (old = ((Ts*$3 + Tc*old)/(Ts + Tc)), old)) with line lt -1

# ##############################plot4
# set lmargin screen lms
# set rmargin screen rms
# set tmargin screen tms - 3*hms - 3*sms
# set bmargin screen tms - 4*hms - 3*sms

# set label 1 "{/Times-Italic T} [Nm]" at graph 0.02,0.85 left
# set arrow 1 from 45,T_max to 45,T_min arrowstyle 1
# set label 2 sprintf("%.2f", T_max-T_min) at first 46,0.1 left

# set xr[0:50]
# set yr[-0.15:.15]
# set format x "%3.0f"
# set format y "%3.1f"
# set xtics 5
# set mxtics 5
# set ytics .1
# set mytics 2
# set xlabel "{/Times-Italic t} [ms]" offset 0,0.8
# #set xlabel offset 0,-1
# set ylabel "{/Times-Italic T} [Nm]" offset 1,0
# # set ylabel offset 0,-1
# old = 0
# plot f every 1::16 using (($1-TIME_OFFSET)*1000):(($0==TIME_OFFSET ? (old = ((Ts*$5 + Tc*$5)/(Ts + Tc)), old) : (old = ((Ts*$5 + Tc*old)/(Ts + Tc)), old)-1.5)/2.0) with line lt -1,\
#      T_max(x) with line lt -1,\
#      T_min(x) with line lt -1

# #plot f every 1::16 using (($1-TIME_OFFSET)*1000):(($6-1.5)/2) with line lt -1

# unset multiplot