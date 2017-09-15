#!/bin/bash
IMAGE="$1"

docker stop mysite && docker rm mysite || docker rm mysite
docker run --name mysite -p 8080:8080 -d $IMAGE  


$( sleep 3 && docker  logs mysite )  &

sleep 8
