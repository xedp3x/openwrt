#!/bin/bash

qemu-system-mips -kernel bin/malta/openwrt-malta-be-vmlinux-initramfs.elf -nographic -m 256 -net tap,ifname=tap0,script=no,downscript=no

