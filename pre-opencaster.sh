#!/usr/bin/env bash

docker build -t encom/opencaster-builder opencaster
docker run --name encom-opencaster-builder -v opencaster:/build-out encom/opencaster-builder
ln -s opencaster/dvbobjects dvbobjects


mkdir output
