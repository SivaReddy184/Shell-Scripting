#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "Script Started executing at $TIMESTAMP" &>> $LOG_FILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2...FAILED $N"
    else
        echo -e "$G $2....SUCCESS $N"
    fi 
}

if [ $ID -ne 0 ]
then 
    echo "ERROR: Run the script with new user"
    exit 1
else
    echo "you are a root user"
fi 

# echo "all argument passed: $@"

for package in $@
do
    yum list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> $LOG_FILE
        VALIDATE $? "Installation of $package"
    else
        echo -e "$package is already installed..$Y SKIPPING $N"
fi 





