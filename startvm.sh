#!/bin/bash

let "MAC1 = $RANDOM % 99 + 1"
let "MAC2 = $RANDOM % 99 + 1"
let "MAC3 = $RANDOM % 99 + 1"
let "MAC4 = $RANDOM % 99 + 1"

DEV=tap$1

sudo openvpn --mktun --dev $DEV
sudo brctl addif br0 $DEV
sudo ip link set dev $DEV up
qemu-system-mips -kernel bin/malta/openwrt-malta-be-vmlinux-initramfs.elf -nographic -m 256 -net nic,macaddr=52:54:${MAC1}:${MAC2}:${MAC3}:${MAC4} -net tap,ifname=$DEV,script=no,downscript=no

