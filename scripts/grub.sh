#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
ACCEPT_LICENSE=* equo i "sys-boot/grub"
echo "set timeout=0" >> /etc/grub.d/40_custom
grub2-install /dev/sda
grub2-mkconfig -o /boot/grub/grub.cfg
EOF
