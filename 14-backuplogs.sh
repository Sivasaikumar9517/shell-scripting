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
    echo -e " $R USAGE:: $N sh $0 <SOUR_DIR> <DEST_DIR> <DAYS(OPTIONAL)> "
    exit 1
fi

if [ ! -d "$SOUR_DIR" ]
then
    echo -e " $R $SOUR_DIR $N doesn't exists ... please check"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo -e " $R $DEST_DIR $N doesn't exists ... please check"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP"

FILE=$(find $LOGS_FOLDER -name "*.logs" -mtime +$DAYS)


if [ -n "$FILE" ] # true if there are files to zip
then
    echo "FILES are : $FILE"
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $LOGS_FOLDER -name "*.logs" -mtime +$DAYS | zip -@ "$ZIP_FILE_NAME"

    if [ -f "$ZIP_FILE_NAME" ]
    then
        echo -e " All the files older than $Y $DAYS $N are succesfully $G zipped $N "

        while read -r filenames
        do
            echo -e " $R Deleting file are :$N $filenames "
            rm -rf $filenames
        done  <<< $FILE

    else
        echo -e " $R ERROR:: $N Failed to Create a $R ZIP FILE $N "
        exit 1
    fi

else
    echo -e " No files found older than $Y $DAYS $N to  $G ZIP $N"
fi 