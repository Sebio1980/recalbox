################################################################################
#
# BEETLE_VB
#
################################################################################

LIBRETRO_BEETLE_VB_VERSION = 9a4e604a7320a3c6ed30601989fe0bc417fa9ad3
LIBRETRO_BEETLE_VB_SITE = $(call github,libretro,beetle-vb-libretro,$(LIBRETRO_BEETLE_VB_VERSION))

define LIBRETRO_BEETLE_VB_BUILD_CMDS
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(RETROARCH_LIBRETRO_PLATFORM)"
endef

define LIBRETRO_BEETLE_VB_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mednafen_vb_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mednafen_vb_libretro.so
endef

$(eval $(generic-package))
