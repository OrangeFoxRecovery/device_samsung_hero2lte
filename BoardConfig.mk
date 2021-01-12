DEVICE_TREE := device/samsung/hero2lte

# Bootloader
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos8890
TARGET_BOOTLOADER_BOARD_NAME := universal8890
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
LZMA_COMPRESSION := -9
LZMA_RAMDISK_TARGETS := recovery
TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(DEVICE_TREE)/dt.img

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP specific build flags
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/15400000.usb/15400000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/13900000.dsim/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone1/temp"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_USE_NEW_MINADBD := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_TWRPAPP := true
TW_FORCE_USE_BUSYBOX := true
TW_INCLUDE_RESETPROP := true
TW_DEVICE_VERSION := MoRo-1.5

# Encryption support
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

# Asian region languages
TW_EXTRA_LANGUAGES := true

#SHRP_Variables
SHRP_PATH := device/samsung/hero2lte
SHRP_MAINTAINER := Morogoku
SHRP_DEVICE_CODE := hero2lte
SHRP_EDL_MODE := 0
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb-otg
SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/devices/virtual/camera/flash/rear_flash
SHRP_FONP_2 :=
SHRP_FONP_3 :=
SHRP_FLASH_MAX_BRIGHTNESS := 1
SHRP_REC := /dev/block/platform/155a0000.ufs/by-name/RECOVERY
SHRP_AB := false
SHRP_REC_TYPE := Normal
SHRP_DEVICE_TYPE := A_Only
SHRP_EXPRESS := true
SHRP_OFFICIAL := true
SHRP_DARK := true
SHRP_ALT_REBOOT := true

