################################################################################
#
# NP2KAI
#
################################################################################
LIBRETRO_NP2KAI_VERSION = a54a4052150cb24f7f7b405b56f936ac4023327a
LIBRETRO_NP2KAI_SITE = $(call github,AZO234,NP2kai,$(LIBRETRO_NP2KAI_VERSION))
LIBRETRO_NP2KAI_LICENSE = MIT

ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI3),y)
	LIBRETRO_NP2KAI_PLATFORM=rpi3-embedded
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI2),y)
	LIBRETRO_NP2KAI_PLATFORM=rpi2-embedded
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_XU4),y)
	LIBRETRO_NP2KAI_PLATFORM=xu4-embedded
else	
	LIBRETRO_NP2KAI_PLATFORM=unix
endif

define LIBRETRO_NP2KAI_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/sdl2 -f Makefile.libretro platform="$(LIBRETRO_NP2KAI_PLATFORM)"
endef

define LIBRETRO_NP2KAI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/sdl2/np2kai_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/np2kai_libretro.so
endef

define LIBRETRO_NP2KAI_LINE_ENDINGS_FIXUP
    # DOS2UNIX Makefile.libretro - patch system does not support different line endings
    /bin/sed -i -E -e "s|\r$$||g" $(@D)/sdl2/Makefile.libretro
endef

LIBRETRO_NP2KAI_PRE_PATCH_HOOKS += LIBRETRO_NP2KAI_LINE_ENDINGS_FIXUP

$(eval $(generic-package))