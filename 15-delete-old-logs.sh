#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shellscripts-logs"
if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R source directory: $SOURCE_DIR does not exist $N"
fi
