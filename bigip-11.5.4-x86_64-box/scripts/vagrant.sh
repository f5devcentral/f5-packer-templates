#!/bin/bash

tmsh create auth user vagrant password vagrant partition-access all role admin shell bash
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
mv /shared/vagrant/files/vagrant.pub /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
