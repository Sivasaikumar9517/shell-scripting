#!/bin/bash

USERID=$(id -u)
PACKAGE=$1
PACKAGE2=$2

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
FILE_NAME=$( echo $0 | cut -d "." -f1 )
TIME_STAMP=$( date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOGS_FOLDER/$FILE_NAME-$TIME_STAMP.log"



VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e " $2 ..... $R FAILURE $N"
        exit 1
    else
        echo -e " $2 ..... $G SUCCESS $N"
    fi
}

echo "Script executed at $TIME_STAMP "

if [ $USERID -ne 0 ]
then
    echo "ERROR: User must have root privilages to execute this script "
    exit 1
fi 

dnf list installed $PACKAGE &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install $PACKAGE -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing $PACKAGE is "
     
else
    echo -e " $PACKAGE Package is $Y Already  INSTALLED $N"
fi

dnf list installed $PACKAGE2 &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install $PACKAGE2 -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing $PACKAGE2 is "
     
else
    echo -e " $PACKAGE2 Package is $Y Already Installed $N"
fi

