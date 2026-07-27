#!/usr/bin/env python3
"""Validate the fixed properties of a PCEM30 recovery image."""

import argparse
import hashlib
import struct
from pathlib import Path


MAX_RECOVERY_SIZE = 67_108_864


def uint32(header: bytes, offset: int) -> int:
    return struct.unpack_from("<I", header, offset)[0]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("image", type=Path)
    args = parser.parse_args()

    image_size = args.image.stat().st_size
    with args.image.open("rb") as stream:
        header = stream.read(1660)

    if header[:8] != b"ANDROID!":
        raise SystemExit("not an Android boot image")

    values = {
        "kernel_size": uint32(header, 8),
        "kernel_address": uint32(header, 12),
        "ramdisk_size": uint32(header, 16),
        "ramdisk_address": uint32(header, 20),
        "second_address": uint32(header, 28),
        "tags_address": uint32(header, 32),
        "page_size": uint32(header, 36),
        "header_version": uint32(header, 40),
        "recovery_dtbo_size": uint32(header, 1632),
        "dtb_size": uint32(header, 1648),
    }

    expected = {
        "kernel_address": 0x40080000,
        "ramdisk_address": 0x47C80000,
        "second_address": 0x00000000,
        "tags_address": 0x4BC80000,
        "page_size": 2048,
        "header_version": 2,
        "recovery_dtbo_size": 269_319,
        "dtb_size": 159_657,
    }
    for key, expected_value in expected.items():
        if values[key] != expected_value:
            raise SystemExit(
                f"unexpected {key}: {values[key]} (expected {expected_value})"
            )

    if not values["kernel_size"] or not values["ramdisk_size"]:
        raise SystemExit("kernel or ramdisk payload is empty")
    if image_size > MAX_RECOVERY_SIZE:
        raise SystemExit(
            f"image is {image_size} bytes, exceeding {MAX_RECOVERY_SIZE} bytes"
        )

    digest = hashlib.sha256(args.image.read_bytes()).hexdigest()
    print(f"image={args.image}")
    print(f"size={image_size}")
    for key, value in values.items():
        print(f"{key}={value}")
    print(f"sha256={digest}")


if __name__ == "__main__":
    main()
