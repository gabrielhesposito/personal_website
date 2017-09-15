#!/bin/bash

docker stop mysite && docker rm mysite || docker rm mysite
docker run --name mysite -p 8080:8080 -d testbuild:test

$( sleep 3 && docker  logs mysite ) &
