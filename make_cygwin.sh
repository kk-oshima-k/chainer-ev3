
#!/bin/bash
#
# hrp3を使ったRelease1.0以降ではなく、
# hrp2を使ったβ7.3を対象としています
#
# 参考
# #1 Windows(Cygwin)版開発環境構築【後輩たちのためのEV3rt講座(改)】
# https://qiita.com/koushiro/items/6edd0a41803d06de7541
#
# 6.このshを実行
# ワーキングディレクトリの中の ev3rt フォルダの中に cd で移動し、
# このmake_cygwin.shを実行する
# git clone 不要の場合は -m
# zip化する場合は -z

while (( $# > 0 ))
do
  case $1 in
    -m)
      MAKE_ONLY=1
      ;;
    -z)
      ZIP=1
      ;;
  esac
  shift
done

CURRENT=$(pwd)

if [ "$MAKE_ONLY" != "1" ]; then
    git clone https://github.com/kk-oshima-k/chainer-ev3.git
fi
cp -rp chainer-ev3/ev3/chainer-ev3 hrp2/sdk/workspace/

rm -r ev3rt-beta7-3-release/sdcard/ev3rt/apps/*

cd $CURRENT/hrp2/sdk/workspace
make app=chainer-ev3
cp -rp app $CURRENT/ev3rt-beta7-3-release/sdcard/ev3rt/apps/tensorflow-ev3

cd $CURRENT/ev3rt-beta7-3-release/sdcard/ev3rt/etc/
echo -e "[Sensors]\nDisablePort1=1" >> rc.conf.ini

cd $CURRENT
cp -rp ev3rt-beta7-3-release/sdcard ./

if [ "$ZIP" = "1" ]; then
    zip -r sdcard.zip ./sdcard
fi
