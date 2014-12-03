#!/bin/sh
#
# rc.M		This file is executed by Runit for Stage 2 of the boot process.
#
# Version:	@(#)/etc/rc.d/rc.M	v2.24	Sat Nov 29, 2014
#
# Author:	Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
#		Heavily modified by Patrick Volkerding <volkerdi@slackware.com>
#		Further modifications by James Powell <james4591@hotmail.com>
#

# Tell the viewers what's going to happen.
echo "Going multiuser..."

# Screen blanks after 15 minutes idle time, and powers down in one hour
# if the kernel supports APM or ACPI power management:
/bin/setterm -blank 15 -powersave powerdown -powerdown 60

# Set the permissions on /var/log/dmesg according to whether the kernel
# permits non-root users to access kernel dmesg information:
if [ -r /proc/sys/kernel/dmesg_restrict ]; then
  if [ $(cat /proc/sys/kernel/dmesg_restrict) = 1 ]; then
    touch /var/log/dmesg
    chmod 640 /var/log/dmesg
  fi
else
  touch /var/log/dmesg
  chmod 644 /var/log/dmesg
fi
# Save the contents of 'dmesg':
/bin/dmesg -s 65536 > /var/log/dmesg

# Initialize PCMCIA devices:
#
# NOTE: This used to be started near the top of rc.S so that PCMCIA devices
# could be fsck'ed along with the other drives.  This had some unfortunate
# side effects, however, since root isn't yet read-write, and /var might not
# even be mounted the .pid files can't be correctly written in /var/run and
# the pcmcia system can't be correctly shut down.  If you want some PCMCIA
# partition to be mounted at boot (or when the card is inserted) then add
# the appropriate lines to /etc/pcmcia/scsi.opts.
#
# Note that the stuff in /etc/pcmcia/ is only for 2.4.x kernels using
# 16-bit PCMCIA cards (not 32-bit Cardbus cards!).  For example, with a
# wireless card you might need to set options in /etc/pcmcia OR in
# /etc/rc.d/rc.wireless.conf, or even in /etc/rc.d/rc.inet1.conf (with
# extra options if needed for the encryption key, ESSID, etc.)
#
# Hopefully this situation will be unified in the future, but for now
# that's how it is...
#
if [ -x /etc/rc.d/rc.pcmcia ]; then
  . /etc/rc.d/rc.pcmcia start
  # The cards might need a little extra time here to initialize.
  sleep 5
fi

# Start the system logger.
if [ -x /etc/rc.d/rc.syslog -a -x /usr/sbin/syslogd -a -d /var/log ]; then
  . /etc/rc.d/rc.syslog start
fi

# Initialize the networking hardware.
if [ -x /etc/rc.d/rc.inet1 ]; then
  . /etc/rc.d/rc.inet1
fi

# Look for additional USB/SCSI/IEEE1394/etc devices on multiple LUNs:
if [ -x /etc/rc.d/rc.scanluns ]; then
  . /etc/rc.d/rc.scanluns
fi

# Start networking daemons:
if [ -x /etc/rc.d/rc.inet2 ]; then
  . /etc/rc.d/rc.inet2
fi

# Mount any additional filesystem types that haven't already been mounted:
mount -a -v 2> /dev/null | grep -v "already mounted"

# Start the Control Script for automounter:
if [ -x /etc/rc.d/rc.autofs ]; then
  sh /etc/rc.d/rc.autofs start
fi

# Start the Network Time Protocol daemon:
if [ -x /etc/rc.d/rc.ntpd ]; then
  sh /etc/rc.d/rc.ntpd start
fi

# Remove stale locks and junk files (must be done after mount -a!)
/bin/rm -f /var/lock/* /var/spool/uucp/LCK..* /tmp/.X*lock /tmp/core /core 2> /dev/null
/bin/rm -rf /var/spool/cron/cron.?????? 2> /dev/null

# Remove stale hunt sockets so the game can start.
if [ -r /tmp/hunt -o -r /tmp/hunt.stats ]; then
  echo "Removing your stale hunt sockets from /tmp."
  /bin/rm -f /tmp/hunt*
fi

# Ensure basic filesystem permissions sanity.
chmod 755 / 2> /dev/null
chmod 1777 /tmp /var/tmp

# Start APM or ACPI daemon.
# If APM is enabled in the kernel, start apmd:
if [ -e /proc/apm ]; then
  if [ -x /usr/sbin/apmd ]; then
    echo "Starting APM daemon:  /usr/sbin/apmd"
    /usr/sbin/apmd
  fi
elif [ -x /etc/rc.d/rc.acpid ]; then # otherwise, start acpid:
  . /etc/rc.d/rc.acpid start
fi

# Start D-Bus:
if [ -x /etc/rc.d/rc.messagebus ]; then
  sh /etc/rc.d/rc.messagebus start
fi

# Start console-kit-daemon:
if [ -x /etc/rc.d/rc.consolekit ]; then
  sh /etc/rc.d/rc.consolekit start
fi

# Start HAL:
if [ -x /etc/rc.d/rc.hald ]; then
  sh /etc/rc.d/rc.hald start
fi

# Start Bluetooth:
if [ -x /etc/rc.d/rc.bluetooth ]; then
  sh /etc/rc.d/rc.bluetooth start
fi

# Start wicd or networkmanager:
if [ -x /etc/rc.d/rc.wicd -a -x /usr/sbin/wicd ]; then
  sh /etc/rc.d/rc.wicd start
elif [ -x /etc/rc.d/rc.networkmanager ]; then
  sh /etc/rc.d/rc.networkmanager start
fi

# Start dnsmasq, a simple DHCP/DNS server:
if [ -x /etc/rc.d/rc.dnsmasq ]; then
  /etc/rc.d/rc.dnsmasq start
fi

# Start snmpd:
if [ -x /etc/rc.d/rc.snmpd ]; then
  /etc/rc.d/rc.snmpd start
fi

# Start the print spooling system.  This will usually be LPRng (lpd) or CUPS.
if [ -x /etc/rc.d/rc.cups ]; then
  # Start CUPS:
  /etc/rc.d/rc.cups start
elif [ -x /etc/rc.d/rc.lprng ]; then
  # Start LPRng (lpd):
  . /etc/rc.d/rc.lprng start
fi

# Start netatalk. (a file/print server for Macs using Appletalk)
if [ -x /etc/rc.d/rc.atalk ]; then
  /etc/rc.d/rc.atalk start
fi

# Start smartd, which monitors the status of S.M.A.R.T. compatible
# hard drives and reports any problems.  Note some devices (which aren't
# smart, I guess ;) will hang if probed by smartd, so it's commented out
# by default.
#if [ -x /usr/sbin/smartd ]; then
#  /usr/sbin/smartd
#fi

# Monitor the UPS with genpowerd.
# To use this, uncomment this section and edit your settings in
# /etc/genpowerd.conf (serial device, UPS type, etc).  For more information,
# see "man genpowerd" or the extensive documentation in the
# /usr/doc/genpower-*/ directory.
# You'll also need to configure a similar block in /etc/rc.d/rc.6 if you want
# support for stopping the UPS's inverter after the machine halts.
#if [ -x /sbin/genpowerd ]; then
#  echo "Starting genpowerd daemon..."
#  /sbin/genpowerd
#fi

