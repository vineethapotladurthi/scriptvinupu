#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
R='\033[0;31m'
G='\033[0;32m'   #'\e[32m'
N='\033[0m'


# if [ $USERID -ne 0 ]; then
#     echo "you have to run the script under root previleges.."
#     exit 1
# fi
Check_Root(){
    if [ $USERID -ne 0 ]; then
     echo -e " $R you have to run the script under root previleges.." &>>LOGFILE
     exit 1
    fi
}
validate(){
    if($1 -ne 0); then
     echo -e "$R $2 failedd.......!"&>>LOGFILE
    else
        echo -e "$G $2 here you go successfully...."&>>LOGFILE
    fi
}
Check_Root
# dnf list installed git
validate $? "$package was ..!"
for package in $@
do 
    dnf list installed $package
    echo "the  pakacge are $package" &>>LOGFILE
done
if [ $? -ne 0 ]; then
    echo -e " $R $package was not installed on your device let us install $package"&>>LOGFILE
    dnf install $package -y
    # if [ $? -ne 0 ]; then
    #     echo "git installation was not success"
    #     exit 1
    # else
    #     echo " git installed succcessfully"
    # fi
    validate $? "$package installation"
else
    echo  -e "$N $package was already iinstalled"&>>LOGFILE
fi

# dnf list installed mysql

#  if [ $? -ne 0 ]
#   then
#     echo -e "$R $package was not installed on your device let us install $package"&>>LOGFILE
#     dnf install $package -y
#     if [ $? -ne 0 ]
#      then
#         echo -e "$R $package installation was not success"&>>LOGFILE
#         exit 1
#     else
#         echo -e "$G $package installed succcessfully"&>>LOGFILE
#     fi
# else
#     echo -e "$N $package was already iinstalled"&>>LOGFILE
# fi
