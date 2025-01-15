#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from A3_Pro device
$(call inherit-product, device/umidigi/A3_Pro/device.mk)

PRODUCT_DEVICE := A3_Pro
PRODUCT_NAME := omni_A3_Pro
PRODUCT_BRAND := UMIDIGI
PRODUCT_MODEL := A3_Pro
PRODUCT_MANUFACTURER := umidigi


