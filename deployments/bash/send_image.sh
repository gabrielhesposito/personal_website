#!/bin/bash
IMAGE="$1"
docker save $IMAGE | bzip2 | pv | ssh personal.aws 'bunzip2 | docker load $IMAGE' 
