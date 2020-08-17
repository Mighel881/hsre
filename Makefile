ARCHS = arm64
TARGET = iphone:clang:latest:latest
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HSRe
HSRe_FILES = Tweak.x $(wildcard *.m */*.m */*/*.m */*/*/*.m)
HSRe_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
