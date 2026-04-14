
# Copyright (C) 2018 The LineageOS Project
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
#

BOARD_VENDOR := sony

BUILD_BROKEN_DUP_RULES := true

COMMON_PATH := device/sony/sm8250-common

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    odm \
    vendor

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_CAMERA_SERVICE_EXT_LIB := //$(COMMON_PATH):libcameraservice_extension.sony

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_CMDLINE := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    buildid=EDO-1.0.1-201109-1152 \
    cgroup.memory=nokmem,nosocket \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    reboot=panic_warm \
    service_locator.enable=1 \
    swiotlb=2048 \
    zram.backend=z3fold
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_NO_GCC := true
TARGET_KERNEL_CONFIG := \
    vendor/debugfs.config \
    vendor/kona-perf_defconfig \
    vendor/edo.config

# Use External DTC
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc \
    DTC_OVERLAY_TEST_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/libufdt/ufdt_apply_overlay \
    LLVM=1 LLVM_IAS=1

# Qcom
BOARD_USES_QCOM_HARDWARE := true

# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true

AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_RAS := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_SSR := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
TARGET_PROVIDES_AUDIO_EXTNS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_USB_BURST_MODE := true

BOARD_SUPPORTS_OPENSOURCE_STHAL := true

# Display
TARGET_NO_RAW10_CUSTOM_FORMAT := true
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/configs/config.fs

# FM
BOARD_HAVE_QCOM_FM := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/sony/vintf/device_framework_matrix.xml
DEVICE_MATRIX_FILE += hardware/qcom-caf/common/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/vintf/manifest.xml

ODM_MANIFEST_SKUS := ss ds
ODM_MANIFEST_SS_FILES := $(COMMON_PATH)/configs/vintf/manifest_ss.xml
ODM_MANIFEST_DS_FILES := $(COMMON_PATH)/configs/vintf/manifest_ds.xml

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_PRODUCTIMAGE_MINIMAL_PARTITION_RESERVED_SIZE := false
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x06000000

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor odm

# Dynamic partition size = (Super partition size / 2) - 4MB
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 5901385728 # (Super partition size / 2) - 4MB
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 11811160064
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/configs/properties/odm.prop
TARGET_PRODUCT_PROP += $(COMMON_PATH)/configs/properties/product.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/configs/properties/system.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/configs/properties/system_ext.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/configs/properties/vendor.prop

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2022-10-01

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include hardware/sony/sepolicy/libperfmgr/SEPolicy.mk
include hardware/sony/sepolicy/qti/SEPolicy.mk

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := vendor/ahnet-priv/keys/avb/custom_rsa4096_private.pem
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := vendor/ahnet-priv/keys/avb/custom_rsa2048_private.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := $(BOARD_HOSTAPD_DRIVER)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := $(BOARD_HOSTAPD_PRIVATE_LIB)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_FEATURE_HOSTAPD_11AX := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

include vendor/sony/sm8250-common/BoardConfigVendor.mk
-include vendor/sony/extra/BoardConfigExtra.mk
