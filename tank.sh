#!/bin/bash 
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")

# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

cd $SCRIPTPATH/../JRPiCam
git pull git@github.com:ldesrosi/JRPiCam.git

cd $SCRIPTPATH/
git pull git@github.com:ldesrosi/iot-tank-client.git

sudo env "PATH=$PATH" mvn package -DskipTests

cd $SCRIPTPATH/iot-tank

sudo env "PATH=$PATH" mvn exec:java 