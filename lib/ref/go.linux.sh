http://golang.org/doc/install

# Download the archive and extract it into /usr/local, creating a Go tree in /usr/local/go. For example:
wget https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# Choose the archive file appropriate for your installation. For instance, if you are installing Go version 1.2.1 for 64-bit x86 on Linux, the archive you want is called go1.2.1.linux-amd64.tar.gz.

# (Typically these commands must be run as root or through sudo.)

# Add /usr/local/go/bin to the PATH environment variable. You can do this by adding this line to your /etc/profile (for a system-wide installation) or $HOME/.profile:

export PATH=$PATH:/usr/local/go/bin


Test your installation

Check that Go is installed correctly by building a simple program, as follows.

Create a file named hello.go and put the following program in it:

nano hello.go
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
Then run it with the go tool:

$ go run hello.go
hello, world




bin/
    streak                         # command executable
    todo                           # command executable
pkg/
    linux_amd64/
        code.google.com/p/goauth2/
            oauth.a                # package object
        github.com/nf/todo/
            task.a                 # package object
src/
    code.google.com/p/goauth2/
        .hg/                       # mercurial repository metadata
        oauth/
            oauth.go               # package source
            oauth_test.go          # test source
    github.com/nf/
        streak/
            .git/                  # git repository metadata
            oauth.go               # command source
            streak.go              # command source
        todo/
            .git/                  # git repository metadata
            task/
                task.go            # package source
            todo.go                # command source
            
            
#

The GOPATH environment variable

# The GOPATH environment variable specifies the location of your workspace. It is likely the only environment variable you'll need to set when developing Go code.

# To get started, create a workspace directory and set GOPATH accordingly. Your workspace can be located wherever you like, but we'll use $HOME/go in this document. Note that this must not be the same path as your Go installation.

$ mkdir $HOME/go
$ export GOPATH=$HOME/go

#For convenience, add the workspace's bin subdirectory to your PATH:

$ export PATH=$PATH:$GOPATH/bin

Package paths

# The packages from the standard library are given short paths such as "fmt" and "net/http". For your own packages, you must choose a base path that is unlikely to collide with future additions to the standard library or other external libraries.

# If you keep your code in a source repository somewhere, then you should use the root of that source repository as your base path. For instance, if you have a GitHub account at github.com/user, that should be your base path.

# Note that you don't need to publish your code to a remote repository before you can build it. It's just a good habit to organize your code as if you will publish it someday. In practice you can choose any arbitrary path name, as long as it is unique to the standard library and greater Go ecosystem.

# We'll use github.com/user as our base path. Create a directory inside your workspace in which to keep source code:

$ mkdir -p $GOPATH/src/github.com/user


Your first program

# To compile and run a simple program, first choose a package path (we'll use github.com/user/hello) and create a corresponding package directory inside your workspace:

$ mkdir $GOPATH/src/github.com/user/hello
# Next, create a file named hello.go inside that directory, containing the following Go code.

package main

import "fmt"

func main() {
	fmt.Printf("Hello, world.\n")
}
Now you can build and install that program with the go tool:

$ go install github.com/user/hello

Note that you can run this command from anywhere on your system. The go tool finds the source code by looking for the github.com/user/hello package inside the workspace specified by GOPATH.

You can also omit the package path if you run go install from the package directory:

$ cd $GOPATH/src/github.com/user/hello
$ go install
This command builds the hello command, producing an executable binary. It then installs that binary to the workspace's bin directory as hello (or, under Windows, hello.exe). In our example, that will be $GOPATH/bin/hello, which is $HOME/go/bin/hello.

The go tool will only print output when an error occurs, so if these commands produce no output they have executed successfully.

You can now run the program by typing its full path at the command line:

$ $GOPATH/bin/hello
Hello, world.
Or, as you have added $GOPATH/bin to your PATH, just type the binary name:

$ hello
Hello, world.

