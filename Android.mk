LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

libusb_files := \
	libusb/core.c \
	libusb/descriptor.c \
	libusb/hotplug.c \
	libusb/io.c \
	libusb/sync.c \
	libusb/strerror.c \
	libusb/os/threads_posix.c \
	libusb/os/poll_posix.c \
	libusb/os/linux_usbfs.c \
	libusb/os/linux_netlink.c

libusb_include_files := \
	$(LOCAL_PATH)/libusb/ \
	$(LOCAL_PATH)/libusb/os \
	$(LOCAL_PATH)/android/

LOCAL_MODULE := libusb
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -O3 -Wall -Wno-error=sign-compare -Wno-error=switch -Werror

LOCAL_SRC_FILES := $(libusb_files)
LOCAL_C_INCLUDES = $(libusb_include_files)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_EXPORT_C_INCLUDE_DIRS := include

ifneq ($(TARGET_BUILD_APPS),)
ifeq ($(TARGET_ARCH),arm)
  LOCAL_SDK_VERSION := 9
endif
endif
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_SHARED_LIBRARY)

