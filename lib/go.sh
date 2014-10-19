function install.go () {
  sudo apt-get install golang -y
  #############
  #nano hello.go
  printf '
  package main

  import "fmt"

  func main() {
      fmt.Printf("hello, world\n")
  }' > hello.go
  
  # Then run it with the go tool:

  #$ go run hello.go
  #hello, world

}

function make.workspace () {
  mkdir $HOME/go
  export GOPATH=$HOME/go

  #For convenience, add the workspace's bin subdirectory to your PATH:
  export PATH=$PATH:$GOPATH/bin
  
  mkdir -p $GOPATH/src/github.com/user
  

}