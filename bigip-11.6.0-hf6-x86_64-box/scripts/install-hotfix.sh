#!/bin/bash

# Thanks for Alec Istomin for these status monitoring loops

mv /shared/vagrant/software/* /shared/images/

echo Wait for BIG-IP hashing to settle
sleep 60

echo "tmsh delete sys software volume HD1.2"
tmsh delete sys software volume HD1.2

sleep 60
echo "tmsh install sys software image $ISO_BASE volume HD1.2 create-volume"

tmsh install sys software image $ISO_BASE volume HD1.2 create-volume
while sleep 15; do
    tmsh show sys software status|grep "HD1.2"|grep -v waiting|grep -q complete && break
done

echo "Wait for install to settle"
sleep 30

echo "tmsh install sys software hotfix $ISO_HF volume HD1.2 reboot"
tmsh install sys software hotfix $ISO_HF volume HD1.2 reboot
while sleep 15; do
    tmsh show sys software status|grep "HD1.2"|grep -v waiting|grep -q complete && break
done

# Waits for the BIG-IP to automatically reboot itself
sleep 36000
