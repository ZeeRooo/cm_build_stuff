#!/bin/sh
source build/envsetup.sh

# device/lineage/sepolicy
repopick 237204 # selinux: move vendor_camera_prop to device/lineage/sepolicy
repopick 238588 # selinux: snap: allow to read vendor camera props
repopick 237205 # selinux: move vendor_camera_prop from device/qcom/sepolicy

# frameworks/base
repopick 224266 # SystemUI: Add Lineage statusbar item holder
repopick 224267 # SystemUI: Network Traffic [1/3]
repopick 235986 # frameworks: Add unlinked ringtone and notification volumes

# packages/apps/Settings
repopick 235978 # Settings: Add switch for linked ring and media notification volumes
repopick 236184 # Settings: Use correct icon for ring volume
repopick 233634 # Phone ringtone setting for Multi SIM device
repopick 227120 # Settings: Check interfaces before enabling ADB over network

# packages/services/Telecomm
repopick 233635 # Phone ringtone setting for Multi SIM device

# system/extras/su
repopick 232428 # su: strlcpy is always a friend

repopick -t pie-battery-styles -e 227929

# system/sepolicy/private
#git apply storaged.patch
