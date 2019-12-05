################################################################################
#
# recalbox-romfs-model3
#
################################################################################

# Package generated with :
# ./scripts/linux/empack.py --system model3 --extension '.zip .ZIP' --fullname 'Sega Model3' --platform model3 --theme model3 BR2_PACKAGE_SUPERMODEL

# Name the 3 vars as the package requires
RECALBOX_ROMFS_MODEL3_SOURCE = 
RECALBOX_ROMFS_MODEL3_SITE = 
RECALBOX_ROMFS_MODEL3_INSTALL_STAGING = NO
# Set the system name
SYSTEM_NAME_MODEL3 = model3
SYSTEM_XML_MODEL3 = $(@D)/$(SYSTEM_NAME_MODEL3).xml
# System rom path
SOURCE_ROMDIR_MODEL3 = $(RECALBOX_ROMFS_MODEL3_PKGDIR)/roms

# CONFIGGEN_STD_CMD is defined in recalbox-romfs, so take good care that
# variables are global across buildroot


ifeq ($(BR2_PACKAGE_SUPERMODEL),y)
define CONFIGURE_MODEL3
	$(call RECALBOX_ROMFS_CALL_ADD_STANDALONE_SYSTEM,$(SYSTEM_XML_MODEL3),Sega Model3,$(SYSTEM_NAME_MODEL3),.zip .ZIP,model3,model3,$(SOURCE_ROMDIR_MODEL3),$(@D))
endef
RECALBOX_ROMFS_MODEL3_CONFIGURE_CMDS += $(CONFIGURE_MODEL3)
endif

$(eval $(generic-package))
