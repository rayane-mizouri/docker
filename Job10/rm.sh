#!/bin/bash

id="id.txt"

docker volume ls -q > $id

while IFS= read -r volume_id; do
  containers=$(docker ps -a --filter volume="$volume_id" -q)

  for container in $containers; do
    docker stop "$container"
    docker rm "$container"
  done

  docker volume rm -f "$volume_id"
done < "$id"

docker images -q >> $id
while IFS= read -r volume_id; do
  docker rmi -f "$volume_id"
done < "$id"
rm $id

docker ps -aq >> $id
while IFS= read -r volume_id; do
  docker rm -f "$volume_id"
done < "$id"
rm $id

apt-get autoremove docker --purge

docker=$(find / -name "docker" 2>/dev/null)

echo "$docker" | xargs rm -rf

rm -rf /var/lib/docker


for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc -y ; do sudo apt-get remove $pkg -y; done
