SHELL=    /bin/bash
SCRIPTS=	1 2 3 ctrlaltdel

all:
  $(CC) $(CFLAGS) halt.c -o halt
  $(CC) $(CFLAGS) pause.c -o pause
  $(CC) $(CFLAGS) suspend.c -o suspend

install:
  install -d /bin
  install -d /etc/sysconfig
  ln -s /lib/services /lib/lsb
  install -m755 halt /sbin
  install -m755 pause /usr/bin
  install -m755 suspend /sbin
  install -m755 shutdown /sbin
  install -m755 ifup /sbin
  install -m755 ifdown /sbin
  install -m755 ifup.8 /usr/share/man/man8
  ln -s /usr/share/man/man8/ifup.8 /usr/share/man/man8/ifdown.8
  install -m754 ipv4-static-route  /lib/services
  install -m754 ipv4-static        /lib/services
  install -m644 init-functions /lib/services
  if [ ! -f /etc/sysconfig/createfiles ]; then \
    install -m644 createfiles /etc/sysconfig/ ;\
  fi
  if [ ! -f /etc/sysconfig/modules     ]; then \
    install -m644 modules     /etc/sysconfig/ ;\
  fi
  if [ ! -f /etc/sysconfig/udev_retry  ]; then \
    install -m644 udev_retry  /etc/sysconfig/ ;\
  fi
  if [ ! -f /etc/sysconfig/rc.site     ]; then \
    install -m644 rc.site     /etc/sysconfig/ ;\
  fi
  ln -s halt /sbin/poweroff
  ln -s halt /sbin/reboot
  install -d /usr/share/man/man1
  install -m644 pause.1 /usr/share/man/man1
  install -d /etc/sv
  install -d /etc/runit/runsvdir
  install -m755 ${SCRIPTS} /etc/runit
  install -m644 runit.conf /etc
  cp -aP services/* /etc/sv/

uninstall:
  rm -rf \
  /usr/bin/pause \
  /lib/services \
  /lib/lsb \
  /etc/runit.conf \
  /etc/runit \
  /etc/sv \
  /etc/sysconfig/rc.site \
  /etc/sysconfig/udev_retry \
  /etc/sysconfig/modules \
  /etc/sysconfig/createfiles \
  /sbin/halt \
  /sbin/ifup \
  /sbin/ifdown \
  /sbin/reboot \
  /sbin/shutdown \
  /sbin/suspend \
  /usr/share/man/man1/pause.1 \
  /usr/share/man/man8/ifup.8 \
  /usr/share/man/man8/ifdown.8

clean:
  -rm -f halt pause suspend