http://floaternet.com/golang/godeb


First of all, you have to install godeb. (if that's already done, skip to Running Godeb) You can either use the provided binary packages although I recommend installing it yourself using the outdated packages from the repositories. After you've installed and set up the older version of go it's just one command to install godeb.

go get launchpad.net/godeb
Note: It is possible to get an error similar to this:

package launchpad.net/godeb: exec: "bzr": executable file not found in $PATH
It just means that you don't have bzr installed, and can be remedied by a simple apt-get install bzr.

I recommend testing to make sure that the installation has actually worked before proceeding, so you aren't left with no go at all.

godeb -h
Now that godeb is successfully installed, you can remove the old go:

sudo apt-get remove golang

Running Godeb

Running godeb is simple and easy. It's just one command and you're all done.

sudo $GOPATH/bin/godeb install
However, if you already have an outdated version of Go, you may get an error like the following:

processing https://go.googlecode.com/files/go1.2.linux-386.tar.gz
package go_1.2-godeb1_i386.deb ready
Selecting previously unselected package go.
(Reading database ... 985806 files and directories currently installed.)
Unpacking go (from go_1.2-godeb1_i386.deb) ...
dpkg: error processing go_1.2-godeb1_i386.deb (--install):
 trying to overwrite '/usr/bin/go', which is also in package golang-go 2:1-5
Errors were encountered while processing:
 go_1.2-godeb1_i386.deb
error: while installing go package: exit status 1
It's easy to fix, you just have to force dpkg to install the package that overwrites the old one:

sudo dpkg -i --force-overwrite {your_package}.deb
If that succeeds, you're all done and ready to use your new go. You can test with go version.