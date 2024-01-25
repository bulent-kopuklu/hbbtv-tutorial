#! /usr/bin/env bash


mkdir -p /tmp/opencaster/out/bin

cd /tmp/opencaster/build

git clone https://github.com/bulent-kopuklu/opencaster.git
cd opencaster/code 
DESTDIR=/tmp/opencaster/out/bin make install

cp -r libs/dvbobjects/usr/local/lib/python2.7/dist-packages/dvbobjects /tmp/opencaster/out

ls -la /tmp/opencaster/out