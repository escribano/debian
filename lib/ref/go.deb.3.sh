http://blog.labix.org/2013/06/15/in-flight-deb-packages-of-go

In-flight deb packages of Go
15 Replies
# Since relatively early in the public life of the Go language, I’ve been involved in pushing forward packages that might be used in Ubuntu, including making the compiler suite itself happier in such packaged environments. In due time, these packages were moved over to an automatic build system, so that people wouldn’t have to rely on my good will to have up-to-date packages, nor would I have to be regularly spending time maintaining those packages. Or so was the theory.

# It’s well known that the real world is not so plain, though, and issues became much more regular than hoped. Some of the issues were caused by changes in the build conventions of Go, others self-inflicted due to my limited knowledge of the extensive conventions around packaging, or bugs in indirect dependencies of the process, and more recently the sub-optimal scheduling algorithm used by the build farm has driven the builds to a halt.

# So, the question is how to get out of this rabbit hole, but still give people a convenient way to use Go in Ubuntu.

# Enter godeb, an experiment that dynamically translates the upstream builds of Go into deb packages. In practice, it’s a simple standalone Go program that can parse the build list, fetch the requested version, and in memory translate the contents into a correct binary deb package.

# Since you cannot build a Go application without a Go compiler first, there’s an x86 32-bit binary and an x86 64-bit binary of godeb available for download. After the compiler is installed, godeb may be fetched and rebuilt locally by running go get gopkg.in/niemeyer/godeb.v1/cmd/godeb.

# Once the godeb binary is available, it’s easy to get up-to-date packages:


$ ./godeb install
processing https://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz
package go_1.1.1-godeb1_amd64.deb ready
Selecting previously unselected package go.
(Reading database ... 488515 files and (...) installed.)
Unpacking go (from go_1.1.1-godeb1_amd64.deb) ...
Setting up go (1.1.1-godeb1) ...

# It figures what the most recent build available is, downloads, translates, and installs it, asking for a password via sudo if necessary. Running godeb install again will fetch the latest version (or the requested one) and replace the currently installed package. Package installs default to the same architecture of godeb itself, and may be changed by setting the GOARCH environment variable to 386 or amd64, borrowing from a Go convention.

# New releases of Go are immediately available, and so are the old ones:


$ ./godeb list
1.2
1.2rc5
1.2rc4
1.2rc3
1.2rc2
1.2rc1
1.1.2
1.1.1
1.1
(...)

$ ./godeb -h
Usage: godeb <command> [<options> ...]

Available commands:

    list
    install [<version>]
    download [<version>]
    remove


# For the time being, I’m holding up maintenance of the Go PPA in Launchpad in favor of this system. Of course, you can still install the golang-* packages on Ubuntu 12.10 and 13.04 from the official repositories as usual.


