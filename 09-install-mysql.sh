#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
echo "Error: please run this script with root access"
else
echo "you are root user"
fi # fi means reverse of if, inducating condition end 

yum install mysql -y
