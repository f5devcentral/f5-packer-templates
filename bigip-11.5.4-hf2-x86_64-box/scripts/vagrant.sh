#!/bin/bash

tmsh save /sys config

tmsh create auth user vagrant password vagrant partition-access all role admin shell bash
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
mv /shared/vagrant/files/vagrant.pub /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

tmsh save /sys config

# for reasons unknown to me, if we do not restart here then
# the vagrant up for this box will error with "Restarting mcpd"
# continually.
shutdown -r now

sleep 120