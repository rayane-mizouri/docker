#!/bin/bash

docker build -f dockerfile-ssh -t dockerfile-ssh .
docker run -d -p 666:666 --name dockerfile-ssh dockerfile-ssh

ssh root@localhost -p 666

