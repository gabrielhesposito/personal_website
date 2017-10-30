#!/bin/bash
IMAGE="$1"
docker save $IMAGE | bzip2 | pv | ssh $2 ' bunzip2 | docker load $IMAGE' 
