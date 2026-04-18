#!/bin/bash

USERID=$( id -u )
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE_NAME="$LOGS_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOGS_FOLDER

echo " Script start executed at : $(date) " | tee -a $LOG_FILE_NAME



if [ $USERID -ne 0 ]; then
    echo -e " Please run with $R ROOT Privilages"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " Installation of $2 is $R Failure $N"
    else
        echo -e " Installation of $2 is $G SUCCESS $N"
    fi
}

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? mysql
else
    echo -e " Mysql is Already Installed .... $Y Skipping $N" | tee -a $LOG_FILE_NAME
fi

dnf list installed nginx &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install nginx -y &>>$LOG_FILE_NAME
    VALIDATE $? nginx
else
    echo -e " nginx is Already Installed ....  $Y Skipping $N" | tee -a $LOG_FILE_NAME
fi

dnf list installed gcc &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install gcc -y &>>$LOG_FILE_NAME
    VALIDATE $? gcc
else
    echo -e " gcc is Already Installed .... $Y Skipping $N" | tee -a $LOG_FILE_NAME
fi


