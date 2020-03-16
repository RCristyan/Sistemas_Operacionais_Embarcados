#!/bin/bash

count=0
while [ $count -lt $1 ]
    do
        cd ..
        count=$((count+1))
    done