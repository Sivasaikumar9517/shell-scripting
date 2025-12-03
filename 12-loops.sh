#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$FILE_NAME-$TIME_STAMP.log"

if [ $USERID -ne 0 ]
then
    echo "ERROR: User Must have root access to execute this script"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
       echo " $2 is $R Failure $N " 
       exit 1
    else
        echo " $2 is $G Success $N " 
    fi 
}

for Package in $@
do
    dnf list installed $Package &>>LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $Package -y &>>LOG_FILE_NAME
        VALIDATE $Package "Installing $package is"
    else
        echo " $package is already $Y Installed $N"
    fi
done
