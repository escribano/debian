https://golang.org/doc/install/source

Install C tools
On OS X, a C compiler is bundled in the command line tools for Xcode, and you don't need to install the whole Xcode to compile Go. If you have already installed Xcode 4.3+, you can install command line tools from the Components tab of the Downloads preferences panel. To verify you have a working compiler, just invoke gcc in a freshly created Terminal window, unless you see the "gcc: command not found" error, you are ready to go.

On Ubuntu/Debian, use sudo apt-get install gcc libc6-dev. If you want to build 32-bit binaries on a 64-bit system you'll also need the libc6-dev-i386 package.

On RedHat/Centos 6, use sudo yum install gcc glibc-devel. If you want to build 32-bit binaries on a 64-bit system you'll need both glibc-devel.i386 and glibc-devel.x86_64 packages.

On Windows, install gcc with MinGW. (Make sure you add its bin subdirectory to your PATH.) Go does not support the Cygwin toolchain.


Install C tools, if needed

The Go tool chain is written in C. To build it, you need a C compiler installed. Please refer to the InstallFromSource page on the Go community Wiki for operating system specific instructions.

Install Mercurial, if needed

To perform the next step you must have Mercurial installed. (Check that you have an hg command.)

If you do not have a working Mercurial installation, follow the instructions on the Mercurial downloads page.

Mercurial versions 1.7.x and up require the configuration of Certification Authorities (CAs). Error messages of the form:

warning: code.google.com certificate with fingerprint b1:af: ... bc not verified (check hostfingerprints or web.cacerts config setting)
when using Mercurial indicate that the CAs are missing. Check your Mercurial version (hg --version) and configure the CAs if necessary.


http://mercurial.selenic.com/wiki/CACertificates#Configuration_of_HTTPS_certificate_authorities

2. Configuration of HTTPS certificate authorities

Most operating systems maintain a set of root certificates that you might decide to trust. Note that any of these authorities can approve any server identity, and any of them will thus be able to spoof any server identity.

Add the lines below to your configuration file (such as /etc/mercurial/hgrc on Unix-like systems).

2.1. Debian/Ubuntu/Gentoo/Arch Linux

On Debian, Ubuntu, Gentoo and Arch Linux you can use this global configuration:


[web]
cacerts = /etc/ssl/certs/ca-certificates.crt
2.2. Fedora/RHEL

On Fedora and RHEL you can use this global configuration:


[web]
cacerts = /etc/pki/tls/certs/ca-bundle.crt
2.3. openSUSE/SLE

Suse should already ship hg with included link to the ssl bundle, else use this global configuration:


[web]
cacerts = /etc/ssl/ca-bundle.pem
2.4. Mac OS X before 10.6

You can generate the file you need by opening Keychain Access (from /Applications/Utilities), going to the System Roots keychain, selecting everything and then choosing Export Items... from the File menu. Make sure the File Format is set to Privacy Enhanced Mail (.pem), then save it to your Desktop as Certificates. Next, in Terminal enter


sudo cp ~/Desktop/Certificates.pem /etc/hg-ca-roots.pem
then configure Mercurial as follows:


[web]
cacerts = /etc/hg-ca-roots.pem
Note that because the vendor supplied set of CA root certificates on Mac OS X is in the system keychain, you may wish to repeat these steps after installing software updates if they include changes to the root certificate list.

2.5. Mac OS X 10.6 and higher

On Mac OS X 10.6 and higher, Apple's OpenSSL (which is what Apple's Python and therefore usually Mercurial use to implement their SSL support) will look in the system keychain. Unfortunately, the SSL code in the Python core doesn't allow for this situation---it always expects you to specify a certificate bundle, and if one is specified if must contain at least one certificate. A simple way to deal with this problem is to enter (in Terminal)


