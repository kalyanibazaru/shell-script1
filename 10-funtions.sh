#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "Error: Error: installing is failed"
    exit 1
    else
    echo "installing is success"
fi 

if [ $ID -ne 0 ]
then
    echo "error: please run this dcript with root access"
    exit 1
    else
    echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "installing mysql"

yum install git -y

VALIDTE $? "installing git"

