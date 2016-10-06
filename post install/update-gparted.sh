#!/bin/sh

GPVER=$1
if [ -z ${GPVER} ]; then
	# Match the download link to the LiveCD download on the project homepage.
	GPVER=$(curl -qs http://gparted.sourceforge.net/ | sed -n -r -e 's/.*iso">Live (.*)<\/a>/\1/p')
	echo "Fetched GParted version: ${GPVER}"
else
	echo "Using GParted version: ${GPVER}"
fi

for GPARCH in amd64 i686-pae i586; do
	wget --continue http://sourceforge.net/projects/gparted/files/gparted-live-stable/${GPVER}/gparted-live-${GPVER}-${GPARCH}.zip
	mkdir -p ${GPARCH}
	unzip -j -d ${GPARCH} gparted-live-${GPVER}-${GPARCH}.zip GParted-Live-Version live/filesystem.squashfs live/initrd.img live/vmlinuz syslinux/syslinux.cfg
done