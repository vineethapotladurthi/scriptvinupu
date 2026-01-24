#!/bin/bash

USERID=$(id -u)
Red='\033[0;31m'
Green='\033[0;32m'
Normal='\033[0m'
log="test.log"

# if [ $USERID -ne 0 ]; then
#     echo "you have to run the script under root previleges.."
#     exit 1
# fi
Check_Root(){
    if [ $USERID -ne 0 ]; then
     echo -e "${Red}ERROR you have to run the script under root previleges.."
     exit 1
     fi
}
validate(){
    if($1 -ne 0); then
     echo -e "$2 ${Red}ERROR failedd.......!"
    else
        echo -e "$2 ${Green}SUCCESS here you go successfully...."
    fi
}
Check_Root
dnf list installed git
validate $? "${Normal} git was ..!" &>>log
if [ $? -ne 0 ]; then
    echo -e " ${Red}ERROR git was not installed on your device let us install git"
    dnf install git -y
    # if [ $? -ne 0 ]; then
    #     echo "git installation was not success"
    #     exit 1
    # else
    #     echo " git installed succcessfully"
    # fi
    validate $? "${Normal} git installation" &>>log
else
    echo -e " ${Green}SUCCESS git was already iinstalled"
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

