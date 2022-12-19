#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/davinci

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor_boot \
    vendor_dlkm \
    vendor

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55

# Boot
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ASUS_AI2202

# ConfigFS
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# DTB
BOARD_USES_DT := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_DIR)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_DIR)/dtbo.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Display
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_DRM_PP := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_HWC2 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_COLOR_METADATA := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_HAS_HDR_DISPLAY := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USE_COLOR_MANAGEMENT := true
SF_WCG_COMPOSITION_DATA_SPACE := 143261696
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true
TARGET_USES_GRALLOC4 := true
TARGET_SCREEN_DENSITY := 440

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/asus_framework_matrix.xml \
    $(DEVICE_PATH)/lineage_framework_matrix.xml \
    $(DEVICE_PATH)/qcom_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/asus_manifest.xml \
    $(DEVICE_PATH)/manifest.xml

DEVICE_MATRIX_FILE := \
    $(DEVICE_PATH)/compatibility_matrix.xml

# Hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel
TARGET_NO_KERNEL := false

BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.selinux=permissive \
    androidboot.usbcontroller=a600000.dwc3

BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOARD_KERNEL_PAGESIZE := 4096
BOARD_USES_GENERIC_KERNEL_IMAGE := true
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Kernel module handling
BOARD_BUILD_VENDOR_RAMDISK_IMAGE := true

KERNEL_MODULE_DIR := $(TARGET_KERNEL_DIR)
KERNEL_MODULES := $(wildcard $(KERNEL_MODULE_DIR)/*.ko)

BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_MODULE_DIR)/vendor_dlkm.modules.blocklist

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_MODULE_DIR)/vendor_boot.modules.load))
ifndef BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD
$(error vendor_boot.modules.load not found or empty)
endif
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)))

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_MODULE_DIR)/vendor_dlkm.modules.load))
ifndef BOARD_VENDOR_KERNEL_MODULES_LOAD
$(error vendor_dlkm.modules.load not found or empty)
endif

BOARD_VENDOR_RAMDISK_KERNEL_MODULES += $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_KERNEL_MODULES_LOAD)))
BOARD_VENDOR_KERNEL_MODULES := $(KERNEL_MODULES)

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor_dlkm vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x6000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x6400000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x6000000

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_VENDOR := vendor

# Radio
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 113
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong
SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# WLAN
BOARD_HAS_QCOM_WLAN := true
PRODUCT_VENDOR_MOVE_ENABLED := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_DRIVER_STATE_ON := "ON"
WIFI_DRIVER_STATE_OFF := "OFF"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
BOARD_HOSTAPD_PRIVATE_LIB_EVENT := "ON"
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
