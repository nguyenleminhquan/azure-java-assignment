#!/bin/bash

sleep 5
res=$(wget --server-response 172.25.148.117:98 2>&1 | grep "HTTP/" | awk '{print $2}')
echo $res

if [ $res -ne 200 ]
then 
    exit 1
fi