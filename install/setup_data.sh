#!/usr/bin/env bash

sudo mkdir -p /data
sudo mount /dev/xvdb /data
sudo blkid

echo "Enter UUID:"
read uuid
echo "UUID=$uuid /data ext4 defaults 0 2"
echo "Add this line to 'sudo vi /etc/fstab'"
