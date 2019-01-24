#!/bin/bash

echo "Configuring virtualbox!"

chroot /mnt/sabayon /bin/bash <<'EOF'
ACCEPT_LICENSE=* equo i app-emulation/virtualbox-guest-additions#$(uname -r) app-emulation/virtualbox-modules#$(uname -r)
systemctl enable virtualbox-guest-additions
EOF
