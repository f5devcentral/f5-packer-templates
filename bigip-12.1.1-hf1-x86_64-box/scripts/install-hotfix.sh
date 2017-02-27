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

# Thanks for Alec Istomin for these status monitoring loops

mv /shared/vagrant/software/* /shared/images/

echo Wait for BIG-IP hashing to settle
sleep 120

echo "tmsh delete sys software volume HD1.2"
tmsh delete sys software volume HD1.2

sleep 120
echo "tmsh install sys software image $ISO_BASE volume HD1.2 create-volume"

tmsh install sys software image $ISO_BASE volume HD1.2 create-volume
echo "Waiting for base install to settle"
while sleep 15; do
    tmsh show sys software status|grep "HD1.2"|grep -v waiting|grep -q complete && break
    echo "sleeping 15 seconds"
done
echo "done"

echo "Wait for install to settle"
sleep 60

echo "tmsh install sys software hotfix $ISO_HF volume HD1.2 reboot"
tmsh install sys software hotfix $ISO_HF volume HD1.2 reboot
echo "Waiting for hotfix install to settle"
while sleep 15; do
    tmsh show sys software status|grep "HD1.2"|grep -v waiting|grep -q complete && break
    echo "sleeping 15 seconds"
done
echo "done"

echo "Sleeping. Letting to let auto-reboot take over"
# Waits for the BIG-IP to automatically reboot itself
sleep 36000

exit 0