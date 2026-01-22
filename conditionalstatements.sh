#!/bin/bash

#definning variables
name="anshu"
echo "iam $name"
name="radha"
echo "iam $name"
HOSTNAME=$(hostname)

echo " our server name is:it $HOSTNAME"
PWD=$(pwd)
echo " the path is: $PWD"
echo "helo welcome to the world"

ls -l
if [ $? -ne 0 ]; then
    echo "the previous command was failed"
    exit 1
fi
ls -2
if [ $? -ne 0 ]; then
    echo "the previous command was failed"
    exit 1
else
    echo "the command  was success.!"
fi
