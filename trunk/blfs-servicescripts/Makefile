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

create-svdir:
	install -d -m ${DIRMODE} ${EXTDIR}/sv

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

install-acpid: create-svdir
	install -d -m ${DIRMODE} services/acpid ${EXTDIR}/sv
	ln -sfv ${EXTDIR}/sv/acpid ${EXTDIR}/runit/runsvdir/multi

install-alsa: create-svdir
	install -d -m ${DIRMODE} services/audio ${EXTDIR}/sv
	ln -sfv ${EXTDIR}/sv/audio ${EXTDIR}/runit/runsvdir/multi

install-autofs: create-dirs create-svdir
	install -m $(CONFMODE) sysconfig/autofs.conf $(EXTDIR)/sysconfig/
	install -d -m ${DIRMODE}/sv/autofs ${EXTDIR}/runit/runsvdir/multi
	ln -sfv ${EXTDIR}/sv/autofs ${EXTDIR}/runit/runsvdir/multi

install-atd: create-svdir
	install -d -m ${DIRMODE}/atd ${EXTDIR}/runit/runsvdir/multi
	ln -sfv ${EXTDIR}/sv/atd ${EXTDIR}/runit/runsvdir/multi

install-avahi:

install-bind:

install-bluetooth: create-dirs
	install -m ${CONFMODE} sysconfig/bluetooth ${EXTDIR}/sysconfig/bluetooth

install-cups:

install-dbus:

install-dhcpd: create-dirs
	install -m ${CONFMODE} sysconfig/dhcpd ${EXTDIR}/sysconfig/dhcpd

install-dovecot:

install-exim:

install-fcron:

install-gpm:

install-haveged:

install-httpd:

install-iptables:

install-krb5:

install-lxdm:

install-mysql:

install-netfs:

install-networkmanager:

install-nfs-client:

install-nfs-server:

install-ntpd:

install-php:

install-postfix:

install-postgresql:

install-proftpd:

install-qpopper:

install-rpcbind:

install-rsyncd:

install-samba:

install-saslauthd:

install-sendmail:

install-slapd:

install-smartd:

install-soprano:

install-sshd:

install-stunnel:

install-svn:

install-swat:

install-sysstat:

install-vboxservice:

install-virtuoso:

install-vsftpd:

install-wicd:

install-winbindd:

install-xinetd:

uninstall-acpid:

uninstall-alsa:

uninstall-atd:

uninstall-autofs:

uninstall-avahi:

uninstall-bind:

uninstall-bluetooth:
	rm -f ${EXTDIR}/sysconfig/bluetooth

uninstall-cups:

uninstall-dbus:

uninstall-dhcpd:
	rm -f ${EXTDIR}/sysconfig/dhcpd

uninstall-dovecot:

uninstall-exim:

uninstall-fcron:

uninstall-gpm:

uninstall-haveged:

uninstall-httpd:

uninstall-iptables:

uninstall-krb5:

uninstall-mysql:

uninstall-netfs:

uninstall-networkmanager:

uninstall-nfs-client:

uninstall-nfs-server:

uninstall-ntpd:

uninstall-php:

uninstall-postfix:

uninstall-postgresql:

uninstall-proftpd:

uninstall-rsyncd:

uninstall-samba:

uninstall-saslauthd:
	rm -f ${EXTDIR}/sysconfig/saslauthd

uninstall-sendmail:

uninstall-slapd:
	rm -f ${EXTDIR}/sysconfig/slapd

uninstall-smartd:

uninstall-sshd:

uninstall-stunnel:

uninstall-svn:

uninstall-sysstat:

uninstall-unbound:

uninstall-vboxservice:

uninstall-virtuoso:

uninstall-vsftpd:

uninstall-winbindd:

uninstall-xinetd:

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
