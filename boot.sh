#!/bin/bash
#
# wget https://github.com/escribano/habitatione/shell/debian/boot.sh
# curl http://npmjs.org/install.sh | sh
#
# wget -qO- https://github.com/escribano/debian/raw/master/boot.sh | bash

function master.user {
  sudo -i
  useradd -m ademir -s /bin/bash
  mkdir /home/ademir/.ssh
  wget -qO- https://github.com/escribano/debian/raw/master/id_rsa.pub \
    >> /home/ademir/.ssh/authorized_keys
  chmod 700 /home/ademir/.ssh
  chmod 600 /home/ademir/.ssh/authorized_keys
  chown -R ademir.ademir /home/ademir
  #echo "ademir ALL=(ALL:ALL) ALL" > /etc/sudoers.d/master-user
  #echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master.user
  #echo "admin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master-user
  echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master-user
  chmod 0440 /etc/sudoers.d/master-user
  
  printf "hello\nworld\n"
  echo -e "Hello\nworld"
  echo -e 'Hello\nworld'
  echo Hello$'\n'world
  echo $'hello\nworld'



  # cat id_rsa.pub >> /home/ademir/.ssh/authorized_keys

  history -c
}

function config.locale () {
  #locale -a
  #cat /etc/locale.gen | grep pt_BR.UTF-8
  sed -ri 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
  locale-gen
  #sed -ri 's/pt_BR.UTF-8 UTF-8/# pt_BR.UTF-8 UTF-8/' /etc/locale.gen
  #locale-gen pt_BR.UTF-8
  #dpkg-reconfigure locales
}


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



function master.users.old () {
  #ademir ALL=(ALL) NOPASSWD:ALL
  #/etc/sudoers.d/master.users
  useradd -m ademir -s /bin/bash
  #passwd ademir
  #gedulah

  echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master.users
  mode 0440
}



function secure.me () {
  mkdir /home/ademir/.ssh
  cat id_rsa.pub >> /home/ademir/.ssh/authorized_keys
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

#master.user