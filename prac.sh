#!/bin/bash

USERID=$( id-u )



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


dnf install mysql -y
VALIDATE $? mysql

dnf install nginx -y
VALIDATE $? nginx

dnf install gcc -y
VALIDATE $? gcc


