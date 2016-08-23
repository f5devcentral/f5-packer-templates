#!/bin/bash

rm -rf /shared/vagrant
rm -rf /var/log/ltm
rm -rf /root/.ssh
rm -rf /root/.bash_history
rm -rf /var/named/config/rndc.key
rm -rf /var/dnscached/config/rndc.key

sleep 60
