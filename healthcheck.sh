#!/bin/bash

COUNT=$(docker ps | grep "java-assignment:$TESTTAG" | wc -l)

if [ $COUNT -eq 0 ]
then
    exit 1
fi