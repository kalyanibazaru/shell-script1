#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script strted executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $R Failed $N"
    else
        echo -e "$2 ... $G Success $N"
    fi

}
if [ $ID -ne 0 ]

then
    echo -e "$R Error:: please run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

#echo "All arguements passed: $@"
#git mysql postfix net-tools
#package=git for first time

for package in $@

do
    yum list installed $package &>> $LOGFILE #check installed or not
    
    if [ $? -ne 0 ]

    then
        yum install $package -y &>> $LOGFILE # install the package

        VALIDATE $? "Installation of $package" # validate

    else

        echo -e "$package is already installed....$Y Skipping $N"

    fi
done

