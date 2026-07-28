# OrangeFox device tree for OPPO A53 5G

This is an experimental OrangeFox 12.1 recovery device tree for the OPPO A53
5G (`PECM30`), based on stock Android 11 / ColorOS 11 images.

## Stock image facts

| Property | Value |
| --- | --- |
| Platform | MediaTek MT6853 |
| Boot header | v2 |
| Kernel page size | 2048 |
| Boot partition | 32 MiB |
| Recovery partition | 64 MiB |
| Recovery DTBO | Present |
| Dynamic partitions | Yes |
| Userdata | F2FS, Android 11 FBE |

The prebuilt kernel, DTB and recovery DTBO are extracted from the supplied
stock recovery image. Their source image SHA-256 is documented in
`stock-images.sha256`.

## Build locally

Sync the OrangeFox 12.1 source tree, clone this repository to
`device/oppo/PECM30`, then run:

```bash
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_BUILD_DEVICE=PECM30
export LC_ALL=C
source build/envsetup.sh
lunch twrp_PECM30-eng
mka adbd recoveryimage
```

OrangeFox-specific build variables live in `vendorsetup.sh`, as required by
the official OrangeFox 12.1 build-variable documentation. This tree uses
vanilla mode because PECM30 is not a Xiaomi/MIUI device, and explicitly marks
the stock kernel as prebuilt. The `oppo6853` stock product identifier is
accepted as an alternate device name.

References:

- [Official OrangeFox build guide](https://wiki.orangefox.tech/en/dev/building)
- [OrangeFox 12.1 build variables](https://gitlab.com/OrangeFox/vendor/recovery/-/blob/fox_12.1/orangefox_build_vars.txt)

## Status

The tree is in the initial bring-up stage. A successful CI build does not
prove that the image boots. Display, touch, ADB, partition mounting and FBE
decryption all require testing on a PECM30. Do not flash a CI image without a
verified way to restore the stock recovery.

The stock recovery refers to `/dev/block/by-name/md_udc` as metadata while the
vendor fstab and the device's actual mount table use
`/dev/block/by-name/metadata`. The recovery fstab therefore uses the latter.

## GitHub Actions

Run `Build OrangeFox` manually to receive a 30-day Actions artifact. Pushing a
tag matching `v*` also creates a prerelease containing the image, checksum and
build metadata. The workflow rejects an image with unexpected PECM30 header
parameters or a size greater than the 64 MiB recovery partition.
