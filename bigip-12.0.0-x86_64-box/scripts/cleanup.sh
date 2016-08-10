#!/bin/bash

rm -rf /shared/vagrant
rm -rf /var/log/ltm
rm -rf /root/.ssh
rm -rf /root/.bash_history
rm -rf /shared/images/*.iso
rm -rf /var/named/config/rndc.key
rm -rf /var/dnscached/config/rndc.key

dd if=/dev/zero of=/EMPTY bs=1M
dd if=/dev/zero of=/config/EMPTY bs=1M
dd if=/dev/zero of=/usr/EMPTY bs=1M
dd if=/dev/zero of=/var/EMPTY bs=1M
dd if=/dev/zero of=/shared/EMPTY bs=1M
dd if=/dev/zero of=/var/log/EMPTY bs=1M

rm -rf /EMPTY
rm -rf /config/EMPTY
rm -rf /usr/EMPTY
rm -rf /var/EMPTY
rm -rf /shared/EMPTY
rm -rf /var/log/EMPTY

exit 0