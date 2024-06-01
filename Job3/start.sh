#!/bin/bash

docker build -f dockerfile -t dockerfile .
docker run dockerfile
