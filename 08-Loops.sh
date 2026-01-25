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
    if [ $1 -ne 0 ]; then
     echo "$2 failedd.......!"
     exit 1
    else
        echo "$2 here you go...."
    fi
}
Check_Root
# dnf list installed git

for package in $@
do 
        echo "the  pakacge are $package"
        dnf list installed $package
    if [ $? -ne 0 ]; then
        echo " $package was not installed on your device let us install $package"
        dnf install $package -y
        validate $? "$package installing"
    # if [ $? -ne 0 ]; then
    #     echo "git installation was not success"
    #     exit 1
    # else
    #     echo " git installed succcessfully"
    # fi
        else
            echo " $package was already iinstalled"
    fi
done

# dnf list installed mysql

 