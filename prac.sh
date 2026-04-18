#!/bin/bash

USERID=$( id -u )



if [ $USERID -ne 0 ]; then
    echo " Please run with ROOT Privilages"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " Installation of $2 is Failure"
    else
        echo " Installation of $2 is SUCCESS"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo " Mysql is Already Installed .... Skipping"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo " nginx is Already Installed .... Skipping"
fi

dnf list installed gcc
if [ $? -ne 0 ]
then
    dnf install gcc -y
    VALIDATE $? gcc
else
    echo " gcc is Already Installed .... Skipping"
fi


