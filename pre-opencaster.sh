#!/usr/bin/env bash

docker build -t encom/opencaster-builder opencaster

docker run --rm -v $PWD/opencaster:/build-out encom/opencaster-builder

ln -s opencaster/dvbobjects dvbobjects
mkdir output
