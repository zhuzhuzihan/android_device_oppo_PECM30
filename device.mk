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
    $(LOCAL_PATH)/recovery/root/system/bin/mcDriverDaemon:recovery/root/system/bin/mcDriverDaemon \
    $(LOCAL_PATH)/recovery/root/system/bin/android.hardware.keymaster@4.0-service.trustonic:recovery/root/system/bin/android.hardware.keymaster@4.0-service.trustonic \
    $(LOCAL_PATH)/recovery/root/system/bin/android.hardware.gatekeeper@1.0-service:recovery/root/system/bin/android.hardware.gatekeeper@1.0-service \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libMcClient.so:recovery/root/vendor/lib64/libMcClient.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libkeymaster4.so:recovery/root/vendor/lib64/libkeymaster4.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libkeymaster4support.so:recovery/root/vendor/lib64/libkeymaster4support.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libkeymaster_messages.so:recovery/root/vendor/lib64/libkeymaster_messages.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libkeymaster_portable.so:recovery/root/vendor/lib64/libkeymaster_portable.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libpuresoftkeymasterdevice.so:recovery/root/vendor/lib64/libpuresoftkeymasterdevice.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libsoft_attestation_cert.so:recovery/root/vendor/lib64/libsoft_attestation_cert.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so:recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/libMcGatekeeper.so:recovery/root/vendor/lib64/hw/libMcGatekeeper.so

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry,recovery/root/vendor/app/mcRegistry) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root/odm/vendor/app/mcRegistry,recovery/root/odm/vendor/app/mcRegistry)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware=mt6853 \
    ro.product.board=oppo6853 \
    ro.board.platform=mt6853 \
    ro.sf.lcd_density=480 \
    ro.vendor.mediatek.platform=MT6853 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.boot.dynamic_partitions=true
