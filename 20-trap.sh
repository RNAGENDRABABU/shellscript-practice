#!/bin/bash

set -e
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND"' ERR

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-practice"
LOGS_FILE="/var/log/shellscript-practice/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE  
    exit 1
fi

mkdir -p $LOGS_FOLDER

for package in $@ # sudo sh 14-loops.sh nginx nodejs
do 
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
    else 
        echo -e "$package already installed ... $Y skipping $N"
    fi     
done    
