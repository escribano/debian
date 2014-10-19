#!/bin/bash
#
# wget https://github.com/escribano/habitatione/shell/debian/boot.sh
# curl http://npmjs.org/install.sh | sh
#
# wget -qO- https://github.com/escribano/debian/raw/master/boot.sh | bash
# wget -qO- https://github.com/escribano/hegel/raw/master/boot.sh | bash

function sudoi () {
  sudo -i
}

function master.user {
  sudo -i
  
  useradd -m ademir -s /bin/bash
  #passwd ademir
  #gedulah
  
  mkdir /home/ademir/.ssh
  wget -qO- https://github.com/escribano/hegel/raw/master/config/id_rsa.pub \
    >> /home/ademir/.ssh/authorized_keys
  chmod 700 /home/ademir/.ssh
  chmod 600 /home/ademir/.ssh/authorized_keys
  chown -R ademir.ademir /home/ademir
  
  #echo "ademir ALL=(ALL:ALL) ALL" > /etc/sudoers.d/master-user
  echo "ademir ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/master-user
  chmod 0440 /etc/sudoers.d/master-user
  
  history -c
}

function intall.packages () {
  #sudo -i
  # 1.
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt-get install build-essential curl git unzip -y
  
  # 2.
  sudo apt-get install gettext checkinstall chkconfig -y

  
  ####################################
  # 3.
  sudo apt-get install xfsprogs xfsdump nmap -y
  quota
  attr
  
  # 4.
  apt-get install openssl libssl-dev  -y
  apt-get install proj-bin proj-data proj-ps-doc libproj-dev libgeos-c1 -y
  apt-get install postgresql-9.3-postgis-2.1 postgresql-9.3-plv8 postgresql-contrib-9.3 libpq-dev -y
  apt-get install gdal-bin libgdal-dev libgdal-doc dans-gdal-scripts libgd-tools shapelib -y
  apt-get install mapserver-bin cgi-mapserver mapserver-doc libmapserver1-dev -y
  apt-get install python-mapscript ruby-mapscript libmapscript-perl php5-mapscript -y
  apt-get install libmapcache1 libmapcache1-dev mapcache-cgi mapcache-tools -y
  apt-get install nginx geoip-bin spawn-fcgi libfcgi-dev -y
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

function config.hab.access () {
  #sudo -i
  sudo apt-get install golang xfsprogs checkinstall chkconfig nmap -y
  
  
  
  apt-get install autoconf automake cmake   -y
  apt-get install gettext openssl libssl-dev  -y
  apt-get install subversion
  apt-get install mercurial bzr
  #nano /etc/mercurial/hgrc
  #[web]
  #cacerts = /etc/ssl/certs/ca-certificates.crt
  
  sudo apt-get install gcc libc6-dev
  apt-get install g++ make -y
  dpkg-dev
  apt-get install python python-pip python-virtualenv -y
}


function to.deb () {
  sudo -i
  fdisk -l
  locale -a
  #C
  #C.UTF-8
  #en_US.utf8
  #POSIX
  cat /etc/environment
  cat /etc/hostname
  cat /etc/hosts
  cat /etc/fstab
  dpkg -l
  dpkg -S apt-
  apt-cache search tunnel
  dpkg -l \*
  dpkg -l '*'
  apt-cache policy python
  dpkg -l | grep "map"
  locale
  history -c
  apt-get update && apt-get upgrade
  # Setting up grub-pc (2.02~beta2-14) ...
  # grub-probe: warning: the device.map entry `hd0,msdos1' is invalid. Ignoring it. Please correct or delete your device.map.
  apt-cache show cgi-mapserver
  nano /etc/locale.gen
  dpkg-reconfigure locales
  locale-gen
  locale -a
  apt-cache show mapcache-cgi
  apt-cache show nginx
  
  apt-cache show libapache2-mod-mapcache
  apt-cache show libmapcache1
  apt-cache show libmapcache1-dev
  apt-cache show mapcache-cgi
  apt-cache show mapcache-tools
  open https://packages.debian.org/jessie/cgi-mapserver
  apt-cache show golang
  apt-cache show golang-dbg
  apt-cache show golang-go
  apt-cache show golang-go-flags-dev
  apt-cache show golang-go.crypto-dev
  apt-cache show golang-go.net-dev

  # It also show which version is currently installed and which versions are available to install.
  apt-cache policy hylafax+
  
  # Also, the apt-show-versions package (installed separately) parses dpkg information about what is installed and tells you if packages are up to date.
  sudo apt-show-versions --regex chrome
  # google-chrome-stable/stable upgradeable from 32.0.1700.102-1 to 35.0.1916.114-1
  # xserver-xorg-video-openchrome/quantal-security uptodate 1:0.3.1-0ubuntu1.12.10.1
  
  # For installed packages, we can use “dpkg -l” to find out the version number of a specified package. For example,
  dpkg -l nginx
 
  # If we don’t have the package installed, how can we find its version? Well, apt-cache is the way to go. We can use apt-cache to find out which version of a specified package we are going to installed. Here are two examples,
  apt-cache policy nmap
  apt-cache show nmap

}

function config.jessie () {
  apt-get update, upgrade
  locale
  apt-get update && apt-get upgrade -y
  
  locale -a
  /etc/locale.gen
  locale-gen
  # 1) Check your /etc/locale.gen and see that the locale you wish to choose is uncommented. (mine was en_US.utf8)
  # 2) Type ‘locale-gen’ as root, should be no errors here.
  # 3) Edit /etc/environment and add the following lines:
  nano /etc/environment
  LANG=en_US
  LC_CTYPE=en_US.UTF-8
  LC_MESSAGES=en_US.UTF-8
  LC_COLLATE=en_US.UTF-8
  LC_ALL=en_US.UTF-8
  nano /etc/environment
  echo LANG=en_US > /etc/environment
  echo LC_CTYPE=en_US.UTF-8 >> /etc/environment
  echo LC_MESSAGES=en_US.UTF-8 >> /etc/environment
  echo LC_COLLATE=en_US.UTF-8 >> /etc/environment
  echo LC_ALL=en_US.UTF-8 >> /etc/environment


  # 4) That’s it. Logout and log back in. ‘locale -a’ should give no errors.
  
	#env | grep LANG
	#env | grep LC_

  #locales
	#option 1
	# dpkg-reconfigure locales
	# nano /etc/profile
	# : ${LANG:=pt_BR.UTF-8}; export LANG

	# option 2
	# nano /etc/environment
	LANG=pt_BR.UTF-8
	LC_CTYPE=pt_BR.UTF-8
	LC_MESSAGES=pt_BR.UTF-8
	LC_COLLATE=pt_BR.UTF-8
	LC_ALL=pt_BR.UTF-8


  update-locale LC_CTYPE=en_US.UTF-8

  nano /etc/environment

  update-locale LC_CTYPE=en_US.UTF-8

  nano /etc/environment

  LANGUAGE=pt_BR.UTF-8 
  
  update-locale LC_CTYPE=en_US.UTF-8

  # 1) Check your /etc/locale.gen and see that the locale you wish to choose is uncommented. (mine was en_US.utf8)
  # 2) Type ‘locale-gen’ as root, should be no errors here.
  # 3) Edit /etc/environment and add the following lines:
  nano /etc/environment
  LANG=en_US
  LC_CTYPE=en_US.UTF-8
  LC_MESSAGES=en_US.UTF-8
  LC_COLLATE=en_US.UTF-8
  LC_ALL=en_US.UTF-8

  # 4) That’s it. Logout and log back in. ‘locale -a’ should give no errors. 

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8


  dpkg-reconfigure locales
}





