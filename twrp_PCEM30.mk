PRODUCT_RELEASE_NAME := PCEM30

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)
$(call inherit-product, device/oppo/PCEM30/device.mk)

PRODUCT_DEVICE := PCEM30
PRODUCT_NAME := twrp_PCEM30
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := OPPO A53 5G
PRODUCT_MANUFACTURER := OPPO
