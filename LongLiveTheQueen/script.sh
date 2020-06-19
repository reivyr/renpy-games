#!/bin/sh
set -e

echo "Don't forget to run renpyify before doing this!"

if [ ! -f LongLiveTheQueen.py ]
then
	echo "Please buy the game."
fi

mv common common-orig
cp -R renpy/common/ .
ftp https://github.com/CensoredUsername/unrpyc/archive/v1.1.3.tar.gz
tar xvzf v1.1.3.tar.gz
cd game
python2 ../unrpyc-1.1.3/unrpyc.py screens.rpyc translation.rpyc checklist.rpyc
ftp https://raw.githubusercontent.com/reivyr/renpy-games/master/LongLiveTheQueen/game.diff
patch -p0 < game.diff
mkdir translations

echo "Run \"python2 LongLiveTheQueen.py\" to play."
