#!/bin/bash

rpm -Uvh /shared/vagrant/files/sudo-1.8.16-1.el5.x86_64.rpm
sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers