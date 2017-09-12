#!/bin/bash

## copy site + current built version
cp -r site_root/* docker/build

## build the image
docker build -t testbuild:test  docker/ -f docker/Dockerfile.ubuntu


## cleandir
rm -rf docker/build/*

