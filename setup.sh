#!/bin/bash
#
# wget https://github.com/escribano/habitatione/shell/debian/boot.sh
# curl http://npmjs.org/install.sh | sh
#
# wget -qO- https://github.com/escribano/debian/raw/master/boot.sh | bash
# wget -qO- https://github.com/escribano/hegel/raw/master/setup.sh | bash

SAVED_PWD=`pwd`
export PHILOSOPHIE_PATH="$HOME/philosophie"
export HEGEL_PATH="$PHILOSOPHIE_PATH/hegel"
export PROFILE="$HOME/.profile"
export HEGEL_GIT="https://github.com/escribano/hegel.git"
mkdir -p $PHILOSOPHIE_PATH
cd $PHILOSOPHIE_PATH
#git clone git@github.com:escribano/hegel.git
git clone $HEGEL_GIT
cd hegel
printf "\nsource $HEGEL_PATH/install\n" >> $PROFILE
#source ./install
cd $SAVED_PWD
