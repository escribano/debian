#!/bin/bash
#
# wget https://github.com/escribano/habitatione/shell/debian/boot.sh
# curl http://npmjs.org/install.sh | sh
#
# wget -qO- https://github.com/escribano/debian/raw/master/boot.sh | bash



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
  #passwd ademir
  #gedulah

  echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master.users
  mode 0440
}

function create.me {
  useradd -m ademir -s /bin/bash
  #echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/init-ademir
  echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master.users
  chmod 0440 /etc/sudoers.d/master.users
}

function install.key {
  #cp /home/admin/id_rsa.pub /home/ademir/
  #chown ademir.ademir /home/ademir/id_rsa.pub
  #su ademir
  #cd /home/ademir
  mkdir -p /home/ademir/.ssh
  cat /home/admin/id_rsa.pub >> /home/ademir/.ssh/authorized_keys
  chmod 700 /home/ademir/.ssh
  chmod 600 /home/ademir/.ssh/authorized_keys
  chown ademir.ademir /home/ademir/.ssh
  chown ademir.ademir /home/ademir/.ssh/authorized_keys
  #rm /home/admin/id_rsa.pub
  #ls -alh /home/ademir/.ssh/authorized_keys
}

boot.test