#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

if [ $USER != haggertk ]; then
  d=`pwd`
  cd vendor/samsung || exit 1
  git remote remove haggertk > /dev/null 2>&1
  git remote add haggertk https://github.com/haggertk/proprietary_vendor_samsung.git || exit 1
  git fetch haggertk lineage-15.1 || exit 1
  git checkout haggertk/lineage-15.1 || exit 1
  cd "$d"
fi

# device/samsung/msm8974-common
kpick 203120 # msm8974: Enable full dex preopt
kpick 203303 # Revert "msm8974-common: Use QTI HIDL power HAL"

# device/samsung/klte-common
kpick 203304 # klte-common: power: Add legacy qcom HAL compat code

# device/lineage/sepolicy
kpick 198594 # sepolicy: qcom: Import bluetooth_loader/hci_attach rules
kpick 199571 # sepolicy: Move fingerprint 2.0 service out of private sepolicy
kpick 199572 # sepolicy: SELinux policy for persistent properties API
kpick 201552 # Squashed import of superuser SELinux policies
kpick 201582 # sepolicy: adapt sudaemon policy for O

# device/qcom/sepolicy
kpick 202830 # legacy: Add back legacy sensors rules
kpick 202995 # legacy: Address mpdecision denials

# system/sepolicy
kpick 199664 # sepolicy: Fix up exfat and ntfs support
kpick 198106 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198107 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 201553 # sepolicy: We need to declare before referencing
kpick 201583 # sepolicy: Allow su by apps on userdebug_or_eng
kpick 201584 # sepolicy: update policies for sudaemon on O
kpick 201732 # sepilocy: add sudaemon to ignore list

# system/core
kpick 202849 # Update permissions to the superuser binary
d=`pwd`
cd system/core || exit 1
git remote remove blek > /dev/null 2>&1
git remote add blek https://github.com/invisiblek/android_system_core.git || exit 1
git fetch blek lineage-15.1_safetynet || exit 1
git cherry-pick 96c4433e || exit 1 # init: I hate safety net
cd "$d" || exit 1

# frameworks/base
kpick 200968 # statusbar: Add arguments to shutdown and reboot to allow confirmation
kpick 200969 # SystemUI: Power menu customizations
kpick 201879 # frameworks: Privacy Guard for O
kpick 199947 # PowerManager: Re-integrate button brightness

# frameworks/av
kpick 198113 # camera/media: Support for legacy camera HALv1
kpick 198116 # CameraService: Fix deadlock in binder death cleanup.

# frameworks/native
kpick 201530 # AppOpsManager: Update with the new ops

# frameworks/opt/telephony
kpick 203256 # MMS: Update apnProfileID for MMS only apn

# packages/apps/Settings
kpick 199839 # Settings: Add advanced restart switch
kpick 201529 # Settings: Privacy Guard
kpick 201531 # Settings: Add developer setting for root access

# packages/apps/LineageParts
kpick 201309 # LineageParts: Re-enable PowerMenuActions and adapt to SDK updates
kpick 201528 # PrivacyGuard: Bring up and inject into Settings
kpick 199948 # LineageParts: Bring up button backlight settings

# lineage-sdk
kpick 200970 # lineage-sdk: Import power menu related classes

# vendor/lineage
kpick 201336 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

# Dark-theme - putting this last because need to manually-resolve change
kpick 201327 # overlays: Overlay Settings for Dark UI [1/2]
kpick 201329 # SysuiDarkThemeOverlay: Initial Dark UI changes
kpick 201330 # overlays: Overlay Settings for Dark UI [2/2]
kpick 200153 # StatusBar: Add dark theme toggle [1/3]
kpick 200154 # LineageSettings: Add dark theme toggle [2/3]
kpick 200155 # Settings: Add toggle for dark theme [3/3]

exit 0
