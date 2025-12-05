#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/home/ec2-user/app-logs"
LOGFILE=$( echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE_NAME="$LOGS_FOLDER/$LOGFILE-$TIMESTAMP.log"

SOUR_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 as default

mkdir -p /home/ec2-user/app-logs

if [ $# -lt 2 ]
then
    echo -e " $R USAGE:: $N sh $0.sh <SOUR_DIR> <DEST_DIR> <DAYS(OPTIONAL)> "
    exit 1
fi

# if [ ! -d "$SOUR_DIR"]
# then
#     echo -e " $R $SOUR_DIR $N doesn't exists ... please check"
#     exit 1
# fi

# if [ ! -d "$DEST_DIR"]
# then
#     echo -e " $R $DEST_DIR $N doesn't exists ... please check"
#     exit 1
# fi