#!/bin/sh

chvt 2

nfsmount="/nfs"

set -- $(cat /proc/cmdline)
for x in "$@"; do
	case "$x" in
	FLDT_NFS=*)
	fldt_nfs="${x#FLDT_NFS=}"
	;;
	esac
done

if [ -z "$fldt_nfs" ]; then
	echo "No FLDT_NFS found."
	exit
fi

echo "Mounting $fldt_nfs"

if [ ! -d "/nfs" ]; then
	mkdir /nfs
fi

mount -t nfs -o nfsvers=3,nolock $fldt_nfs:/images $nfsmount

$nfsmount/fldt.sh