openssl req -new -x509 -extensions v3_ca -keyout /dev/null -out dummycert.pem -days 3650
to generate a dummy certificate (the contents don't matter, so you can just hit return at all of the prompts), then


sudo cp dummycert.pem /etc/hg-dummy-cert.pem
and set your configuration as follows:


[web]
cacerts = /etc/hg-dummy-cert.pem
Don't download a dummy certificate someone on the Internet has created to solve this problem unless you're certain that they're trustworthy; if they kept the private key, they would be able to sign certificates that Mercurial would trust. Better just to enter the commands above.

If you have trouble getting a dummy certificate to work, see below on how to work around the issue with host certificate fingerprints.

2.6. Windows

The Windows installer for Mercurial 1.7.3 (and corresponding TortoiseHg installers) are now safe by default. They now check the validity of the identity of the server you connect to with the root certificates.

The Windows installers for Mercurial 1.7.3 (and corresponding TortoiseHg installers) contain a cacert.pem and by default configure web.cacerts in hgrc.d\paths.rc . Note that per the default settings installed, connect to repositories with self-signed certificates fail with 1.7.3. You need to adjust the default configuration for that case.

2.7. Other platforms

If your platform doesn't provide a usable CA list, you can download a cacert file from http://curl.haxx.se/docs/caextract.html or some other trusted source.

2.8. Other Certificate Authorities

If want to trust other CAs you must make sure their root certificates are in your web.cacerts. For example, in order to use certificates from by cacert.org you need to download their root certificate in PEM format and configure Mercurial to use that certificate.

2.9. Self-signed certificates

You might want to tweak your cacert file, for example by removing CAs you don't trust or by adding your own internal or self-signed CAs. Only one cacerts file can be specified at any time, so you might want to override web.cacerts in your user or repository configuration.

The root CA certificate for a server can for example be retrieved with Firefox. Browse to https://server/repo and verify that this is the repository you trust, click the lock symbol in the lower right corner, View Certificate, Details, select the certificate at the top of the Certificate Hierarchy, Export, "X.509 Certificate (PEM)" and save somewhere for example as server.pem. With other browsers on Windows you have to view the certificate at the top of the Certification Path and "Copy to File" as "Base-64 encoded X.509 (.CER)". Several such files can be concatenated into one cacerts file.

Note: Self-signed certificates generated by IIS7 might not work with OpenSSL/Python as used by Mercurial. They do apparently have different opinions on what a valid CA certificate should contain. Instead, use openssl to create your server certificate and your CA certificate.

{i} The content of a single PEM encoded certificate can be seen with

 openssl x509 -in server.pem -text
3. Per-repository configuration

If you want to control more explicitly who can impersonate which servers you will authenticate to and pull from you can explicitly configure the trusted CAs for each local clone.

In your local repository add the following to your .hg/hgrc:


[web]
cacerts = /path/to/server.pem
Note: This requires Mercurial 1.7.3 or later.

4. Host certificate fingerprints

With Mercurial 1.7.4 a new method for verification of server identify was introduced. The warnings given for insecure https connections will show the fingerprint of the server certificate, and when such a fingerprint is configured for a hostname in the hostfingerprints section Mercurial will verify for all connections to that server that its certificate matches the fingerprint.

For example, for https://hg.intevation.org/mercurial/crew+main/ :


[hostfingerprints]
hg.intevation.org = fa:1f:d9:48:f1:e7:74:30:38:8d:d8:58:b6:94:b8:58:28:7d:8b:d0
5. Manually bypassing security checks on self-signed certificates

/!\ This is obviously insecure.

Sometimes it may be expedient to disable security checks, for instance when dealing with hosts with self-signed certificates. This can be done by disabling the CA certificate configuration on the command line:


hg push --config web.cacerts= https://self-signed-host/repo
A --insecure option was introduced with Mercurial 1.7.5 so you can do:


hg push --insecure https://self-signed-host/repo
6. HTTP proxy support

Mercurial 1.8 will also verify certificates for HTTPS connections made with CONNECT through HTTP proxies.

7. SMTP TLS certificates

Mercurial 2.6 and later also verifies SSL/TLS certificates for SMTP.


https://golang.org/doc/install/source

Fetch the repository

Go will install to a directory named go. Change to the directory that will be its parent and make sure the go directory does not exist. Then check out the repository:

$ hg clone -u release https://code.google.com/p/go
(Optional) Switch to the default branch

If you intend to modify the go source code, and contribute your changes to the project, then move your repository off the release branch, and onto the default (development) branch. Otherwise, skip this step.

$ hg update default
Install Go

To build the Go distribution, run

$ cd go/src
$ ./all.bash
(To build under Windows use all.bat.)

If all goes well, it will finish by printing output like:

ALL TESTS PASSED

---
Installed Go for linux/amd64 in /home/you/go.
Installed commands in /home/you/go/bin.
*** You need to add /home/you/go/bin to your $PATH. ***
where the details on the last few lines reflect the operating system, architecture, and root directory used during the install.

For more information about ways to control the build, see the discussion of environment variables below. all.bash (or all.bat) runs important tests for Go, which can take more time than simply building Go. If you do not want to run the test suite use make.bash (or make.bat) instead.

Testing your installation

Check that Go is installed correctly by building a simple program.

Create a file named hello.go and put the following program in it:

package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
Then run it with the go tool:

$ go run hello.go
hello, world
If you see the "hello, world" message then Go is installed correctly.

Set up your work environment

You're almost done. You just need to do a little more setup.

How to Write Go Code
Learn how to set up and use the Go tools
The How to Write Go Code document provides essential setup instructions for using the Go tools.

Install additional tools

The source code for several Go tools (including godoc) is kept in the go.tools repository. To install all of them, run the go get command:

$ go get code.google.com/p/go.tools/cmd/...
Or if you just want to install a specific command (godoc in this case):

$ go get code.google.com/p/go.tools/cmd/godoc
To install these tools, the go get command requires that Mercurial be installed locally.

You must also have a workspace (GOPATH) set up; see How to Write Go Code for the details.

Note: The go command will install the godoc binary to $GOROOT/bin (or $GOBIN) and the cover and vet binaries to $GOROOT/pkg/tool/$GOOS_$GOARCH. You can access the latter commands with "go tool cover" and "go tool vet".

Community resources

The usual community resources such as #go-nuts on the Freenode IRC server and the Go Nuts mailing list have active developers that can help you with problems with your installation or your development work. For those who wish to keep up to date, there is another mailing list, golang-checkins, that receives a message summarizing each checkin to the Go repository.

Bugs can be reported using the Go issue tracker.

Keeping up with releases

The Go project maintains a stable tag in its Mercurial repository: release.

The release tag refers to the current stable release of Go. Most Go users should use this version. New releases are announced on the golang-announce mailing list.

To update an existing tree to the latest release, you can run:

$ cd go/src
$ hg pull
$ hg update release
$ ./all.bash
Optional environment variables

The Go compilation environment can be customized by environment variables. None is required by the build, but you may wish to set some to override the defaults.

$GOROOT
The root of the Go tree, often $HOME/go. Its value is built into the tree when it is compiled, and defaults to the parent of the directory where all.bash was run. There is no need to set this unless you want to switch between multiple local copies of the repository.

$GOROOT_FINAL
The value assumed by installed binaries and scripts when $GOROOT is not set explicitly. It defaults to the value of $GOROOT. If you want to build the Go tree in one location but move it elsewhere after the build, set $GOROOT_FINAL to the eventual location.

$GOOS and $GOARCH
The name of the target operating system and compilation architecture. These default to the values of $GOHOSTOS and $GOHOSTARCH respectively (described below).

Choices for $GOOS are darwin (Mac OS X 10.6 and above), dragonfly, freebsd, linux, netbsd, openbsd, plan9, solaris and windows. Choices for $GOARCH are amd64 (64-bit x86, the most mature port), 386 (32-bit x86), and arm (32-bit ARM). The valid combinations of $GOOS and $GOARCH are:

$GOOS	$GOARCH
darwin	386
darwin	amd64
dragonfly	386
dragonfly	amd64
freebsd	386
freebsd	amd64
freebsd	arm
linux	386
linux	amd64
linux	arm
netbsd	386
netbsd	amd64
netbsd	arm
openbsd	386
openbsd	amd64
plan9	386
plan9	amd64
solaris	amd64
windows	386
windows	amd64
$GOHOSTOS and $GOHOSTARCH
The name of the host operating system and compilation architecture. These default to the local system's operating system and architecture.

Valid choices are the same as for $GOOS and $GOARCH, listed above. The specified values must be compatible with the local system. For example, you should not set $GOHOSTARCH to arm on an x86 system.

$GOBIN
The location where Go binaries will be installed. The default is $GOROOT/bin. After installing, you will want to arrange to add this directory to your $PATH, so you can use the tools. If $GOBIN is set, the go command installs all commands there.

$GO386 (for 386 only, default is auto-detected if built on either 386 or amd64, 387 otherwise)
This controls the code generated by 8g to use either the 387 floating-point unit (set to 387) or SSE2 instructions (set to sse2) for floating point computations.

GO386=387: use x87 for floating point operations; should support all x86 chips (Pentium MMX or later).
GO386=sse2: use SSE2 for floating point operations; has better performance than 387, but only available on Pentium 4/Opteron/Athlon 64 or later.
$GOARM (for arm only; default is auto-detected if building on the target processor, 6 if not)
This sets the ARM floating point co-processor architecture version the run-time should target. If you are compiling on the target system, its value will be auto-detected.

GOARM=5: use software floating point; when CPU doesn't have VFP co-processor
GOARM=6: use VFPv1 only; default if cross compiling; usually ARM11 or better cores (VFPv2 or better is also supported)
GOARM=7: use VFPv3; usually Cortex-A cores
If in doubt, leave this variable unset, and adjust it if required when you first run the Go executable. The GoARM page on the Go community wiki contains further details regarding Go's ARM support.

Note that $GOARCH and $GOOS identify the target environment, not the environment you are running on. In effect, you are always cross-compiling. By architecture, we mean the kind of binaries that the target environment can run: an x86-64 system running a 32-bit-only operating system must set GOARCH to 386, not amd64.

If you choose to override the defaults, set these variables in your shell profile ($HOME/.bashrc, $HOME/.profile, or equivalent). The settings might look something like this:

export GOROOT=$HOME/go
export GOARCH=amd64
export GOOS=linux
although, to reiterate, none of these variables needs to be set to build, install, and develop the Go tree.

https://golang.org/doc/devel/release.html#go1.3.minor

