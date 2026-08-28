#!/usr/bin/env bash

FDEVICE="PECM30"

fox_get_target_device() {
    if echo "${BASH_SOURCE[0]}" | grep -q "/${FDEVICE}/"; then
        FOX_BUILD_DEVICE="${FDEVICE}"
    elif set | grep BASH_ARGV | grep -qw "${FDEVICE}"; then
        FOX_BUILD_DEVICE="${FDEVICE}"
    fi
}

if [ -z "$1" ] && [ -z "${FOX_BUILD_DEVICE}" ]; then
    fox_get_target_device
fi

if [ "$1" = "${FDEVICE}" ] || [ "${FOX_BUILD_DEVICE}" = "${FDEVICE}" ]; then
    export ALLOW_MISSING_DEPENDENCIES=true
    export LC_ALL=C

    # OrangeFox's documentation recommends vanilla mode for non-Xiaomi devices.
    export FOX_VANILLA_BUILD=1
    export OF_FORCE_PREBUILT_KERNEL=1
    export OF_DEFAULT_KEYMASTER_VERSION="4.0"
    # Skip FBE decryption as documented by OrangeFox for problematic devices.
    export OF_SKIP_FBE_DECRYPTION=1
    export OF_MAINTAINER="zhuzhuzihan"
    export TARGET_DEVICE_ALT="oppo6853"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

    # Keep the initial 64 MiB recovery build small and conservative.
    export FOX_DELETE_AROMAFM=1
    export FOX_EXCLUDE_NANO_EDITOR=1

    # PECM30 has a 1080x2400 display with software navigation keys.
    export OF_SCREEN_H=2400
    export OF_ALLOW_DISABLE_NAVBAR=0

    # OrangeFox documents the standard health service as unreliable on MTK.
    export OF_USE_LEGACY_BATTERY_SERVICES=1
fi
