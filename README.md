# OrangeFox device tree for OPPO A53 5G

This is an experimental OrangeFox 12.1 recovery device tree for the OPPO A53
5G (`PCEM30`), based on stock Android 11 / ColorOS 11 images.

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
`device/oppo/PCEM30`, then run:

```bash
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_BUILD_DEVICE=PCEM30
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL=C
source build/envsetup.sh
lunch twrp_PCEM30-eng
mka adbd recoveryimage
```

## Status

The tree is in the initial bring-up stage. A successful CI build does not
prove that the image boots. Display, touch, ADB, partition mounting and FBE
decryption all require testing on a PCEM30. Do not flash a CI image without a
verified way to restore the stock recovery.

The stock recovery refers to `/dev/block/by-name/md_udc` as metadata while the
vendor fstab refers to `/dev/block/by-name/metadata`. This tree follows stock
recovery until the actual by-name links are captured from a device.

## GitHub Actions

Run `Build OrangeFox` manually to receive a 30-day Actions artifact. Pushing a
tag matching `v*` also creates a prerelease containing the image, checksum and
build metadata. The workflow rejects an image with unexpected PCEM30 header
parameters or a size greater than the 64 MiB recovery partition.
