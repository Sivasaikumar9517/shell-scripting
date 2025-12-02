#!/bin/bash

NUM1=$1
NUM2=$2
num3=$3

TIMESTAMP=$(date)
echo "Script executed at : $TIMESTAMP"

SUM=$(($NUM1+$NUM2+$num3))

echo "sum of $NUM1 , $NUM2 and $num3 is : $SUM"