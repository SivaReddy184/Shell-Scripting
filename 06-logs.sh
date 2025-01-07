#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGS="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script execution has started $TIMESTAMP" &>> LOGS

validate(){
   if [ $1 -ne 0 ]
   then
      echo -e "$2... $R failed $N"
    else
        echo -e "$2... $G success $N"
    fi 
}

 if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: pls login with root $N"
    exit 1
else
    echo "you are a root user"
fi

yum install mysql -y &>> $LOGS

validate $? "installing mysql"

yum install git -y &>> $LOGS 

validate $? "installing git"