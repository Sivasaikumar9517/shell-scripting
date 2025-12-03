#!/bin/bash

USERID=$(id -u)
PACKAGE=$1
PACKAGE2=$2

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo " $2 ..... Failure "
        exit 1
    else
        echo " $2 ..... Success "
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
    echo " $PACKAGE Package is Already Installed"
fi

dnf list installed $PACKAGE2

if [ $? -ne 0 ]
then
    dnf install $PACKAGE2 -y
    VALIDATE $? "Installing $PACKAGE2 is "
     
else
    echo " $PACKAGE2 Package is Already Installed"
fi

