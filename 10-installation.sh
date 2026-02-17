#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing Nginx ... FAILURE"
    exit 1
else
    echo "Installing Nginx ... SUCCESS"
fi

nf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing MYSQL ... FAILURE"
    exit 1
else
    echo "Installing MYSQL ... SUCCESS"
fi

nf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Installing nodejs ... FAILURE"
    exit 1
else
    echo "Installing nodejs ... SUCCESS"
fi


