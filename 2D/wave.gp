# termの設定(出力の形式など)
set term pdfcairo enhanced size 3in, 3in
#set term png enhanced
# 出力ファイル名
set output "fullBridge_waveform.pdf"
# ファイルを読み込む際の区切り文字
set datafile separator ","

# フォントの設定
set tics font "Times new roman, 9"
set key font "Times new roman, 10"
set title font "Times new roman, 10"
set label 1 font "Times new roman, 10"
set label 2 font "Times new roman, 10"
set xlabel font "Times new roman, 10"
set ylabel font "Times new roman, 10"
set x2label font "Times new roman, 10"
set y2label font "Times new roman, 10"

# プロットの解像度の設定(分割数)
set samples 1000
# 枠線の設定
set border lt -1 lw 3
# グリッドの設定
set grid
# 凡例の設定
unset key

##############################ファイルのPath
#f = "../dat/実験/0015.CSV"

##############################余白,間引きの設定
N = 1                           # グラフの数

tms = 0.9                       # 上余白
bms = 0.05                      # 下余白
lms = 0.15                      # 左余白
rms = 0.97                      # 右余白
hms = (1-(1-tms)-bms)/N*0.85    # グラフあたりの幅
sms = (1-(1-tms)-bms)/N*0.15    # グラフの間隔

cout = 1                        # 間引きの設定
################################ファイルの解析
# stats f using 2 every ::8:0:8:0 nooutput
# Ts = STATS_mean * cout

set multiplot
##############################plot1
plot_No = 1
# 余白の設定

set lmargin screen lms
set rmargin screen rms
set tmargin screen tms - (plot_No-1)*(hms+sms)
set bmargin screen tms - (plot_No*hms + (plot_No-1)*sms)

# 軸のレンジ設定
set xr[-pi:pi]
set yr[-100:100]
# 軸の表示設定
if(N == plot_No){
    #set logscale x
    #set format x "10^{%L}"
    set format x "%.0P{/Symbol p}"
    #set format x "%.0f"
}else{
    set format x ""
}
set format y "%.0f"
# 軸の目盛設定(xtics:主目盛，mxtics:主目盛の分割数)
set xtics pi
set mxtics 2
set ytics 20
set mytics 2
# 軸のラベル設定
set xlabel "{/Symbol q} [rad]" offset 0,0
set ylabel "v_{ac} [V]" offset 3,0

# plot f every cout::0:1 using (($0)*Ts*1000):2 lt -1 with line
plot 100*sin(2*pi*x) lc "black" lw 2 with line

unset multiplot