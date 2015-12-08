################################################################################
#
## partclone
#
#################################################################################

PARTCLONE_VERSION = 0.2.86
PARTCLONE_SOURCE = $(PARTCLONE_VERSION).tar.gz
PARTCLONE_SITE = https://github.com/Thomas-Tsai/partclone/archive
	PARTCLONE_INSTALL_STAGING = YES
	PARTCLONE_AUTORECONF = YES
	PARTCLONE_DEPENDENCIES = attr libgcrypt lzo xz zlib xfsprogs ncurses host-pkgconf
	PARTCLONE_CONF_OPTS = --enable-extfs --enable-fat --enable-static 

define PARTCLONE_LINK_LIBRARIES_TOOL
	ln -f -s $(@D)/../xfsprogs-*/include/xfs $(@D)/../../staging/usr/include/
	ln -f -s $(@D)/../xfsprogs-*/libxfs/.libs/libxfs.* $(@D)/../../staging/usr/lib/
endef

define PARTCLONE_FIX_PXE
	sed -i 's/fail-mbr//' $(@D)/Makefile.in
endef

PARTCLONE_PRE_BUILD_HOOKS += PARTCLONE_FIX_PXE

PARTCLONE_POST_PATCH_HOOKS += PARTCLONE_LINK_LIBRARIES_TOOL

$(eval $(autotools-package))
