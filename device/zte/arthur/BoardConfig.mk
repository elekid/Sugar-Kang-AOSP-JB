# Copyright (C) 2012 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

TARGET_SPECIFIC_HEADER_PATH := device/zte/arthur/include

# camera
USE_CAMERA_STUB := false
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB

#Board Settings
TARGET_BOARD_PLATFORM := msm7x30
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := arthur
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -march=armv7-a
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -march=armv7-a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno220
TARGET_BOARD_PLATFORM_FPU := neon
BOARD_USES_ADRENO_200 := true
TARGET_PROVIDES_INIT_RC := true
TARGET_PROVIDES_RECOVERY_INIT_RC := true
TARGET_RECOVERY_INITRC := device/zte/arthur/recovery/root/init.rc
ARCH_ARM_HAVE_ARMV7A := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_INITLOGO := true

# Inline Kernel Build
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_CONFIG := cm10_defconfig
TARGET_PREBUILT_KERNEL := device/zte/arthur/kernel

# QCOM hardware
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true

# Stagefright
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_DECODERS

TARGET_DISABLE_ARM_PIE := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

#RIL
BOARD_USES_LEGACY_RIL := true
BOARD_PROVIDES_LIBRIL := true


#Graphics
BOARD_EGL_CFG := device/zte/arthur/prebuilt/files/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := false
TARGET_USE_SCORP_BIONIC_OPTIMIZATION := true
#TARGET_USE_SCORPION_PLD_SET := true
# Set to 9 for 8650A
#TARGET_SCORPION_BIONIC_PLDOFFS := 6
#TARGET_SCORPION_BIONIC_PLDSIZE := 128
BOARD_USE_QCOM_PMEM := true
TARGET_HARDWARE_3D := true
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_ION := false
TARGET_USES_HWCOMPOSER := true
BOARD_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD -DQCOM_ICS_COMPAT -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DLEGACY_QCOM_VOICE -DPOLL_CALL_STATE -DUSE_QMI
TARGET_NO_HW_VSYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_QCOM_HDMI_OUT := false
ENABLE_WTF_USE_ACCELERATED_COMPOSITING := true

#Browser
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
DYNAMIC_SHARED_LIBV8SO := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
WEBCORE_INPAGE_VIDEO := true
TARGET_HAVE_TSLIB := false

# Audio
TARGET_PROVIDES_LIBAUDIO := false

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WLAN_DEVICE := libra
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/libra.ko"
WIFI_DRIVER_MODULE_NAME := "libra"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME := "librasdioif"
WIFI_PRE_LOADER := "qcom_sdio_init"
WIFI_POST_UNLOADER := "qcom_sdio_deinit"
BOARD_WEXT_NO_COMBO_SCAN := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true


# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

#Kernel Command Line
BOARD_KERNEL_CMDLINE := console=ttyMSM1,115200
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2908749824
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAS_NO_MISC_PARTITION := true

TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/arthur/recovery/recovery_kernel

BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true


# SD Card
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_USES_MMCUTILS := true

# Insecure boot
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1

BOARD_VOLD_MAX_PARTITIONS :=30

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../device/zte/arthur/UsbController.cpp
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

TARGET_RECOVERY_GUI := true
DEVICE_RESOLUTION := 480x800
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
BOARD_HAS_FLIPPED_SCREEN := true

# Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

TARGET_OTA_ASSERT_DEVICE := arthur,warp

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/zte/arthur/releasetools/arthur_ota_from_target_files

# Create Odex Files
WITH_DEXPREOPT := true