# Turn on process accounting.  To enable process accounting, make sure the
# option for BSD process accounting is enabled in your kernel, and then
# create the file /var/log/pacct (touch /var/log/pacct).  By default, process
# accounting is not enabled (since /var/log/pacct does not exist).  This is
# because the log file can get VERY large.
if [ -x /sbin/accton -a -r /var/log/pacct ]; then
  chmod 640 /var/log/pacct
  /sbin/accton /var/log/pacct
fi

# Start crond (Dillon's crond):
# If you want cron to actually log activity to /var/log/cron, then change
# -l notice to -l info to increase the logging level.
if [ -x /usr/sbin/crond ]; then
  /usr/sbin/crond -l notice
fi

# Start atd (manages jobs scheduled with 'at'):
if [ -x /usr/sbin/atd ]; then
  /usr/sbin/atd -b 15 -l 1
fi

# Slackware-Mini-Quota-HOWTO:
# To really activate quotas, you'll need to add 'usrquota' and/or 'grpquota' to
# the appropriate partitions as listed in /etc/fstab.  Here's an example:
#
# /dev/hda2      /home      ext3     defaults,usrquota      1   1
#
# You'll then need to setup initial quota files at the top of the partitions
# to support quota, like this:
# touch /home/aquota.user /home/aquota.group
# chmod 600 /home/aquota.user /home/aquota.group
#
# Then, reboot to activate the system.
# To edit user quotas, use 'edquota'.  See 'man edquota'.  Also, the
# official Quota Mini-HOWTO has lots of useful information.  That can be found
# here:  /usr/doc/Linux-HOWTOs/Quota

# Check quotas and then turn quota system on:
if grep -q quota /etc/fstab ; then
  for quotafs in $(awk '/quota/ {print $2}' /etc/fstab) ; do
    /bin/rm -f $quotafs/{a,}quota.{group,user}.new
  done
  if [ -x /sbin/quotacheck ]; then
    echo "Checking filesystem quotas:  /sbin/quotacheck -avugm"
    /sbin/quotacheck -avugm
  fi
  if [ -x /sbin/quotaon ]; then
    echo "Activating filesystem quotas:  /sbin/quotaon -avug"
    /sbin/quotaon -avug
  fi
fi

# Start the SASL authentication server.  This provides SASL
# authentication services for sendmail:
if [ -x /etc/rc.d/rc.saslauthd ]; then
  . /etc/rc.d/rc.saslauthd start
fi

# Start the sendmail daemon:
if [ -x /etc/rc.d/rc.sendmail ]; then
  . /etc/rc.d/rc.sendmail start
fi

# Load ALSA (sound) defaults:
if [ -x /etc/rc.d/rc.alsa ]; then
  . /etc/rc.d/rc.alsa
fi

# Load a custom screen font if the user has an rc.font script.
if [ -x /etc/rc.d/rc.font ]; then
  . /etc/rc.d/rc.font
fi

# Load a custom keymap if the user has an rc.keymap script.
if [ -x /etc/rc.d/rc.keymap ]; then
  . /etc/rc.d/rc.keymap
fi

# Start the MySQL database:
if [ -x /etc/rc.d/rc.mysqld ]; then
  . /etc/rc.d/rc.mysqld start
fi

# Start Apache web server:
if [ -x /etc/rc.d/rc.httpd ]; then
  . /etc/rc.d/rc.httpd start
fi

# Start OpenLDAP:
if [ -x /etc/rc.d/rc.openldap ]; then
  . /etc/rc.d/rc.openldap start
fi

# Start Samba (a file/print server for Win95/NT machines).
# Samba can be started in /etc/inetd.conf instead.
if [ -x /etc/rc.d/rc.samba ]; then
  . /etc/rc.d/rc.samba start
fi

# Start the GPM mouse server:
if [ -x /etc/rc.d/rc.gpm ]; then
  . /etc/rc.d/rc.gpm start
fi

# Start the local setup procedure.
if [ -x /etc/rc.d/rc.local ]; then
  . /etc/rc.d/rc.local
fi

# All done.
