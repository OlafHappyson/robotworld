#!/bin/bash

# This script will based on number of replicas picks port from docker test dabases and prepare terraform main.tf file for application
set -e

REPLICA=${1}

if [ $REPLICA = 1 ]
then
PORT1=`docker port docker-test-postgres-1 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`
echo "PORT for docker-test-postgres-1 = $PORT1"
sed "s/%PORT1%/$PORT1/g" template/main1.tf > main.tf
terraform init
echo "You can run 'terraform apply' now, to apply robo world sql scripts"
fi

if [ $REPLICA = 2 ]
then
PORT1=`docker port docker-test-postgres-1 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`
PORT2=`docker port docker-test-postgres-2 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`
echo "PORT for docker-test-postgres-1 = $PORT1"
echo "PORT for docker-test-postgres-2 = $PORT2"
sed "s/%PORT1%/$PORT1/g" template/main2.tf | sed "s/%PORT2%/$PORT2/g" > main.tf
terraform init
echo "You can run 'terraform apply' now, to apply robo world sql scripts"
fi

if [ $REPLICA = 3 ]
then
PORT1=`docker port docker-test-postgres-1 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`
PORT2=`docker port docker-test-postgres-2 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`
PORT3=`docker port docker-test-postgres-3 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`
echo "PORT for docker-test-postgres-1 = $PORT1"
echo "PORT for docker-test-postgres-2 = $PORT2"
echo "PORT for docker-test-postgres-3 = $PORT3"
sed "s/%PORT1%/$PORT1/g" template/main3.tf | sed "s/%PORT2%/$PORT2/g" | sed "s/%PORT3%/$PORT3/g" > main.tf
terraform init
echo "You can run 'terraform apply' now, to apply robo world sql scripts"
fi