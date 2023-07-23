
##############################################################
#
# LEDSWITCH INTERFACING
#
##############################################################

LEDSWITCH_VERSION = 'e6b959ef9ef2e234a69e5373752766ad7f07d7e3'

LEDSWITCH_SITE = 'git@github.com:Anup9401/bbb_apps.git'
LEDSWITCH_SITE_METHOD = git
LEDSWITCH_GIT_SUBMODULES = YES

define LEDSWITCH_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/ledSwitch all
endef

define LEDSWITCH_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/common/gpioExport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/common/gpioUnexport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/ledSwitch/ledSwitch_app $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
