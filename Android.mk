LOCAL_PATH := $(call my-dir)

ifneq ($(filter PCEM30,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
