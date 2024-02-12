#!/usr/bin/env bash

mkdir /data
sudo mount /dev/xvdb /data
sudo blkid

echo "Enter UUID:"
read uuid
UUID=$uuid /data ext4 defaults 0 2
