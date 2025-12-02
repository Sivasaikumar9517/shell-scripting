#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " ERROR: User must have sudo access to run this script "
    exit 1
else
    dnf list installed mysql 
    if [ $? -ne 0 ]
    then
        dnf install mysql -y
        if [ $? -ne 0 ]
        then
            echo " Installation of Mysql is .... Failure"
            exit 1
        else
            echo " Installation of mysql is ..... Success "
        fi
    else 
        echo " Mysql is already installed"
    fi
fi

dnf list installed git 

if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo " Installation of Git is .... Failure "
        exit 1
    else
        echo " Installation of Git is .... Success"
    fi
else
    echo " Git is already installed"
fi


