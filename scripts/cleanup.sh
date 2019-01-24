#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
equo rm sys-kernel/sabayon-sources sabayon-live sabayon-artwork-isolinux

equo rm app-admin/calamares app-misc/calamares-sabayon-server-base-modules app-misc/calamares-sabayon @X

for c in "x11-libs" "x11-themes" "dev-qt" "kde-frameworks" "media-libs";
do

    TO_REMOVE=$(equo q list installed -q | grep $c )
    for i in ${TO_REMOVE[@]};do echo "Removing $i"; equo rm $i; done

done

equo cleanup

cp /etc/systemd/system/autologin@.service \
    /usr/lib/systemd/system/getty@.service

rm -rf /etc/systemd/system/autologin@.service

sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

EOF

rm -rf /mnt/sabayon/usr/portage
rm -rf /mnt/sabayon/tmp/*
rm -rf /mnt/sabayon/var/log/*
rm -rf /mnt/sabayon/var/tmp/*

systemctl enable sshd

equo i zerofree
mount -o remount,ro /mnt/sabayon
zerofree /dev/sda4

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3
mkswap /dev/sda3
