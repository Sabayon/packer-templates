#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
equo rm sys-kernel/sabayon-sources sabayon-live sabayon-artwork-isolinux

equo rm app-admin/calamares app-misc/calamares-sabayon-server-base-modules app-misc/calamares-sabayon @X

for c in "media-sound" "gnome-base" "x11-apps" "x11-libs" "x11-themes" "dev-qt" "kde-frameworks" "media-libs";
do

    TO_REMOVE=$(equo q list installed -q | grep $c | grep -v virtualbox)
    for i in ${TO_REMOVE[@]};do echo "Removing $i"; equo rm $i; done

done

equo cleanup
EOF
