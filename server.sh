#!/bin/bash

if [ -z "$1" ]; then
 IP=120
else
 IP=$1
fi

echo $IP

hugo server --bind=0.0.0.0 --baseURL=http://10.0.0.$IP:1313
