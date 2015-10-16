#!/bin/bash

cd /
mkdir /mnt/sabayon/proc
mkdir /mnt/sabayon/boot
mkdir /mnt/sabayon/dev
mkdir /mnt/sabayon/sys
mkdir /mnt/sabayon/tmp

mount /dev/sda1 /mnt/sabayon/boot
mount -t proc proc /mnt/sabayon/proc
mount --rbind /dev /mnt/sabayon/dev
mount --rbind /sys /mnt/sabayon/sys
