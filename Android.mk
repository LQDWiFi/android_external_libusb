LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
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

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/libusb \
	$(LOCAL_PATH)/libusb/os \
	$(LOCAL_PATH)/android

LOCAL_MODULE := libusb
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -O3 -Wall -Wno-error=sign-compare -Wno-error=switch -Werror

LOCAL_SHARED_LIBRARIES := liblog
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
include $(BUILD_SHARED_LIBRARY)

