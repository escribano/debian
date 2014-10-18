#!/bin/bash
#
# wget https://github.com/escribano/habitatione/shell/debian/boot.sh
# curl http://npmjs.org/install.sh | sh
#
# wget -qO- https://github.com/escribano/debian/raw/master/boot.sh | bash

boot.test

function boot.test () {
  echo "book ok"
}

function boot.git () {
  git add .
  git status
  #git commit -am 'fix'
  git commit -m 'server test'
  git push origin master
}

function sudoi () {
  sudo -i
}

function intall.packages () {
  apt-get update && apt-get upgrade -y
  apt-get install build-essential curl git unzip -y
}

function master.users () {
  #ademir ALL=(ALL) NOPASSWD:ALL
  #/etc/sudoers.d/master.users
  useradd -m ademir -s /bin/bash
  passwd ademir
  gedulah

  echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master.users
  mode 0440
}