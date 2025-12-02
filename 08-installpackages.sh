#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " ERROR: User must have sudo access to run this script "
    exit 1
fi

dnf install mysqll -y

