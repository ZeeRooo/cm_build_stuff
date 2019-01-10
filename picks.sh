#!/bin/sh
source build/envsetup.sh

# device/lineage/sepolicy
repopick 236446 # common: Improve label of I/O sched tuning nodes
repopick 237204 # selinux: move vendor_camera_prop to device/lineage/sepolicy
repopick 237203 # selinux: snap: allow to read vendor camera props
repopick 237205 # selinux: move vendor_camera_prop from device/qcom/sepolicy

# device/qcom/sepolicy-legacy
repopick 238636 # sepolicy: Add type vendor_display_prop for legacy devices

# frameworks/base
repopick 224266 # SystemUI: Add Lineage statusbar item holder
repopick 224267 # SystemUI: Network Traffic [1/3]
repopick 235986 # frameworks: Add unlinked ringtone and notification volumes
repopick 233633 # Phone ringtone setting for Multi SIM device

# packages/apps/Settings
repopick 235978 # Settings: Add switch for linked ring and media notification volumes
repopick 236184 # Settings: Use correct icon for ring volume
repopick 233634 # Phone ringtone setting for Multi SIM device
repopick 227120 # Settings: Check interfaces before enabling ADB over network

# packages/services/Telecomm
repopick 233635 # Phone ringtone setting for Multi SIM device

# system/sepolicy
repopick 234884 # Allow init to write to /proc/cpu/alignment
repopick 234886 # Allow init to chmod/chown /proc/slabinfo
repopick 235196 # Allow dnsmasq to getattr netd unix_stream_socket
repopick 230613 # Allow webview_zygote to read /dev/ion

# vendor/lineage
repopick 237352 # qcom: Mark some gralloc bits as valid

repopick 232428 # su: strlcpy is always a friend

repopick -t pie-battery-styles -e 227929

git apply storaged.patch