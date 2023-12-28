#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo " script started executing at $TIMESTAMP " &>> $LOGFILE 

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e " Error:: $2 ....$R Failed $N "
    exit 1
    else 
        echo " $2 ....$G Success $N "
    fi
}
if [ $ID -ne 0 ]
then 
    echo "$R ERROR:: please run this script with root access $N"
    exit 1
else 
    echo "you are root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing Mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing Git"
