#!/bin/bash
IMAGE_NAME="$1"
## copy site + current built version
cp -r site_root/* docker/build

## build the image
docker build -t $IMAGE_NAME  docker/ -f docker/Dockerfile.ubuntu


## cleandir
rm -rf docker/build/*

cat <<< "$IMAGE_NAME"
