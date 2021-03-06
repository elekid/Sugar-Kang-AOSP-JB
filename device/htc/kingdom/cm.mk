## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := kingdom

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/kingdom/device_kingdom.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kingdom
PRODUCT_NAME := cm_kingdom
PRODUCT_BRAND := htc
PRODUCT_MODEL := kingdom
PRODUCT_MANUFACTURER := htc
