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
	install -m ${MODE} blfs/services/dhclient ${LIBDIR}

install-service-dhcpcd: create-service-dir
	install -m ${MODE} blfs/services/dhcpcd  ${LIBDIR}

install-service-bridge: create-service-dir
	install -m ${MODE} blfs/services/bridge  ${LIBDIR}

install-service-ipx: create-service-dir
	install -m ${MODE} blfs/services/ipx ${LIBDIR}

install-service-pppoe: create-service-dir
	install -m ${MODE} blfs/services/pppoe  ${LIBDIR}
	install -d -m ${DIRMODE} ${EXTDIR}/ppp/peers
	install -m ${CONFMODE} blfs/ppp/pppoe ${EXTDIR}/ppp/peers

install-service-wpa: create-service-dir
	install -m ${MODE} blfs/services/wpa ${LIBDIR}

install-autofs: create-dirs
	install -m $(CONFMODE) blfs/sysconfig/autofs.conf $(EXTDIR)/sysconfig/

install-bluetooth: create-dirs
	install -m ${CONFMODE} blfs/sysconfig/bluetooth ${EXTDIR}/sysconfig/bluetooth

install-saslauthd: create-dirs
	install -m ${CONFMODE} blfs/sysconfig/saslauthd ${EXTDIR}/sysconfig/saslauthd
	
install-dhcpd: create-dirs
	install -m ${CONFMODE} blfs/sysconfig/dhcpd ${EXTDIR}/sysconfig/dhcpd

install-slapd: create-dirs
	install -m ${CONFMODE} blfs/sysconfig/slapd ${EXTDIR}/sysconfig/slapd

uninstall-bluetooth:
	rm -f ${EXTDIR}/sysconfig/bluetooth

uninstall-saslauthd:
	rm -f ${EXTDIR}/sysconfig/saslauthd

uninstall-dhcpd:
	rm -f ${EXTDIR}/sysconfig/dhcpd

uninstall-slapd:
	rm -f ${EXTDIR}/sysconfig/slapd

.PHONY: all create-dirs create-service-dir \
	install-service-bridge \
	install-service-dhclient \
	install-service-dhcpcd \
	install-service-ipx \
	install-service-pppoe \
	install-service-wpa \
	install-autofs \
	install-bluetooth \
	install-saslauthd \
	install-dhcpd \
	install-slapd \
	uninstall-bluetooth \
	uninstall-saslauthd \
	uninstall-dhcpd \
	uninstall-slapd \

