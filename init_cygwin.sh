#!/bin/bash
#
# hrp3を使ったRelease1.0以降ではなく、
# hrp2を使ったβ7.3を対象としています
#
# 参考
# #1 Windows(Cygwin)版開発環境構築【後輩たちのためのEV3rt講座(改)】
# https://qiita.com/koushiro/items/6edd0a41803d06de7541
#
# 1.cygwinインストーラのダウンロード
# https://www.cygwin.com/
# からsetup-x86_64.exeをダウンロード
#
# 2.cygwinのインストール
# ダウンロード元リポジトリは適当に選択。今回は https://ftp.jaist.ac.jp を利用
# 以下のライブラリを選択してインストール
# gcc-core (Devel)
# make (Devel)
# diffutils (Utils)
# perl (Perl)
# ruby (Ruby)
# wget (Net)
# unzip (Archive)
# zip (Archive)※オプション
#
# 3.GCC ARM（GNU Tools for ARM Embedded Processors）のインストール
# https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
# から gcc-arm-none-eabi-6-2017-q1-update-win32.exe をダウンロードしインストール
# 最後の画面で Add path to environment variable をチェックすれば動くらしいが、今回はうまくいかなかったので、
# 環境変数PATHに C:\Program Files (x86)\GNU Tools ARM Embedded\6 2017-q1-update\bin を追加
#
# 4.それぞれのコマンドの動作チェック
# gcc -v
# make -v
# diff -v
# perl -v
# ruby -v
# arm-none-eabi-gcc -v
#
# 5.mkimage.exeのダウンロード
# https://www.mediawiki.compulab.com/w/index.php?title=U-Boot:_Images
# から Mkimage.tar.gz をダウンロードし、解凍
# できた Mkimage.exe を C:\cygwin64\usr\local\bin に移動
# （コマンドでやる場合管理者権限が必要）
#
# 6.このshを実行
# ワーキングディレクトリを決めてそこに cd で移動し、
# このinit_cygwin.shを実行する
# 

CURRENT=$(pwd)

mkdir ev3rt
cd ev3rt

wget http://www.toppers.jp/download.cgi/ev3rt-beta7-3-release.zip
unzip ev3rt-beta7-3-release.zip
tar xvf ev3rt-beta7-3-release/hrp2.tar.xz -C ./

cd $CURRENT
