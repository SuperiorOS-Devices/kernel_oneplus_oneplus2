###Matrix Building Scripts###

AK_DIR="/home/abhijith/dev/anykernel3"
ZIP_MOVE="/home/abhijith/dev/ZIPS"
KROOT="$(pwd)"
IMAGE_DIR="$KROOT/arch/arm64/boot"
REL="aosp"
VER="1.6"


#STEP-1
make "clean"

#STEP-2
make "menuconfig"

#STEP-3
TOOLCHAIN="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export CROSS_COMPILE="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
ARCHITECTURE=arm64


#STEP-4
make "matrix_defconfig"

#STEP-5
make "-j4"

#STEP-6

                cp -vr $IMAGE_DIR/Image.gz-dtb $AK_DIR/

		cd $AK_DIR
                
		echo "$REL""$VER" > VERSION;
		zip -r9 Matrix_"$REL""$VER".zip *
		if ! [ -d "$ZIP_MOVE" ]; then
		  mkdir $ZIP_MOVE
		fi;
		mv Matrix_"$REL""$VER".zip $ZIP_MOVE
		cd $KERNEL_DIR

