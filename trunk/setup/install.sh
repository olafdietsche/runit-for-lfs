#!/bin/sh

# Copyright 2014 The runit-for-lfs project
# https://code.google.com/p/runit-for-lfs/
# Authors: James Powell and Arther Radley

# This script is used to install the required components of lfs-for-runit.

SCRIPTS= 1 2 3 ctrlaltdel

install -dv /etc/sysconfig
mkdir -pv /lib/services
ln -sv /lib/services /lib/lsb
install -v -m 0755 halt /sbin
install -v -m 0755 pause /usr/bin
install -v -m 0755 suspend /sbin
install -v -m 0755 shutdown /sbin
install -v -m 0755 ifup /sbin
install -v -m 0755 ifdown /sbin
install -v -m 0644 halt.8 /usr/share/man/man8
ln -sv /usr/share/man/man8/halt.8 /usr/share/man/man8/{reboot.8,poweroff.8}
install -v -m 0644 shutdown.8 /usr/share/man/man8
install -v -m 0644 ifup.8 /usr/share/man/man8
ln -sv /usr/share/man/man8/ifup.8 /usr/share/man/man8/ifdown.8
install -v -m 0754 ipv4-static-route /lib/services
install -v -m 0754 ipv4-static /lib/services
install -v -m 0644 createfiles /etc/sysconfig
install -v -m 0644 udev_retry /etc/sysconfig
install -v -m 0644 rc.site /etc/sysconfig
ln -sfv halt /sbin/poweroff
ln -sfv halt /sbin/reboot
install -v -m 0644 pause.1 /usr/share/man/man1
install -v -m 0644 runit.conf.5 /usr/share/man/man5
install -dv /etc/sv
install -dv /etc/runit/runsvdir
install -v -m 0755 ${SCRIPTS} /etc/runit
install -v -m 0644 runit.conf /etc
cp -aP services/* /etc/sv
