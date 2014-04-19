export GO_EASY_ON_ME=1
export TARGET = iphone:clang:latest
include theos/makefiles/common.mk

TWEAK_NAME = SiriRunner
SiriRunner_FILES = Tweak.xm
SiriRunner_FRAMEWORKS = UIKit
SiriRunner_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
