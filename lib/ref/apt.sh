# How do you find the package that's got the feature you're looking for? First, do
apt-get update
		
# so your package list is up-to-date, and then try something like
#                                                      
apt-cache search tunnel
apt-cache search 'php.*sql'
apt-cache search apache.\*perl
apt-cache search elvis\|vim

# The simplest way to see the description of a package:
apt-cache show postgresql
apt-cache show iproute


# Which packages are installed? Do any packages need configuring?
dpkg -l	
		
# (that's a lower-case EL, not a one.) That lists all INSTALLED packages.
dpkg -l \*
dpkg -l '*'
		
# These list all packages. (Without the star glob, dpkg only lists installed packages.)
dpkg -l \*postgres\*
dpkg -l '*postgres*'

dpkg -l \* | grep ^pi
		
#finds installed packages marked to be purged.
dpkg -l '*' | grep "^i[^i]"
		
# lists packages marked for installation, that aren't installed yet.
dpkg -l \* | grep '^[^i]i'


# For a slightly different approach, how about this:
dpkg -l \* | grep apt 

# Package contents -- dpkg -L

dpkg -L mysql
dpkg -L apt

# Finding which package contains... -- dpkg -S

# How can you determine here did file XYZ come from? Here's how to find which package contains/supplies a certain file:
dpkg -S postmaster
dpkg -S 'doc/*sql' | cut -f1 -d: | sort -u


dpkg -S apt- | sort 

