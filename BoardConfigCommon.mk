# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017,2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8226
include device/samsung/msm8226-common/BoardConfigCommon.mk

COMMON_PATH := device/samsung/ms01-common

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

BUILD_FINGERPRINT := samsung/s3ve3gxx/s3ve3g:4.4.2/KOT49H/I9301IXXUANL1:user/release-keys

# Assert
TARGET_OTA_ASSERT_DEVICE := ms01,ms013g,ms01lte

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Build
BLOCK_BASED_OTA := true

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := sdfat

# HIDL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_ms01

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 zcache.enabled=1 zcache.compressor=lz4
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_RAMDISK_USE_XZ := true
TARGET_KERNEL_SOURCE := kernel/samsung/msm8226

# Legacy BLOB Support
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libperipheral_client.so|libshim_binder.so
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22 \
    /system/vendor/bin/hw/rild=27

# Power HAL
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(COMMON_PATH)/power/power_ext.c

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_SCREEN_DENSITY := 300

# Radio
BOARD_PROVIDES_LIBRIL := true

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../$(COMMON_PATH)/recovery/recovery_keys.c
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_DENSITY := hdpi

# SELinux
include $(COMMON_PATH)/sepolicy/sepolicy.mk

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# inherit from the proprietary version
include vendor/samsung/ms01-common/BoardConfigVendor.mk
