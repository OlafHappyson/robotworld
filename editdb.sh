#!/bin/bash

# This script will based on number of replicas picks port from docker test dabases and prepare terraform main.tf file for application
set -e

REPLICA=${1}

APP="docker port robotworld-postgres"
TEXT="You can run 'terraform apply' now, to apply robo world sql scripts"
PORT1="`$APP-1 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`"
PORT2="`$APP-2 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`"
PORT3="`$APP-3 | awk '/0.0.0.0:/ { split($3,a,":"); print a[2]}'`"
STATUS1="PORT for $APP-1 = "
STATUS2="PORT for $APP-2 = "
STATUS3="PORT for $APP-3 = "

if [ $REPLICA = 1 ]
then
echo "$STATUS1 $PORT1"
sed "s/%PORT1%/$PORT1/g" template/main1.tf > main.tf
terraform init
echo "$TEXT"
fi

if [ $REPLICA = 2 ]
then
echo "$STATUS1 $PORT1"
echo "$STATUS2 $PORT2"
sed "s/%PORT1%/$PORT1/g" template/main2.tf | sed "s/%PORT2%/$PORT2/g" > main.tf
terraform init
echo "$TEXT"
fi

if [ $REPLICA = 3 ]
then
echo "$STATUS1 $PORT1"
echo "$STATUS2 $PORT2"
echo "$STATUS3 $PORT3"
sed "s/%PORT1%/$PORT1/g" template/main3.tf | sed "s/%PORT2%/$PORT2/g" | sed "s/%PORT3%/$PORT3/g" > main.tf
terraform init
echo "$TEXT"
fi
