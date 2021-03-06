$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/liquid/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/warp2/warp2-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/warp2/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/kernel
# Kernel Modules
$(call inherit-product-if-exists, $(LOCAL_PATH)/prebuilts/lib/modules/modules.mk)
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/init.warp2.rc:root/init.warp2.rc \
	$(LOCAL_PATH)/root/init.2ndstg.rc:root/init.2ndstg.rc \
	$(LOCAL_PATH)/root/logo.bmp:root/logo.bmp \
	$(LOCAL_PATH)/root/init.qcom.rc:root/init.qcom.rc \
	$(LOCAL_PATH)/root/init.qcom.sh:root/init.qcom.sh \
	$(LOCAL_PATH)/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
	$(LOCAL_PATH)/root/init.qcom.usb.sh:root/init.qcom.usb.sh \
	$(LOCAL_PATH)/root/init.rc:root/init.rc \
	$(LOCAL_PATH)/root/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/root/sbin/usbconfig:root/sbin/usbconfig \
	$(LOCAL_PATH)/root/init:root/init

## Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery \
	$(LOCAL_PATH)/recovery/ueventd.rc:recovery/root/ueventd.rc \
	$(LOCAL_PATH)/recovery/usbconfig:recovery/root/sbin/usbconfig

$(call inherit-product, build/target/product/full.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES+= dalvik.vm.execution-mode=int:jit \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=5000 \
	dalvik.vm.dexopt-flags=m=y,u=n,v=a,o=v \
	debug.enabletr=true \
	persist.sys.use_dithering=0 \
	ro.com.google.locationfeatures=1 \
	mobiledata.interfaces = wlan0,rmnet0

# Provides overrides to configure the Dalvik heap for a standard tablet device.
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.heapgrowthlimit=48m \
	dalvik.vm.heapsize=256m

PRODUCT_LOCALES += hdpi

PRODUCT_AAPT_CONFIG := hdpi

#LLVM for RenderScript
LLVM_ROOT_PATH := external/llvm

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

PRODUCT_PACKAGES += \
	lights.msm7x30 \
	applypatch \
	ast-mm-vdec-omx-test \
	com.android.future.usb.accessory \
	gps.default \
	libdivxdrmdecrypt \
	libinvensense_hal \
	liblasic \
	liblinenoise \
	libmemalloc \
	libmllite \
	libmlplatform \
	libmmjpeg_interface \
	libmm-omxcore \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVenc \
	libOmxVidEnc \
	libOpenMAXAL \
	libOpenSLES \
	librs_jni \
	libmedia_jni \
	libstagefrighthw \
	LiveWallpapers \
	LiveWallpapersPicker \
	make_ext4fs \
	mm-vdec-omx-property-mgr \
	mm-vdec-omx-test \
	mm-venc-omx-test \
	mm-venc-omx-test720p \
	mm-video-driver-test \
	mm-video-encdrv-test \
	setup_fs \
	liboverlay

# Display
PRODUCT_PACKAGES += \
	copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
	libgenlock

## Bluetooth
PRODUCT_PACKAGES += \
	hciattach \
	hciconfig \
	hcitool \
	hdmid

# Keychar, Keylayout, & touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    $(LOCAL_PATH)/prebuilts/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/warp2_keypad.kl:system/usr/keylayout/warp2_keypad.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/msm_tma300_ts.kl:system/usr/keylayout/msm_tma300_ts.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/prebuilts/usr/keylayout/syna-touchscreen.kl:system/usr/keylayout/syna-touchscreen.kl \
	$(LOCAL_PATH)/prebuilts/usr/idc/syna-touchscreen.idc:system/usr/idc/syna-touchscreen.idc

# APN
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilts/etc/apns-conf.xml:system/etc/apns-conf.xml	

# SDCard
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
	libaudioutils

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
	$(LOCAL_PATH)/prebuilts/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
	$(LOCAL_PATH)/prebuilts/etc/audio_policy.conf:system/vendor/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES += \
    LegacyCamera \
    camera.warp2 \
	libcamera

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
	$(LOCAL_PATH)/prebuilts/bin/mm-qcamera-testsuite-client:system/bin/mm-qcamera-testsuite-client \
	$(LOCAL_PATH)/prebuilts/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
	$(LOCAL_PATH)/prebuilts/lib/libgemini.so:system/lib/libgemini.so \
	$(LOCAL_PATH)/prebuilts/lib/libmmipl.so:system/lib/libmmipl.so \
	$(LOCAL_PATH)/prebuilts/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
	$(LOCAL_PATH)/prebuilts/lib/libmmjpeg.so:obj/lib/libmmjpeg.so \
	$(LOCAL_PATH)/prebuilts/lib/liboemcamera.so:system/lib/liboemcamera.so \
	$(LOCAL_PATH)/prebuilts/lib/liboemcamera.so:obj/lib/liboemcamera.so \
	$(LOCAL_PATH)/prebuilts/lib/libcamera_client.so:obj/lib/libcamera_client.so \
	$(LOCAL_PATH)/prebuilts/lib/libcamera_client.so:system/lib/libcamera_client.so

## liblights
PRODUCT_PACKAGES += \
	lights.warp2 \
	sensors.default

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilts/etc/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    $(LOCAL_PATH)/prebuilts/bin/wpa_supplicant:system/bin/wpa_supplicant \
    $(LOCAL_PATH)/prebuilts/bin/wpa_cli:system/bin/wpa_cli \
	$(LOCAL_PATH)/prebuilts/lib/libwidevine.so:system/lib/libwidevine.so \
    $(LOCAL_PATH)/prebuilts/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/prebuilts/etc/firmware/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/prebuilts/etc/firmware/fw_bcmdhd_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilts/etc/firmware/fw_bcmdhd_p2p.bin:system/etc/firmware/fw_bcmdhd_p2p.bin

PRODUCT_PACKAGES += \
	libwpa_client

PRODUCT_PACKAGES += \
	Torch \
	WiFiDirectDemo

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/prebuilts/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh

## Media & Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/firmware/cyttsp_7630_fluid.hex:system/etc/firmware/cyttsp_7630_fluid.hex \
    $(LOCAL_PATH)/prebuilts/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    $(LOCAL_PATH)/prebuilts/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    $(LOCAL_PATH)/prebuilts/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    $(LOCAL_PATH)/prebuilts/lib/libC2D2.so:system/lib/libC2D2.so \
    $(LOCAL_PATH)/prebuilts/lib/libgsl.so:system/lib/libgsl.so \
    $(LOCAL_PATH)/prebuilts/lib/libOpenVG.so:system/lib/libOpenVG.so \
    $(LOCAL_PATH)/prebuilts/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    $(LOCAL_PATH)/prebuilts/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
	$(LOCAL_PATH)/prebuilts/etc/firmware/N970_N861_PR1183396_s2202_32313037.img:system/etc/firmware/N970_N861_PR1183396_s2202_32313037.img

# extra stuff
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/bin/ip6tables:system/bin/ip6tables \
	$(LOCAL_PATH)/prebuilts/bin/iptables:system/bin/iptables \
	$(LOCAL_PATH)/prebuilts/bin/bluetoothd:system/bin/bluetoothd \
	$(LOCAL_PATH)/prebuilts/bin/cnd:system/bin/cnd \
	$(LOCAL_PATH)/prebuilts/bin/akmd8962_new:system/bin/akmd8962_new \
	$(LOCAL_PATH)/prebuilts/bin/rmt_storage:system/bin/rmt_storage

PRODUCT_NAME := full_warp2
PRODUCT_DEVICE := warp2

#### Goo Manager support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=playfulgod \
	ro.goo.rom=CM10Sequent \
	ro.goo.version=$(shell date +%Y%m%d )

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/app/com.s0up.goomanager-1.apk:system/app/com.s0up.goomanager-1.apk




