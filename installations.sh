#!/bin/bash

USER-ID=$(id -u)

if [ $USER-ID -ne 0 ]; then
    echo "you have to run the script under root previleges.."
    exit 1
fi
dnf list installed git
if [ $? -ne 0 ]; then
    echo " git was not installed on your device let us install git"
    dnf install git -y
    if [ $? -ne 0 ]; then
        echo "git installation was not success"
        exit 1
    else
        echo " git installed succcessfully"
    fi
else
    echo " git was already iinstalled"
fi