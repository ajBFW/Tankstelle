#!/bin/sh

for CZBRANCH in stable alternative; do
	# Try to use whatever version was given on the command line on both stable and alternative branches
	echo "Processing branch ${CZBRANCH}..."
	CZVER=$1
	if [ -z ${CZVER} ]; then
		# Match the <input> field on the download selector form
		CZVER=$(curl -qs http://clonezilla.org/downloads/download.php?branch=${CZBRANCH} | sed -n -r -e 's/.*<input.*name=.version.*value=.(.*).>/\1/p')
		echo "Fetched Clonezilla ${CZBRANCH} version ${CZVER}"
	else
		echo "Using Clonezilla ${CZBRANCH} version: ${CZVER}"
	fi

	# NB The branches don't have the same architectures: Debain has amd64/i686/i586, Ubuntu has amd64/i386
	# We throw them all together here for simplicity - some downloads will fail, as expected.
	for CZARCH in amd64 i686-pae i586 i386; do
		wget --continue http://sourceforge.net/projects/clonezilla/files/clonezilla_live_${CZBRANCH}/${CZVER}/clonezilla-live-${CZVER}-${CZARCH}.zip
		mkdir -p ${CZBRANCH}_${CZARCH}
		unzip -j -d ${CZBRANCH}_${CZARCH} clonezilla-live-${CZVER}-${CZARCH}.zip Clonezilla-Live-Version live/filesystem.squashfs live/initrd.img live/vmlinuz syslinux/syslinux.cfg
	done
done
