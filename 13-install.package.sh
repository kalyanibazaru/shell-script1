#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo -e "$R Error:: please run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

echo "All arguements passed: $@"
