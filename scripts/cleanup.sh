#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
equo rm sys-kernel/sabayon-sources sabayon-live sabayon-artwork-isolinux
equo cleanup

cp /etc/systemd/system/autologin@.service \
    /usr/lib/systemd/system/getty@.service

rm -rf /etc/systemd/system/autologin@.service

EOF

rm -rf /mnt/sabayon/usr/portage
rm -rf /mnt/sabayon/tmp/*
rm -rf /mnt/sabayon/var/log/*
rm -rf /mnt/sabayon/var/tmp/*

equo i zerofree

mount -o remount,ro /mnt/sabayon
zerofree /dev/sda4

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3
mkswap /dev/sda3
