#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2...FAILED  $N"
    else
        echo -e "$G $2...SUCCESS $N"
    fi
}

if [ $ID -ne 0 ] 
then
    echo -e "$R ERROR: Run the script with root user $N" &>> $LOG_FILE
    exit 1
else
    echo "you are a root user" &>> $LOG_FILE
fi

echo "all arguments passed $@"

for package in $@
do
    yum list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOG_FILE
        VALIDATE $? "installation of $package"
    else
        echo -e "$Y $package is already installed...SKIPPPING $N"
    fi
done


