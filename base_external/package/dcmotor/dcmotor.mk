
##############################################################
#
# DCMOTOR INTERFACING
#
##############################################################

DCMOTOR_VERSION = '8bd59e097904b00d03ae061a06b27f39ca4095de'

DCMOTOR_SITE = 'git@github.com:Anup9401/bbb_apps.git'
DCMOTOR_SITE_METHOD = git
DCMOTOR_GIT_SUBMODULES = YES

define DCMOTOR_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/dcmotor all
endef

define DCMOTOR_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/common/gpioExport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/common/gpioUnexport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/dcmotor/dcmotor_app $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
