#!/system/bin/sh

blank=/sys/class/graphics/fb0/blank
[ -w "$blank" ] && printf '0\n' > "$blank"
