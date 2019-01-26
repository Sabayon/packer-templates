#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
wget https://raw.githubusercontent.com/Sabayon/docker-builder-amd64/master/script/post-upgrade.sh
bash post-upgrade.sh
rm post-upgrade.sh
EOF
