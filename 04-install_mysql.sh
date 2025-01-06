#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR: pls login with root"
    exit 1
else
    echo "you are a root user"
fi

yum install mysql -y

if [ $ID -ne 0 ]
then
    echo "ERROR: pls login with root"
    exit 1
else
    echo "you are a root user"
fi

yum install git -y