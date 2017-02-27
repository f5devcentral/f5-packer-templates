#!/usr/bin/env bash

# Copyright 2017 F5 Networks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

tmsh save /sys config

tmsh create auth user vagrant password vagrant partition-access add { all-partitions { role admin } } shell bash
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
mv /shared/vagrant/files/vagrant.pub /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# This is added so that rsync synced_folder will work
groupadd vagrant && usermod -a -G vagrant vagrant

tmsh save /sys config

# for reasons unknown to me, if we do not restart here then
# the vagrant up for this box will error with "Restarting mcpd"
# continually.
shutdown -r now

sleep 120
exit 0