#!/bin/bash

id=$(docker ps -a -q -f "name=hc")
docker container rm -f $id
if [ $1 = "refs/heads/dev" ]
then
  docker image rm -f nguyenleminhquan/java-assignment:latest
elif [ $1 = "refs/heads/stage" ]
then
  docker image rm -f nguyenleminhquan/java-assignment:staging
elif [ $1 = "refs/heads/master" ] 
then
  docker image rm -f nguyenleminhquan/java-assignment:stable
fi