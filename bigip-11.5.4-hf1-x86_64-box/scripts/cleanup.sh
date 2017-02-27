#!/bin/bash

rm -rf /shared/vagrant
rm -rf /var/log/ltm
rm -rf /root/.bash_history
rm -rf /shared/images/*.iso
rm -rf /var/named/config/rndc.key
rm -rf /var/dnscached/config/rndc.key

# Handle cleaning up SSH slightly differently because on BIG-IP
# all of the SSH files are symlinks. So zero out the symlink targets
> /var/ssh/root/authorized_keys
> /var/ssh/root/identity
> /var/ssh/root/identity.pub
> /var/ssh/root/known_hosts

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

sleep 60
exit 0