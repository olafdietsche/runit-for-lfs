Runit init scripts for Linux From Scratch

This repository contains the runit init scripts for
the Linux From Scratch distribution.

Updates to this may be acquired from the LFS-for-Runit
project at:

http://www.linuxquestions.org/questions/linux-from-scratch-13/runit-for-lfs-official-bundle-release-4175511869/

this SVN repository at:

https://code.google.com/p/runit-for-lfs/

or from the LinuxFromScratch Hints repository:

http://linuxfromscratch.org/hints/downloads/files/

This is loosely based on:

https://github.com/voidlinux/runit-void

with several reworkings for Linux From Scratch.

How to use it

First install the bootscripts and services using the Makefile provided.

    $ make && make install

The Makefile is already setup to install Runit's Bootscripts to the proper places for
LinuxFromScratch and should not require editing.

To see enabled services for "current" runlevel:

    $ ls /var/service

To see available runlevels (default and single, which just runs sulogin):

    $ ls /etc/runit/runsvdir
    
To check the status of the services running:

    $ sv check /var/services/*

To enable and start a service into the "current" runlevel:

    # ln -s /etc/sv/<service> /var/service

To disable and remove a service:

    # rm -f /var/service/<service>

Feel free to send patches and contribute with improvements and/or new services!
