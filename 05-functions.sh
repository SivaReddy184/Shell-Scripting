#!/bin/bash

ID=$(id -u)
validate(){
   if [ $? -ne 0 ]
   then
      echo "ERROR: Installing failed"
    else
        echo "installing is success"
    fi 
}

 if [ $ID -ne 0 ]
then
    echo "ERROR: pls login with root"
    exit 1
else
    echo "you are a root user"
fi

yum install mysql -y

validate

yum install git -y

validate 