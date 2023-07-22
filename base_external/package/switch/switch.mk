
##############################################################
#
# SWITCH INTERFACING
#
##############################################################

SWITCH_VERSION = '198f555da592e9d8fece9fcbfe245dc7d6658e2e'

SWITCH_SITE = 'git@github.com:Anup9401/bbb_apps.git'
SWITCH_SITE_METHOD = git
SWITCH_GIT_SUBMODULES = YES

define SWITCH_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/switch all
endef

define SWITCH_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/common/gpioExport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/common/gpioUnexport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/switch/switch_app $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
