# Stock prebuilts

These files were extracted with MagiskBoot from the supplied stock Android 11
recovery image (`d76228b4720ce19835c6067edc2b54b7bcf69cd8a3294760cdfd7aae3ab23034`).

| File | SHA-256 |
| --- | --- |
| `kernel` | `ccd648faf70c36a526b54ef3b3e04c0558535c0861ca48b557786740d2183818` |
| `dtb` | `5e4fbe00e75769c7d7fd7887e2095011b0c101e3b562c78793569e54f74a5fc0` |
| `recovery_dtbo` | `d6f641ccf46e0fe0392f133b6e68b42c979b3a70ca934658c9ac5588ab6fd487` |

The kernel is the original gzip-compressed boot image payload, not the
decompressed `Image`. The `kernel` and `dtb` payloads are byte-identical in
the supplied stock boot and recovery images.
