#!/bin/bash

echo "Configuring virtualbox!"

chroot /mnt/sabayon /bin/bash <<'EOF'
rsync -av -H -A -X --delete-during "rsync://rsync.at.gentoo.org/gentoo-portage/licenses/" "/usr/portage/licenses/"
ls /usr/portage/licenses -1 | xargs -0 > /etc/entropy/packages/license.accept
equo i app-emulation/virtualbox-guest-additions
rm -rf /etc/entropy/packages/license.accept
systemctl enable virtualbox-guest-additions
EOF
