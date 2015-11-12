#!/bin/bash

set -x
set -e

VBOX_IMAGES_TYPE=(
        "SpinBase"
        "SpinBase-dev"
)

for i in "${VBOX_IMAGES_TYPE[@]}"
do
        rm -rfv packer_cache
        packer build -var "flavor=${i}" -var "vagrant=" -only virtualbox-iso "images.json" && \
        md5sum "Sabayon_Linux_DAILY_amd64_${i}-ovf.tar.gz" > "Sabayon_Linux_DAILY_amd64_${i}-ovf.tar.gz.md5" && \
        md5sum "Sabayon_Linux_DAILY_amd64_${i}.box" > "Sabayon_Linux_DAILY_amd64_${i}.box.md5" && \
        mv "Sabayon_Linux_DAILY_amd64_${i}-ovf.tar.gz"  "Sabayon_Linux_DAILY_amd64_${i}-ovf.tar.gz.md5" "${CIRCLE_ARTIFACTS}" && \
        mv "Sabayon_Linux_DAILY_amd64_${i}.box"  "Sabayon_Linux_DAILY_amd64_${i}.box.md5" "${CIRCLE_ARTIFACTS}"  && \
        packer build -var "flavor=${i}" -var "vagrant=" -only qemu "images.json" && \
        md5sum "Sabayon_Linux_DAILY_amd64_${i}-qemu.tar.gz" > "Sabayon_Linux_DAILY_amd64_${i}-qemu.tar.gz.md5" && \
        mv "Sabayon_Linux_DAILY_amd64_${i}-qemu.tar.gz"  "Sabayon_Linux_DAILY_amd64_${i}-qemu.tar.gz.md5" "${CIRCLE_ARTIFACTS}"
done
