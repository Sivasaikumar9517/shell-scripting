#!/bin/bash

read Num

if [ $Num -gt 100 ]
then 
    echo " given number is greater than 100 "
else
    echo " given number is $Num lessthan or equal to 100 "
fi