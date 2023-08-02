
##############################################################
#
# MOTORSWITCH INTERFACING
#
##############################################################

MOTORSWITCH_VERSION = '9e0111b0f0423649321ffc7deb7a299df4c8962f'

MOTORSWITCH_SITE = 'git@github.com:Anup9401/bbb_apps.git'
MOTORSWITCH_SITE_METHOD = git
MOTORSWITCH_GIT_SUBMODULES = YES

define MOTORSWITCH_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/motorSwitch all
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define MOTORSWITCH_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/common/gpioExport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/common/gpioUnexport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/motorSwitch/motorSwitch_app $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/server/server_app $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
