function install.sein () {
  DAEMON_INSTALL_DIR="/opt/hab/daemon"
  DAEMON_CONFIG_DIR="/etc/sein/"
  sudo rm -rf $DAEMON_INSTALL_DIR
  sudo mkdir -p $DAEMON_INSTALL_DIR
  sudo rm -rf $DAEMON_CONFIG_DIR
  sudo mkdir -p $DAEMON_CONFIG_DIR
  sudo cp /tmp/sein $DAEMON_INSTALL_DIR/
  sudo cp /tmp/config.toml $DAEMON_CONFIG_DIR/
}

