###Matrix Building Scripts###

AK_DIR="/home/abhijith/dev/anykernel3" #         change         #
ZIP_MOVE="/home/abhijith/dev/ZIPS"     #       accrodingly      #
KROOT="$(pwd)"                         #           to           #
IMAGE_DIR="$KROOT/arch/arm64/boot"     #          your          #
REL="1.6"                              #       directories      #
VER="aosp"                             #    Have a nice Day!!   #


#STEP-1-Always build clean
chmod +x "scripts.sh"
make "clean"

#STEP-2-Compiling the kernel
TOOLCHAIN="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export CROSS_COMPILE="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
ARCHITECTURE=arm64

#STEP-3-creating config for kernel
make "matrix_defconfig"

#STEP-4-menuconfig
make "menuconfig"


#STEP-5-Start building!!!!!
make "-j4"       # -j (change the number according to you pc threads)

#STEP-6(credits to frap129)

                cp -vr $IMAGE_DIR/Image.gz-dtb $AK_DIR/

		cd $AK_DIR
                
		echo "$REL""$VER" > VERSION;
		zip -r9 Matrix_"$REL""$VER".zip *
		if ! [ -d "$ZIP_MOVE" ]; then
		  mkdir $ZIP_MOVE
		fi;
		mv Matrix_"$REL""$VER".zip $ZIP_MOVE
		cd $KERNEL_DIR

