#!/bin/bash

docker rm test &> /dev/null

for i in $(seq 1 $1)
do
  docker run --name=test alpine sh

  t1=$(docker inspect -f '{{.Created}}' test)
  t2=$(docker inspect -f '{{.State.StartedAt}}' test)

  nanosecdiff=$(( $(date -d "$t2" +%s%N) - $(date -d "$t1" +%s%N)))

  echo $nanosecdiff

  docker rm test &> /dev/null
done


