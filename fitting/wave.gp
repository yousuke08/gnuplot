set term pdfcairo enhanced size 4in, 3in font "Roman, 10"

set encoding utf8
set output "./wave.pdf"
set datafile separator ","
set tics font "Roman, 10"
set key font "Roman, 12"
set title font "Roman, 12"
set xlabel font "Roman, 12"
set x2label font "Roman, 12"
set ylabel font "Roman, 12"
set samples 1000
set border lt -1 lw 3
set grid
#set lmargin 8
#set bmargin 0
unset key
set style arrow 1 size character 0.5,20 filled heads linewidth 2
##############################ファイルのPath
f = "./0002.CSV"
##############################余白の設定
N = 2                           # グラフの数
tms = 0.98                      # 上余白
bms = 0.1                       # 下余白
lms = 0.1                       # 左余白
rms = 0.97                      # 右余白
hms = (tms-bms)/N*0.85    # グラフあたりの幅
sms = (tms-bms)/N*0.15    # グラフの間隔

##############################LPFの設定
#サンプリング時間取得
stats f using 2 every ::8:0:8:0 nooutput
Ts = STATS_mean
#LPFの設定
Tc = (1.0/100000.0/2.0/pi)
#時間軸の変数初期化
##############################ファイルの解析
#データの初期値取得
#トルク

set multiplot
##############################plot1
set lmargin screen lms
set rmargin screen rms
set tmargin screen tms - 0*(hms + sms)
set bmargin screen tms - 1*hms - 0*sms
#set label 1 "{/Roman-Italic i_{ac}}" at graph 0.02,0.8 left
set xr[0:50]
set yr[-20:20]
set format x ""
set format y "%3.0f"
set xtics 10
set mxtics 5
set ytics 10
set mytics 2
# set xlabel offset 0,-1
set ylabel "i_{ac} [A]" font "Roman, 10" offset 1,0
# set ylabel offset 0,-1
plot f using ($0*Ts*1000*10):4 every 10::16 with line lt -1
###############################plot4(Tm)
stats f using 5 every ::16 nooutput
print STATS_max-STATS_min
T_offset = STATS_mean
set lmargin screen lms
set rmargin screen rms
set tmargin screen tms - 1*(hms + sms)
set bmargin screen tms - 2*hms - 1*sms
#set label 1 "{/Roman-Italic T} [Nm]" tc "black" at graph 0.02,0.85 left
set xr[0:50]
set yr[-1:1]
set format x "%3.0f"
set format y "%3.1f"
set xtics 10
set mxtics 5
set ytics .2
set mytics 2
set xlabel "{/Roman-Italic t} [ms]" font "Roman, 10" offset 0,0.5
#set xlabel offset 0,-1
set ylabel "{/Roman-Italic T} [Nm]" font "Roman, 10" offset 1,0
# set ylabel offset 0,-1

a = 0.4*pi
b = 0.02
fi(x) = 0.471*sin(50*2*pi*x/1000.0+a)+0.213*cos(2*50*2*pi*x/1000.0+a)+b

fit fi(x) f u ($0*Ts*1000*10):(($5-T_offset)*0.5/10.0) every 10::16 via a,b
plot f using ($0*Ts*1000*10):(($5-T_offset)*0.5/10.0) every 10::16 with line lt -1#, 0.471*sin(50*2*pi*x/1000.0+a)+0.213*sin(2*50*2*pi*x/1000.0+a)+b


unset multiplot