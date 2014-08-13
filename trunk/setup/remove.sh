#!/bin/sh

# Copyright 2014 The runit-for-lfs project
# https://code.google.com/p/runit-for-lfs/
# Authors: James Powell and Arther Radley

# This script is used to remove lfs-for-runit.

rm -rf /lib/lsb /lib/services
rm -rf /etc/sv
rm -rf /etc/runit/runsvdir
rm -rf /var/services
rm -rf /etc/runit.conf

pushd /etc/sysconfig
rm -rf createfiles udev_retry rc.site
popd

pushd /sbin
rm -rf halt suspend shutdown ifup ifdown reboot poweroff
popd

rm -rf /usr/bin/pause

pushd /usr/share/man/man1
rm -rf pause.1
popd

pushd /usr/share/man/man8
rm -rf ifup.8 ifdown.8 halt.8 shutdown.8 reboot.8
popd
