#!/bin/bash
set -Eeuo pipefail

export TZ=UTC

# create directory
cd "$( dirname "${BASH_SOURCE[0]}" )"
rm -rf --one-file-system backup
mkdir -p backup/containers

# dump system info
date +%s%N | cut -b1-13 > backup/timestamp.txt
docker info > backup/docker_info.txt 2>&1

# dump all containers
containers=$(docker ps --all -q)

while IFS= read -r container; do
	echo "$container"
	docker inspect "$container" > backup/containers/"$container".json
done <<< "$containers"
