#!/bin/bash

tmsh create auth user vagrant password vagrant partition-access add { all-partitions { role admin } } shell bash

# This is added so that rsync synced_folder will work
groupadd vagrant && usermod -a -G vagrant vagrant

echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
mv /shared/vagrant/files/vagrant.pub /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
