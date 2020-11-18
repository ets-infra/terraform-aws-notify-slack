#!/bin/bash

LAMBDA="notify_slack"
OLDDIR="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

#create and install dependencies
mkdir -p package
pip3 install --target ./package -r requirements.txt

#create zipfile
cd package
zip -r9 ${OLDPWD}/${LAMBDA}.zip .
cd $OLDPWD
zip -g ${LAMBDA}.zip ${LAMBDA}.py
rm -rf package

cd $OLDDIR

