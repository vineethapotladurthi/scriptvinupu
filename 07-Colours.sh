#!/bin/bash

USERID=$(id -u)
Red="\e[31m"
Green="\e[32m"
Normal="\e[0m"
log="test.log"

# if [ $USERID -ne 0 ]; then
#     echo "you have to run the script under root previleges.."
#     exit 1
# fi
Check-Root(){
    if [ $USERID -ne 0 ]; then
     echo -e "$Red you have to run the script under root previleges.."
     exit 1
     fi
}
validate(){
    if($1 -ne 0); then
    echo "$2 $Red failedd.......!"
    else
    echo "$2 $Grenn here you go successfully...."
}
Check-Root
dnf list installed git
validate $? "$Normal git was ..!" &>>log
if [ $? -ne 0 ]; then
    echo " $Red git was not installed on your device let us install git"
    dnf install git -y
    # if [ $? -ne 0 ]; then
    #     echo "git installation was not success"
    #     exit 1
    # else
    #     echo " git installed succcessfully"
    # fi
    validate $? "$Normal git installation" &>>log
else
    echo " $Green git was already iinstalled"
fi

# dnf list installed mysql

# if [ $? -ne 0 ]
#  then
#     echo " mysql was not installed on your device let us install mysql"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#      then
#         echo "mysql installation was not success"
#         exit 1
#     else
#         echo " mysql installed succcessfully"
#     fi
# else
#     echo " mysql was already iinstalled"
# fi

