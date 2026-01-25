#!/bin/bash

USERID=$(id -u)

# if [ $USERID -ne 0 ]; then
#     echo "you have to run the script under root previleges.."
#     exit 1
# fi
Check_Root(){
    if [ $USERID -ne 0 ]; then
     echo "you have to run the script under root previleges.."
     exit 1
    fi
}
validate(){
    if($1 -ne 0); then
     echo "$2 failedd.......!"
    else
        echo "$2 here you go successfully...."
    fi
}
Check_Root
# dnf list installed git

for package in $@
do 
    dnf list installed $package
    echo "the  pakacge are $package"
done
validate $? "$package was ..!"
if [ $? -ne 0 ]; then
    echo " $package was not installed on your device let us install $package"
    dnf install $package -y
    # if [ $? -ne 0 ]; then
    #     echo "git installation was not success"
    #     exit 1
    # else
    #     echo " git installed succcessfully"
    # fi
else
    echo " $package was already iinstalled"
fi

# dnf list installed mysql

 