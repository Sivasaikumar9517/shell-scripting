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
            echo " Installation of Mysql is .... Successs"
        else
            echo " Installation of mysql is ..... Failure "
        fi
    else 
        echo " Mysql is already installed"
    fi
fi


