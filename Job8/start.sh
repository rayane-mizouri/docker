#!/bin/bash

docker build -f dockerfile-nginx -t dockerfile-nginx .
docker run -d -p 8080:80 --name docker-nginx dockerfile-nginx

