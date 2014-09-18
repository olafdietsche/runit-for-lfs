SHELL=/bin/bash

ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
MODE=754
DIRMODE=755
CONFMODE=644

all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list" 

create-dirs:
	install -d -m ${DIRMODE} ${EXTDIR}/sysconfig

create-service-dir:
	install -d -m ${DIRMODE} ${LIBDIR}

install-service-dhclient: create-service-dir
	install -m ${MODE} lsb/dhclient ${LIBDIR}

install-service-dhcpcd: create-service-dir
	install -m ${MODE} lsb/dhcpcd  ${LIBDIR}

install-service-bridge: create-service-dir
	install -m ${MODE} lsb/bridge  ${LIBDIR}

install-service-wpa: create-service-dir
	install -m ${MODE} lsb/wpa ${LIBDIR}

install-acpid:
	mkdir -pv ${ETCDIR}/sv/acpid
	cp -apv services/acpid/* ${EXTDIR}/sv/acpid
	ln -sfv ${EXTDIR}/sv/acpid ${EXTDIR}/runit/runsvdir/multi
	chmod +x ${ETCDIR}/sv/acpid/*
	chmod +x ${ETCDIR}/sv/acpid/log/*

install-alsa:
	mkdir -pv ${ETCDIR}/sv/audio
	cp -apv services/audio/* ${ETCDIR}/sv/audio
	ln -sfv ${EXTDIR}/sv/audio ${EXTDIR}/runit/runsvdir/multi
	chmod +x ${ETCDIR}/sv/audio/*

install-autofs:
	install -m ${CONFMODE} sysconfig/autofs.conf ${EXTDIR}/sysconfig/
	mkdir -pv ${ETCDIR}/sv/autofs
	cp -apv services/autofs/* ${ETCDIR}/sv/autofs
	ln -sfv ${EXTDIR}/sv/autofs ${EXTDIR}/runit/runsvdir/multi
	chmod +x ${ETCDIR}/sv/autofs/*

install-atd:
	mkdir -pv ${ETCDIR}/sv/atd
	cp -apv services/atd/* ${ETCDIR}/sv/atd
	ln -sfv ${EXTDIR}/sv/atd ${EXTDIR}/runit/runsvdir/multi
	chmod +x ${ETCDIR}/sv/atd/*
	chmod +x ${ETCDIR}/sv/atd/log/*

install-avahi:
	mkdir -pv ${ETCDIR}/sv/avahi-daemon
	cp -apv services/avahi-daemon/* ${ETCDIR}/sv/avahi-daemon
	ln -sfv ${ETCDIR}/sv/avahi-daemon ${ETCDIR}/runit/runsvdir/multi
	chmod +x ${ETCDIR}/sv/avahi-daemon/*

install-bind:
	mkdir -pv ${ETCDIR}/sv/bind

install-bluetooth: create-dirs
	install -m ${CONFMODE} sysconfig/bluetooth ${EXTDIR}/sysconfig/bluetooth
	mkdir -pv ${ETCDIR}/sv/bluetooth

install-cups:
	mkdir -pv ${ETCDIR}/sv/cupsd

install-dbus:
	mkdir -pv ${ETCDIR}/sv/dbus

install-dhcpd: create-dirs
	install -m ${CONFMODE} sysconfig/dhcpd ${EXTDIR}/sysconfig/dhcpd
	mkdir -pv ${ETCDIR}/sv/dhcpd

install-dovecot:
	mkdir -pv ${ETCDIR}/sv/dovecot

install-exim:
	mkdir -pv ${ETCDIR}/sv/exim

install-fcron:
	mkdir -pv ${ETCDIR}/sv/fcron

install-gpm:
	mkdir -pv ${ETCDIR}/sv/gpm

install-haveged:
	mkdir -pv ${ETCDIR}/sv/haveged

install-httpd:
	mkdir -pv ${ETCDIR}/sv/httpd

install-iptables:
	mkdir -pv ${ETCDIR}/sv/iptables

install-krb5:
	mkdir -pv ${ETCDIR}/sv/krb5

install-lxdm:
	mkdir -pv ${ETCDIR}/sv/lxdm

install-mysql:
	mkdir -pv ${ETCDIR}/sv/mysql

install-netfs:
	mkdir -pv ${ETCDIR}/sv/netfs

install-networkmanager:
	mkdir -pv ${ETCDIR}/sv/networkmanager

install-nfs-client:
	mkdir -pv ${ETCDIR}/sv/nfs-client

install-nfs-server:
	mkdir -pv ${ETCDIR}/sv/nfs-server

install-ntpd:
	mkdir -pv ${ETCDIR}/sv/ntpd

install-php:
	mkdir -pv ${ETCDIR}/sv/php-fpm

install-postfix:
	mkdir -pv ${ETCDIR}/sv/postfix

install-postgresql:
	mkdir -pv ${ETCDIR}/sv/postgresql

install-proftpd:
	mkdir -pv ${ETCDIR}/sv/proftpd

install-qpopper:
	mkdir -pv ${ETCDIR}/sv/qpopper
	mkdir -pv ${ETCDIR}/sv/qpopper-ssl

install-rpcbind:
	mkdir -pv ${ETCDIR}/sv/rpcbind

install-rsyncd:
	mkdir -pv ${ETCDIR}/sv/rsyncd

install-samba:
	mkdir -pv ${ETCDIR}/sv/nmbd
	mkdir -pv ${ETCDIR}/sv/smbd

install-saslauthd:
	mkdir -pv ${ETCDIR}/sv/saslauthd

install-sendmail:
	mkdir -pv ${ETCDIR}/sv/sendmail

install-slapd:
	mkdir -pv ${ETCDIR}/sv/slapd

install-smartd:
	mkdir -pv ${ETCDIR}/sv/smartd

install-soprano:
	mkdir -pv ${ETCDIR}/sv/soprano

install-sshd:
	mkdir -pv ${ETCDIR}/sv/sshd

install-stunnel:
	mkdir -pv ${ETCDIR}/sv/stunnel

install-svn:
	mkdir -pv ${ETCDIR}/sv/svn

install-swat:
	mkdir -pv ${ETCDIR}/sv/swat

install-sysstat:
	mkdir -pv ${ETCDIR}/sv/sysstat

install-vboxservice:
	mkdir -pv ${ETCDIR}/sv/vboxservice

install-virtuoso:
	mkdir -pv ${ETCDIR}/sv/virtuoso

install-vsftpd:
	mkdir -pv ${ETCDIR}/sv/vsftpd

install-wicd:
	mkdir -pv ${ETCDIR}/sv/wicd

install-winbindd:
	mkdir -pv ${ETCDIR}/sv/winbindd

install-xinetd:
	mkdir -pv ${ETCDIR}/sv/xinetd

uninstall-acpid:
	rm -rvf ${ETCDIR}/sv/acpid

uninstall-alsa:
	rm -rvf ${ETCDIR}/sv/audio

uninstall-atd:
	rm -rvf ${ETCDIR}/sv/atd

uninstall-autofs:
	rm -vf ${ETCDIR}/sysconfig/autofs.conf
	rm -rvf ${ETCDIR}/sv/autofs

uninstall-avahi:
	rm -rvf ${ETCDIR}/sv/avahi-daemon

uninstall-bind:
	rm -rvf ${ETCDIR}/sv/bind

uninstall-bluetooth:
	rm -vf ${EXTDIR}/sysconfig/bluetooth
	rm -rfv ${ETCDIR}/sv/bluetooth

uninstall-cups:
	rm -rvf ${ETCDIR}/sv/cupsd

uninstall-dbus:
	rm -rvf ${ETCDIR}/sv/dbus

uninstall-dhcpd:
	rm -vf ${EXTDIR}/sysconfig/dhcpd
	rm -rvf ${ETCDIR}/sv/dhcpd

uninstall-dovecot:
	rm -rvf ${ETCDIR}/sv/dovecot

uninstall-exim:
	rm -rvf ${ETCDIR}/sv/exim

uninstall-fcron:
	rm -rvf ${ETCDIR}/sv/fcron

uninstall-gpm:
	rm -rvf ${ETCDIR}/sv/gpm

uninstall-haveged:
	rm -rvf ${ETCDIR}/sv/haveged

uninstall-httpd:
	rm -rvf ${ETCDIR}/sv/httpd

uninstall-iptables:
	rm -rvf ${ETCDIR}/sv/iptables

uninstall-krb5:
	rm -rvf ${ETCDIR}/sv/krb5

uninstall-mysql:
	rm -rvf ${ETCDIR}/sv/mysql

uninstall-netfs:
	rm -rvf ${ETCDIR}/sv/netfs

uninstall-networkmanager:
	rm -rvf ${ETCDIR}/sv/networkmanager

uninstall-nfs-client:
	rm -rvf ${ETCDIR}/sv/nfs-client

uninstall-nfs-server:
	rm -rvf ${ETCDIR}/sv/nfs-server

uninstall-ntpd:
	rm -rvf ${ETCDIR}/sv/ntpd

uninstall-php:
	rm -rvf ${ETCDIR}/sv/php-fpm

uninstall-postfix:
	rm -rvf ${ETCDIR}/sv/postfix

uninstall-postgresql:
	rm -rvf ${ETCDIR}/sv/postgresql

uninstall-proftpd:
	rm -rvf ${ETCDIR}/sv/proftpd

uninstall-qpopper:
	rm -rvf ${ETCDIR}/sv/qpopper
	rm -rvf ${ETCDIR}/sv/qpopper-ssl

uninstall-rsyncd:
	rm -rvf ${ETCDIR}/sv/rsyncd

uninstall-samba:
	rm -rvf ${ETCDIR}/sv/nmbd
	rm -rvf ${ETCDIR}/sv/smbd

uninstall-saslauthd:
	rm -f ${EXTDIR}/sysconfig/saslauthd
	rm -rvf ${ETCDIR}/sv/saslauthd

uninstall-sendmail:
	rm -rvf ${ETCDIR}/sv/sendmail

uninstall-slapd:
	rm -f ${EXTDIR}/sysconfig/slapd
	rm -rvf ${ETCDIR}/sv/slapd

uninstall-smartd:
	rm -rvf ${ETCDIR}/sv/smartd

uninstall-sshd:
	rm -rvf ${ETCDIR}/sv/sshd

uninstall-stunnel:
	rm -rvf ${ETCDIR}/sv/stunnel

uninstall-svn:
	rm -rvf ${ETCDIR}/sv/svn

uninstall-sysstat:
	rm -rvf ${ETCDIR}/sv/sysstat

uninstall-unbound:
	rm -rvf ${ETCDIR}/sv/unbound

uninstall-vboxservice:
	rm -rvf ${ETCDIR}/sv/vboxservice

uninstall-virtuoso:
	rm -rvf ${ETCDIR}/sv/virtuoso

uninstall-vsftpd:
	rm -rvf ${ETCDIR}/sv/vsftpd

uninstall-winbindd:
	rm -rvf ${ETCDIR}/sv/winbindd

uninstall-xinetd:
	rm -rvf ${ETCDIR}/sv/xinetd

.PHONY: all create-dirs create-service-dir \
	install-service-dhclient \
	install-service-dhcpcd \
	install-service-ipx \
	install-service-pppoe \
	install-atd \
	install-acpid \
	install-alsa \
	install-avahi \
	install-httpd \
	install-php \
	install-bind \
	install-bluetooth \
	install-cups \
	install-saslauthd \
	install-dhcpd \
	install-dovecot \
	install-exim \
	install-fcron \
	install-gdm \
	install-gpm \
	install-heimdal \
	install-iptables \
	install-krb5 \
	install-lxdm \
	install-mysql \
	install-netfs \
	install-networkmanager \
	install-nfs-client \
	install-nfs-server \
	install-ntp \
	install-slapd \
	install-postfix \
	install-postgresql \
	install-proftpd \
	install-qpopper \
	install-random \
	install-rsync \
	install-samba \
	install-sendmail \
	install-smartd \
	install-soprano \
	install-sshd \
	install-stunnel \
	install-svn \
	install-sysstat \
	install-vsftpd \
	install-unbound \
	install-vboxservice \
	install-virtuoso \
	install-winbindd \
	install-xinetd \
	uninstall-acpid \
	uninstall-alsa \
	uninstall-atd \
	uninstall-avahi \
	uninstall-bind \
	uninstall-bluetooth \
	uninstall-cups \
	uninstall-dhcpd \
	uninstall-dovecot \
	uninstall-exim \
	uninstall-fcron \
	uninstall-gpm \
	uninstall-httpd \
	uninstall-iptables \
	uninstall-krb5 \
	uninstall-lxdm \
	uninstall-mysql \
	uninstall-netfs \
	uninstall-networkmanager \
	uninstall-nfs-client \
	uninstall-nfs-server \
	uninstall-ntp \
	uninstall-slapd \
	uninstall-php \
	uninstall-postfix \
	uninstall-postgresql \
	uninstall-proftpd \
	uninstall-qpopper \
	uninstall-rsync \
	uninstall-samba \
	uninstall-saslauthd \
	uninstall-sendmail \
	uninstall-smartd \
	uninstall-soprano \
	uninstall-sshd \
	uninstall-stunnel \
	uninstall-svn \
	uninstall-sysstat \
	uninstall-unbound \
	uninstall-vboxservice \
	uninstall-virtuoso \
	uninstall-vsftpd   \
	uninstall-winbindd \
	uninstall-xinetd
