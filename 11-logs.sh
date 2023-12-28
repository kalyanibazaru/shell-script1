#!/bin/bash
ID=$(id -u)
echo "script name: $0"
VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo "Error:: $2 ....failed"
    exit 1
    else 
        echo "$2 ....success"
    fi
}
if [ $ID -ne 0 ]
then 
    echo "ERROR:: please run this script with root access"
    exit 1
else 
    echo "you are root user"
fi
yum install mysql -y

VALIDATE $? "Installing Mysql"

yum install git -y

VALIDATE $? "Installing Git"
