
http://technosophos.com/2013/12/02/go-1-2-on-ubuntu-12-10.html


Installing godeb
# The basics of the godeb project are described on the author's blog. If you need a binary package for godeb, check there.

# Assuming that you have already installed golang via apt-get, it's just as easy to install godeb as a go package:

$ cd $GOPATH
$ go get launchpad.net/godeb
You should probably test that godeb works before proceeding:

$ $GOPATH/bin/godeb --help
Uninstalling golang
# Since the Ubuntu golang package will conflict, and since we've already build out godeb tool, we can now uninstall golang:

$ sudo apt-get remove golang
# This will remove Go from your system, but will leave your $GOPATH alone.

# Building a New Go Debian Package
# Now we can use godeb to create a new package:

$ $GOPATH/bin/godeb install
# This will attempt to fetch the latest Go distribution from golang.org and then build a debian package. If all goes will, it will use dpkg to install it for you.

OH NO! IT BROKE!
# On my systems, part way through godeb's installation I received an error that looks like this:

processing https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz
package go_1.2-godeb1_amd64.deb ready
Selecting previously unselected package go.
dpkg: regarding go_1.2-godeb1_amd64.deb containing go:
 go conflicts with golang
  golang (version 2:1.1.2-2ubuntu1) is present and installed.

dpkg: error processing go_1.2-godeb1_amd64.deb (--install):
 conflicting packages - not installing go
Errors were encountered while processing:
 go_1.2-godeb1_amd64.deb
error: while installing go package: exit status 1
# This error indicates that the dpkg program won't install our newly created Go package because it conflicts with the golang package.

# Looking at your filesystem, you should see a package file like go_1.2-godeb1_amd64.deb. If you made it that far then you are actually in good shape. We can easily resolve the error above.

# All we need to do now is tell dpkg that we want it to install even though there could be a conflict:

$ sudo dpkg -i --force-overwrite go_1.2-godeb1_amd64.deb
# The force-overwrite flag tells dpkg to cause this package to overwrite any files installed by the Ubuntu golang package.

# Once you've run the above command you should be able to run go version to verify that the correct Go version was installed.

# Update 2014-04-08: Daniel Hunsaker explained the real solution to the dpkg failure, and provided a a better solution:

# The conflict is because golang is a virtual package. You need to run apt-get autoremove after you uninstall it so that the actual packages get removed as well. Then, no manual dpkg required!

