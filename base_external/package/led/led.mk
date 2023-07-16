
##############################################################
#
# LED INTERFACING
#
##############################################################

LED_VERSION = '2719d3131682dcf8b709af65500a804c82c17723'

LED_SITE = 'git@github.com:Anup9401/bbb_apps.git'
LED_SITE_METHOD = git
LED_GIT_SUBMODULES = YES

define LED_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/led all
endef

define LED_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/common/gpioExport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/common/gpioUnexport.sh $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/led/led_app $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
