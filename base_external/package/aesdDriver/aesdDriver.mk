
##############################################################
#
# AESDDRIVER INTERFACING
#
##############################################################

AESDDRIVER_VERSION = '3df7b87914194bbb966b999adc1904a8e1f7f016'

AESDDRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Anup9401.git'
AESDDRIVER_SITE_METHOD = git
AESDDRIVER_GIT_SUBMODULES = YES

AESDDRIVER_MODULE_SUBDIRS = aesd-char-driver
AESDDRIVER_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))

define AESD_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
endef

AESDDRIVER_POST_BUILD_HOOKS += AESD_DRIVER_BUILD_CMDS
AESDDRIVER_POST_BUILD_HOOKS += AESD_DRIVER_INSTALL_TARGET_CMDS

$(eval $(generic-package))
