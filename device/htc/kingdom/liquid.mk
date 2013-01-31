#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 The LiquidSmooth Project
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

# name
PRODUCT_RELEASE_NAME := KingKang-CDMA

# device
$(call inherit-product-if-exists, device/htc/kingdom/full_kingdom.mk)

# cdma
$(call inherit-product, vendor/liquid/config/common_cdma.mk)

# phone
$(call inherit-product, vendor/liquid/config/common_phone.mk)

# products
PRODUCT_DEVICE := kingdom
PRODUCT_BRAND := htc
PRODUCT_NAME := liquid_kingdom
PRODUCT_MODEL := Evo Design 4g
PRODUCT_MANUFACTURER := Htc
PRODUCT_PROPERTY_OVERRIDES += ro.buildzipid=liquid.toro.$(shell date +%m%d%y).$(shell date +%H%M%S)

