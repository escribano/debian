function install.sein () {
  DAEMON_INSTALL_DIR="/opt/hab/daemon/sein"
  DAEMON_CONFIG_DIR="/etc/sein/"
  sudo rm -rf $DAEMON_INSTALL_DIR && sudo mkdir -p $DAEMON_INSTALL_DIR
  sudo rm -rf $DAEMON_CONFIG_DIR && sudo mkdir -p $DAEMON_CONFIG_DIR
  #sudo cp /tmp/sein $DAEMON_INSTALL_DIR/
  sudo tar xzvf /tmp/sein.tar.gz -C $DAEMON_INSTALL_DIR
  # sudo ln -f -s $INSTALL_DIR/config/hab.debian.nginx.conf /etc/nginx/sites-enabled/hab
  #sudo /etc/init.d/nginx reload
  sudo cp $DAEMON_INSTALL_DIR/config.prd.toml $DAEMON_CONFIG_DIR/config.toml
}

function run.sein () {
  /opt/hab/daemon/sein
}