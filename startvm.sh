#!/bin/bash

DEV1=tap0
DEV2=tap1

sudo openvpn --mktun --dev $DEV1
sudo openvpn --mktun --dev $DEV2
sudo ip link set dev $DEV1 up
sudo ip link set dev $DEV2 up
sudo ip add change dev $DEV1 192.168.11.1/24
sudo ip add change dev $DEV2 192.168.11.2/24

qemu-system-mipsel -kernel bin/malta/openwrt-malta-le-vmlinux-initramfs.elf -nographic -m 256 -net nic -net tap,ifname=$DEV1,script=no,downscript=no -net nic -net tap,ifname=$DEV2,script=no,downscript=no

