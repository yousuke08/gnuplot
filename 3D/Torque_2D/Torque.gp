#set term pdfcairo enhanced size 4in, 3in
set term gif animate enhanced font "TimesNewRoman, 12"  # 出力をgifアニメに設定
set output "sample1.gif"  # 出力ファイル名の設定
set datafile separator ","

n0 = 0
n1 = 2*pi
dn = 2*pi/30

load "Torque_.gp" 