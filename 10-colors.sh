#!/bin/bash

USERID=$(id -u)
PACKAGE=$1
PACKAGE2=$2

R=/e[31m
G=/e[32m
Y=/e[33m

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e " $2 ..... $R "
        exit 1
    else
        echo -e " $2 ..... $G "
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR: User must have root privilages to execute this script "
    exit 1
fi 

dnf list installed $PACKAGE

if [ $? -ne 0 ]
then
    dnf install $PACKAGE -y
    VALIDATE $? "Installing $PACKAGE is "
     
else
    echo -e " $PACKAGE Package is Already $Y"
fi

dnf list installed $PACKAGE2

if [ $? -ne 0 ]
then
    dnf install $PACKAGE2 -y
    VALIDATE $? "Installing $PACKAGE2 is "
     
else
    echo -e " $PACKAGE2 Package is Already $Y"
fi

