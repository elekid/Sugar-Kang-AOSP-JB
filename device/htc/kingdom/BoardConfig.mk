# Copyright (C) 2009 The Android Open Source Project
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

# Htc Evo Design 4g / Kindom Tree.. by Dm47021
# PS ... FUCK EVERVOLV.. ss2man44 likes to use people

USE_CAMERA_STUB := true

# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/kingdom/BoardConfigVendor.mk

# Board Settings
TARGET_BOOTLOADER_BOARD_NAME := kingdom
BOARD_MKBOOTIMG_ARGS := 0x6200000
BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x05000000
BOARD_KERNEL_PAGE_SIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 827731968
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1233100800
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_FLASH_BLOCK_SIZE := 262144

# Screen Shit
DEVICE_RESOLUTION := 540x960


# Arch Varient FOR 4.1.2 AND 4.2.1 
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm7x30
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VERSION := armv7
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -march=armv7-a
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -march=armv7-a
#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
#TARGET_USE_SCORPION_PLD_SET := true
#TARGET_SCORPION_BIONIC_PLDOFFS := 6
#TARGET_SCORPION_BIONIC_PLDSIZE := 128

# Some Common CFLAGS
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DSCREEN_RELEASE -DREFRESH_RATE=60 -DICS_CAMERA_BLOB -DRIL_VERSION_2_SUPPORT -DQCOM_NO_SECURE_PLAYBACK

# Qualcomm Shit
BOARD_USES_QCOM_HARDWARE := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := kingdom
BOARD_VENDOR_QCOM_AMSS_VERSION := 1200
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Adreno / EGL
BOARD_EGL_CFG := device/htc/kingdom/prebuilt/lib/egl/egl.cfg

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Ril
BOARD_USES_LEGACY_RIL := true

# Htc Shit
BOARD_HAVE_HTC_FFC := true
BOARD_USE_REVERSE_FFC := true

# Audio Shit
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := false
BOARD_USES_QCOM_AUDIO_RESETALL := false
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

# Wifi Related defines
WIFI_BAND                        := 802_11_ABGN

#Partition Sizes
# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 0087f400 00000200 "recovery"
#mmcblk0p22: 00400000 00000200 "boot"
#mmcblk0p26: 321ffa00 00000200 "system"
#mmcblk0p29: 00140200 00000200 "local"
#mmcblk0p28: 08fc3400 00000200 "cache"
#mmcblk0p27: 4aabc400 00000200 "userdata"
#mmcblk0p31: 01400200 00000200 "devlog"
#mmcblk0p32: 00040000 00000200 "pdata"
#mmcblk0p25: 00c00200 00000200 "wimax"
#mmcblk0p30: 007ffa00 00000200 "udata_wimax"

TARGET_RELETARGET_ARCH_VERSION :=ASETOOLS_EXTENSIONS := device/htc/common

# Kernel Defines
TARGET_KERNEL_SOURCE := kernel/htc/kingdoM/kernel
TARGET_KERNEL_CONFIG := defconfig
KERNEL_TOOLCHAIN_PREFIX:=$(ANDROID_BUILD_TOP)/toolchain/arm-eabi-4.4.3/bin/arm-eabi-BUILD_KERNEL := true

TARGET_PREBUILT_KERNEL := device/htc/kingdom/prebuilt/root/kernel

# Recovery Defines
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := false
BOARD_HAS_NO_MISC_PARTITION := false

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_otg/msm_hsusb/gadget/lun0/file

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

#Testing Defines
TARGET_USES_PMEM := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_SF_BYPASS := true
TARGET_HAVE_BYPASS := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
