function deploy.hab () {
  DIST_DIR="/tmp"
  ARCHIVE_NAME="hab"
  FROM_DIR="/tmp/hab"
  PRD_DIR="$ROOT_PATH/ng/habitatione/prd"
  CONFIG_DIR="$ROOT_PATH/config"
  export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
  export COPYFILE_DISABLE=true
  rm -rf $FROM_DIR
  mkdir -p $FROM_DIR
  cp -R $PRD_DIR /tmp/hab
  mkdir -p $FROM_DIR/config
  cp $CONFIG_DIR/hab.debian.nginx.conf /tmp/hab/config
  tar -c --exclude-from=$ROOT_PATH/.tarignore -vzf "$DIST_DIR"/$ARCHIVE_NAME.tar.gz -C $FROM_DIR .
}

function xplode.hab () {
  #rm -rf /mnt/ebs/data/gis/import/sql
  rm -rf /tmp/test
  mkdir -p /tmp/test
  tar xzvf /tmp/hab.tar.gz -C /tmp/test
}

function install.hab () {
  INSTALL_DIR="/opt/hab/ng/city/saopaulo"
  sudo rm -rf $INSTALL_DIR
  sudo mkdir -p $INSTALL_DIR
  sudo tar xzvf /tmp/hab.tar.gz -C $INSTALL_DIR
  sudo ln -s $INSTALL_DIR/config/hab.debian.nginx.conf /etc/nginx/sites-enabled/hab
  sudo /etc/init.d/nginx reload
  #cp /var/tmp/hab/config/nginx/hab.debian.nginx.conf /etc/nginx/sites-available
  #ln -s /etc/nginx/sites-available/hab.debian.nginx.conf /etc/nginx/sites-enabled/hab
  #cp -r /var/tmp/hab/ng/city/saopaulo/prd /opt/hab/ng/city/saopaulo/
}