export GO_EASY_ON_ME=1
ARCHS= arm64 armv7 armv7s
export TARGET = iphone:clang:latest
include theos/makefiles/common.mk

TWEAK_NAME = SiriRunner
SiriRunner_FILES = Tweak.xm
SiriRunner_FRAMEWORKS = UIKit Foundation
SiriRunner_PRIVATE_FRAMEWORKS = AppSupport

SiriRunner_LIBRARIES=rocketbootstrap

TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
