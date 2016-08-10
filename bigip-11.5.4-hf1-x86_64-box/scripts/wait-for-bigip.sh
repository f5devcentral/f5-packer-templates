#!/bin/bash

while true; do
    string=`tmsh show sys failover`
    if [[ $string == *"active"* ]]
    then
        break
    else
        echo "runlevel is 'unknown' - waiting for 10s"
        sleep 10
    fi
done
echo "runlevel is now valid."
