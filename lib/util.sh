function setup.hegel () {
  #VAR_ROOT_PATH="$ROOT_PATH/var"
  #HEGEL_PATH="$ROOT_PATH/var/hegel"
  #SHELL_ROOT_PATH="$ROOT_PATH/shell/hegel"
  PHILOSOPHIE_PATH="$HOME/philosophie"
  HEGEL_PATH="$PHILOSOPHIE_PATH/hegel"
  PROFILE="$HOME/.profile"
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
  cd $SAVED_PWD
}

function push.hegel {
  SAVED_PWD=`pwd`
  cd $HEGEL_ROOT_PATH
  git add -A
  git commit -am 'fix'
  git push origin master
  cd $SAVED_PWD
}

function goto.hegel () {
  cd ~$HEGEL_PATH
}



