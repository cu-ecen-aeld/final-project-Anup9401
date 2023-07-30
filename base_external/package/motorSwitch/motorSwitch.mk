
##############################################################
#
# MOTORSWITCH INTERFACING
#
##############################################################

MOTORSWITCH_VERSION = '2ea9cc21bb390a191c6a13b33c2d7be6fac73116'

MOTORSWITCH_SITE = 'git@github.com:Anup9401/bbb_apps.git'
MOTORSWITCH_SITE_METHOD = git
MOTORSWITCH_GIT_SUBMODULES = YES

define MOTORSWITCH_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/motorSwitch all
endef

define MOTORSWITCH_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/common/gpioExport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/common/gpioUnexport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/motorSwitch/motorSwitch_app $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
