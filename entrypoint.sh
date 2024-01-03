#!/usr/bin/bash
heif-convert $1 -o $2
exiftool -overwrite_original -Orientation=$(heif-info $1 | grep 'angle (ccw):' | awk '{print $3}') -n $2
