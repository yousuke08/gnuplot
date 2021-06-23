 set term pdfcairo enhanced size 3in, 3in
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

f = "../dat/0000.CSV"

##############################余白の設定
N = 1                           # グラフの数

tms = 0.98                      # 上余白
bms = 0.05                      # 下余白
lms = 0.15                      # 左余白
rms = 0.97                      # 右余白
hms = (1-(1-tms)-bms)/N*0.85    # グラフあたりの幅
sms = (1-(1-tms)-bms)/N*0.15    # グラフの間隔

##############################測定周期を抽出

stats f using 2 every ::8::8 nooutput
Ts = STATS_mean

##############################ファイルの解析


#----------ここからプロット--------#

set multiplot
##############################plot1
plot_No = 1

#マージン設定
set lmargin screen lms
set rmargin screen rms
set tmargin screen tms - (plot_No-1)*(hms+sms)
set bmargin screen tms - (plot_No*hms + (plot_No-1)*sms)

#軸のレンジ設定
set xr[0:50]
set yr[-45:45]
#軸の表示設定
#set logscale x
#set format x "10^{%L}"
set format x "%3.0f"
set format y "%3.0f"
#軸の間隔設定(x:10ごとにメモリ，メモリの間は2分割)
set xtics 10
set mxtics 2
set ytics 15
set mytics 1
#軸のラベル設定
set xlabel "Angle {/Symbol:Italic q} [degree]"
set ylabel "Voltage {/Times-New-Roman:Italic:Bold v_{ac}} [V]"
#データをプロット(csvの16行目からプロット，)
plot f every ::16:0::0 using (($0)*Ts*1000):2 lt -1 with line

unset multiplot
##############################plot2