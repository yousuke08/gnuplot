# About
gnuplotでグラフの作成やデータ処理をするときにスタートとなる雛形の保存庫

主に私が使う測定機器から吐き出されるcsvデータのプロットやフィッティングに関連する物が多い

## dataPlot
csvのようなASCIIベースのデータをプロットする雛形たち

- Yokogawa.gp
横川のオシロスコープやスコープコーダから吐き出されたｃｓｖをプロットする雛形

## 3D
二次関数をプロットする雛形たち

## barChart
棒グラフを描画する雛形たち

- barChart
入力電流高調波規制とデータを比較してくれる雛形

## fitting
データをフィッティングする雛形たち

- wave.gp
フィッティングするための基本的な雛形

# How to use

### Gnuplotのインストール

mac(Homebrew導入済み)
``` brew install gnuplot ```

windows(Chocolatey導入済み)
``` choco install gnuplot ```

インストーラからインストールする場合は[公式のダウンロードページ](https://sourceforge.net/projects/gnuplot/files/gnuplot/)からダウンロードしてインストールする
