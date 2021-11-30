#!/bin/bash

# This script will based on number of replicas picks port from docker test dabases and prepare terraform main.tf file for application

set -e

REPLICA=${1}

docker-compose up --scale postgres=$REPLICA -d
./editdb.sh $REPLICA

