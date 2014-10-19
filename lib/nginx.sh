#!/bin/bash

function intall.nginx () {
  sudo -i
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt-get install nginx -y
  #Suggested packages:
  #  libgd-tools geoip-bin fcgiwrap nginx-doc
  sudo unlink /etc/nginx/sites-enabled/default
  
  nginx
  /usr/local/etc/nginx/mime.types
  application/json                      json;
  sudo nginx -s reload
  curl -v http://habitatione.prd/saopaulo/1413404116/locales/en.json
  nginx -v
}

function intall.packages () {
  sudo -i
  sudo apt-get update && apt-get upgrade -y
  sudo apt-get install build-essential curl git unzip -y
}

function intall.ebs () {
  sudo -i
  sudo apt-get update && apt-get upgrade -y
  sudo apt-get install build-essential curl git unzip -y
}



function nginx.stock () {
  apt-get install nginx geoip-bin spawn-fcgi libfcgi-dev -y
  cp config/mapa.nginx.conf /etc/nginx/sites-available
  ln -s /etc/nginx/sites-available/mapa.nginx.conf /etc/nginx/sites-enabled/mapa
  sudo unlink /etc/nginx/sites-enabled/default
  sudo unlink /etc/nginx/sites-enabled/hab
  sudo /etc/init.d/nginx restart
  sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
  
  cp config/nginx/mapa.nginx.conf /etc/nginx/sites-available
  ln -s /etc/nginx/sites-available/mapa.nginx.conf /etc/nginx/sites-enabled/mapa

  tail -f /var/log/nginx/error.log
  tail /var/log/nginx/access.log
  tail /var/log/nginx/error.log

  /etc/init.d/nginx start
  /etc/init.d/nginx restart
  /etc/init.d/nginx stop
  /etc/init.d/nginx reload
  tail -f /var/log/nginx/mapa.error.log
  tail -f /var/log/nginx/xmapa.error.log

  rm /var/log/nginx/mapa.access.log
  rm /var/log/nginx/mapa.error.log
  rm /var/log/nginx/mapa.*.log
}
