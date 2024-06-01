#!/bin/bash

docker volume create shared_folder

docker run -d -p 666:666 --name dockerfile-ssh -v shared_folder:/shared_folder dockerfile-ssh

docker run -d -p 777:777 --name dockerfile-ssh2 --link dockerfile-ssh -v shared_folder:/shared_folder dockerfile-ssh2

