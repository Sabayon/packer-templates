#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
ln -snf /usr/share/zoneinfo/UTC /etc/localtime
echo UTC > /etc/timezone
EOF
