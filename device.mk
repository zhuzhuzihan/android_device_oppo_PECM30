LOCAL_PATH := device/oppo/PECM30

PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
TARGET_OTA_ASSERT_DEVICE := PECM30,oppo6853

TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2400

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb:dtb.img \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6853.rc:recovery/root/init.recovery.mt6853.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.mt6853.rc:recovery/root/ueventd.mt6853.rc \
    $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/system/etc/twrp.flags:recovery/root/system/etc/twrp.flags \
    $(LOCAL_PATH)/recovery/root/system/bin/postscreenunblank.sh:recovery/root/system/bin/postscreenunblank.sh

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware=mt6853 \
    ro.product.board=oppo6853 \
    ro.board.platform=mt6853 \
    ro.sf.lcd_density=480 \
    ro.vendor.mediatek.platform=MT6853 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.boot.dynamic_partitions=true
