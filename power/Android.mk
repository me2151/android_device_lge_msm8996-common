LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_SRC_FILES := power.c metadata-parser.c utils.c list.c hint-data.c

# Include target-specific files.
ifeq ($(call msm8996), true)
	LOCAL_SRC_FILES += power-8996.c
endif endif

# something
ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif


#    LOCAL_CFLAGS += -DEXTRA_POWERHAL_HINTS


LOCAL_MODULE := power.msm8996
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)