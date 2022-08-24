#!/bin/bash

id=$(docker ps -a -q -f "name=hc")
docker container rm -f $id
docker image rm -f $(repository):latest  