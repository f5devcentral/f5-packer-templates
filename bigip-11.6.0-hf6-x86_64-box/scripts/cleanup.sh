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