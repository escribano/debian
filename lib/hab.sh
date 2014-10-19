
function install.hab () {
  INSTALL_DIR="/opt/hab/ng/city/saopaulo"
  sudo rm -rf $INSTALL_DIR
  sudo mkdir -p $INSTALL_DIR
  sudo tar xzvf /tmp/hab.tar.gz -C $INSTALL_DIR
  sudo ln -f -s $INSTALL_DIR/config/hab.debian.nginx.conf /etc/nginx/sites-enabled/hab
  sudo /etc/init.d/nginx reload
  #cp /var/tmp/hab/config/nginx/hab.debian.nginx.conf /etc/nginx/sites-available
  #ln -s /etc/nginx/sites-available/hab.debian.nginx.conf /etc/nginx/sites-enabled/hab
  #cp -r /var/tmp/hab/ng/city/saopaulo/prd /opt/hab/ng/city/saopaulo/
}