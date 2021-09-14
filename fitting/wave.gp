# termの設定(出力の形式など)
set term pdfcairo enhanced size 3in, 2in
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
f = "../dat/fittingSample.csv"

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
set xr[0:0.02]
set yr[-150:150]
# 軸の表示設定
if(N == plot_No){
    #set logscale x
    #set format x "10^{%L}"
    #set format x "%.0P{/Symbol p}"
    set format x "%.2f"
}else{
    set format x ""
}
set format y "%.0f"
# 軸の目盛設定(xtics:主目盛，mxtics:主目盛の分割数)
set xtics 0.01
set mxtics 2
set ytics 50
set mytics 5
# 軸のラベル設定
set xlabel "{/Sans:Bold:Italic t} [s]" offset 0,0.5
set ylabel "{/Sans:Bold:Italic v}_{ac} [V]" offset 2,0

# 真の関数
fs(x) = 100*sin(x*100*pi+1./3.*pi)
# フィッティングパラメータ
a = 100
b = 1./2.*pi
# フィッティング関数
f(x) = a*sin(x*100*pi+b)
# フィッティング
fit f(x) f using 1:2 via a,b

plot f using 1:2 lc "black" lw 2 pt 1 with point,\
     fs(x) lc "red" lw 2,\
     f(x) lc "blue" lw 1


unset multiplot