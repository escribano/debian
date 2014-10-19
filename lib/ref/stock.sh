function boot.git () {
  git add .
  git status
  #git commit -am 'fix'
  git commit -m 'server test'
  git push origin master
}


function master.stock () {
  printf "hello\nworld\n"
  echo -e "Hello\nworld"
  echo -e 'Hello\nworld'
  echo Hello$'\n'world
  echo $'hello\nworld'
  
}

function add.hegel.to.bashrc () {
  echo "" >> ~/.bashrc
  echo "source $HEGEL_PATH/install" >> ~/.bashrc
  #echo "" >> .bashrc
}

function add.hegel.to.profile () {
  echo "" >> ~/.profile
  echo "source $HEGEL_ROOT_PATH/install" >> ~/.profile
  #echo "" >> ~/.profile
}

