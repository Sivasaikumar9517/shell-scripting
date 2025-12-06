#!/bin/bash

DISK_USAGE=$( df -ht | grep xfs)
THRESOLD=5
MSG=""

while read -r line
do
    USAGE=$( echo $line | awk -F " " '{print $6F} | cut -d "%' -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $THRESOLD ]
    then
        MSG+="High Disk usage on partition: $PARTITION Usage is: $USAGE \n "
    fi

done <<< $DISK_USAGE
