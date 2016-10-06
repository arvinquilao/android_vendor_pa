# Copyright (C) 2015 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_seed,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 720

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/google/seed/seed.mk)

include vendor/pa/main.mk

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

# Override AOSP build properties
PRODUCT_NAME := pa_seed
PRODUCT_DEVICE := seed
PRODUCT_BRAND := google
PRODUCT_MODEL := seed
PRODUCT_MANUFACTURER := google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=seed \
    BUILD_FINGERPRINT=google/seed_l8150/seed:7.0/NRD91J/3306052:user/release-keys \
    PRIVATE_BUILD_DESC="seed_l8150-user 7.0 NRD91J 3306052 release-keys"
  
endif
