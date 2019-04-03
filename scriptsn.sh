
#STEP-2
TOOLCHAIN="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export CROSS_COMPILE="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export ARCH=arm64 && SUBARCH=arm64


#STEP-3
make "matrix_defconfig"

make "menuconfig"

#STEP-4
make "-j4"

