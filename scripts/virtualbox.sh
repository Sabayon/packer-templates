#!/bin/bash

echo "Configuring virtualbox!"

chroot /mnt/sabayon /bin/bash <<'EOF'
echo 3 | equo i app-emulation/virtualbox-guest-additions
EOF
