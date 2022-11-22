#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from our proprietary files directory.
$(call inherit-product, vendor/asus/davinci/davinci-vendor.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# ATrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)
# Pick up split makefile
$(call inherit-product, hardware/qcom-caf/sm8450/audio/configs/taro/taro.mk)
PRODUCT_PACKAGES += \
    android.hardware.audio.service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape_qssi/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths.xml \
    $(LOCAL_PATH)/audio/resourcemanager_davinci.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_davinci.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager_davinci.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/usecaseKvManager_davinci.xml \

# Board
TARGET_BOARD_PLATFORM := taro

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7.vendor \
    camera.device@1.0-impl \
    libcamera2ndk_vendor \
    vendor.qti.hardware.camera.aon@1.0.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.graphics.mapper-impl-qti-display.xml \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.allocator-service.rc \
    vendor.qti.hardware.display.allocator-service.xml \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.composer-service.rc \
    vendor.qti.hardware.display.composer-service.xml \
    libsdmcore \
    libsdmutils \
    libqdutils \
    libqdMetaData \
    libqdMetaData.system \
    libdisplayconfig \
    libgralloc.qti \
    libdisplayconfig.qti \
    libdisplayconfig.vendor \
    libdisplayconfig.qti.vendor \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.config.vendor \
    init.qti.display_boot.sh \
    init.qti.display_boot.rc \
    vendor.qti.hardware.display.config-V2-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V5-ndk_platform.vendor \
    vendor.qti.hardware.memtrack-service \
    libfilefinder \
    vendor.qti.hardware.display.demura-service.rc \
    vendor.qti.hardware.display.demura-service.xml \
    vendor.qti.hardware.display.demura-service

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/goodixfp.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodixfp.kl \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# Hardware
PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_BOARD_PLATFORM := taro

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-V3-ndk_platform.vendor

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.asus.rc \
    init.target.rc \
    ssgqmigd.rc \
    ueventd.asus.rc

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    IPACM_Filter_cfg.xml

# Media
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libplatformconfig \
    libcodec2_vndk.vendor \
    libcodec2_hidl@1.0.vendor

PRODUCT_PROPERTY_OVERRIDES += debug.stagefright.ccodec=4

# Kernel Binary
TARGET_KERNEL_DIR ?= device/asus/davinci-kernel
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# Keymaster
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor \
    libkeymaster_messages.vendor

# Lights
PRODUCT_PACKAGES += \
    vendor.qti.hardware.lights.service

# NDK
NEED_AIDL_NDK_PLATFORM_BACKEND := true

# NFC
TARGET_USES_NQ_NFC := false

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks-V1-ndk_platform.vendor

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResTarget_Vendor \
    WifiResTarget_cape \
    WifiResTarget_spf \
    Zenfone9Frameworks \
    Zenfone9SettingsProvider \
    Zenfone9SystemUI

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Power
$(call inherit-product, vendor/qcom/opensource/power/power-vendor-product.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# SELinux
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal \
    libsensorndkbridge

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# Shipping API
BOARD_API_LEVEL := 31
BOARD_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti-v2

# TrustedUI
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.davinci

# Update Engine
PRODUCT_PACKAGES += \
    update_engine_sideload

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator.service.davinci

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6490/WCNSS_qcom_cfg.ini
