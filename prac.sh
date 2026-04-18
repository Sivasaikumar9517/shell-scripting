#!/bin/bash

USERID=$( id -u )
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


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

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo -e " Mysql is Already Installed .... $Y Skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo -e " nginx is Already Installed ....  $Y Skipping $N"
fi

dnf list installed gcc
if [ $? -ne 0 ]
then
    dnf install gcc -y
    VALIDATE $? gcc
else
    echo -e " gcc is Already Installed .... $Y Skipping $N"
fi


