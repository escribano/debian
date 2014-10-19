#!/bin/bash
#
# wget https://github.com/escribano/habitatione/shell/debian/boot.sh
# curl http://npmjs.org/install.sh | sh
#
# wget -qO- https://github.com/escribano/debian/raw/master/boot.sh | bash
# wget -qO- https://github.com/escribano/hegel/raw/master/setup.sh | bash

SAVED_PWD=`pwd`
PHILOSOPHIE_PATH="$HOME/philosophie"
HEGEL_PATH="$PHILOSOPHIE_PATH/hegel"
PROFILE="$HOME/.profile"
mkdir $HEGEL_PATH
cd $PHILOSOPHIE_PATH
git clone git@github.com:escribano/hegel.git
printf "\nsource $HEGEL_ROOT_PATH/install\n" >> $PROFILE
source ./install
cd $SAVED_PWD

function setup.hegel.var () {
  #VAR_ROOT_PATH="$ROOT_PATH/var"
  HEGEL_PATH="$HOME/var/hegel"
  #SHELL_ROOT_PATH="$ROOT_PATH/shell/hegel"
}

function clone.hegel () {
  SAVED_PWD=`pwd`
  cd $HEGEL_PATH
  git clone git@github.com:escribano/hegel.git
  cd $SAVED_PWD
}

function pull.hegel {
  SAVED_PWD=`pwd`
  cd $HEGEL_PATH
  git pull origin master
  cd $SAVED_PWD
}

function source.hegel {
  SAVED_PWD=`pwd`
  cd $HEGEL_PATH
  source ./install
  #git pull origin master
  cd $SAVED_PWD
}

#setup.hegel.var
#clone.hegel


