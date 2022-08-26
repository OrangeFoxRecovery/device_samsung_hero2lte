#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FDEVICE="hero2lte"

fox_get_target_device() {
	local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
	if [ -n "$chkdev" ]; then
		FOX_BUILD_DEVICE="$FDEVICE"
	else
		chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
		[ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
	fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

	# Basic Vars
	export ALLOW_MISSING_DEPENDENCIES=true
	export LC_ALL="C"
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"

	export OF_PATCH_AVB20=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export FOX_REPLACE_BUSYBOX_PS=1
	export OF_USE_NEW_MAGISKBOOT=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export FOX_DELETE_AROMAFM=1
	export OF_USE_SYSTEM_FINGERPRINT=1
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1600876644"; # Wednesday, September 23 2020 19:07:11 BST
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_ZIP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_USE_GREEN_LED=0

	# OTA for custom ROMs
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1

	# Quick backup defaults
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;"

	# Exynos ($FDEVICE) Specific
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/155a0000.ufs/by-name/RECOVERY"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/155a0000.ufs/by-name/SYSTEM"
	# FOX_RECOVERY_VENDOR_PARTITION is not set as the device is non-treble
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/155a0000.ufs/by-name/BOOT"
	export OF_FL_PATH1="/system/flashlight"
	export OF_DEVICE_WITHOUT_PERSIST="1"

	# R11.1 Settings
	export FOX_R11="1"
	export FOX_VERSION="R11.1_1"
	export OF_MAINTAINER="Sushrut1101"

	# Magisk
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk.zip
	if [ -n "${FOX_USE_SPECIFIC_MAGISK_ZIP}" ]; then
		if [ ! -e "${FOX_USE_SPECIFIC_MAGISK_ZIP}" ]; then
			echo "Downloading the Latest Release of Magisk..."
			LATEST_MAGISK_URL="$(curl -sL https://api.github.com/repos/topjohnwu/Magisk/releases/latest | grep browser_download_url | grep Magisk- | cut -d : -f 2,3 | sed 's/"//g')"
			wget -q ${LATEST_MAGISK_URL} -O ${FOX_USE_SPECIFIC_MAGISK_ZIP} || wget ${LATEST_MAGISK_URL} -O ${FOX_USE_SPECIFIC_MAGISK_ZIP}
			[ "$?" = "0" ] && echo "Magisk Downloaded Successfully"
			echo "Done!"
		fi
	fi

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
