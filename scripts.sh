###Matrix Building Scripts###

AK_DIR="/home/abhijith/dev/anykernel3" #         change         #
ZIP_MOVE="/home/abhijith/dev/ZIPS"     #       accrodingly      #
KROOT="$(pwd)"                         #           to           #
IMAGE_DIR="$KROOT/arch/arm64/boot"     #          your          #
REL="1.6"                              #       directories      #
VER="aosp"                             #    Have a nice Day!!   #
DARKGRAY='\033[1;30m'
RED='\033[0;31m'    
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'    
YELLOW='\033[1;33m'
BLUE='\033[0;34m'    
PURPLE='\033[0;35m'    
LIGHTPURPLE='\033[1;35m'
CYAN='\033[0;36m'    
WHITE='\033[1;37m'
SET='\033[0m'


#STEP-1-Always build clean
echo -e "${RED}=====================================${SET}"
echo              -e "${GREEN}CLEANING STUFF${SET}"
echo -e "${BLUE}=====================================${SET}"

chmod +x "scripts.sh"
make "clean"

#STEP-2-Compiling the kernel
echo -e "${RED}=====================================${SET}"
echo              -e "${GREEN}COMPILING KERNEL${SET}"
echo -e "${BLUE}=====================================${SET}"

TOOLCHAIN="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export CROSS_COMPILE="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export ARCH=arm64 && SUBARCH=arm64

#STEP-3-creating config for kernel
echo -e "${RED}=====================================${SET}"
echo              -e "${GREEN}BUILDING KERNEL${SET}"
echo -e "${BLUE}=====================================${SET}"

make "matrix_defconfig"
make "menuconfig"
make "-j4"       # -j (change the number according to you pc threads)

#STEP-6(credits to frap129)
echo -e "${RED}=====================================${SET}"
echo        -e "${GREEN}PROCESSING AND MAKING ZIP${SET}"
echo -e "${BLUE}=====================================${SET}"


                cp -vr $IMAGE_DIR/Image.gz-dtb $AK_DIR/

		cd $AK_DIR
                
		echo "$REL""$VER" > VERSION;
		zip -r9 Matrix_"$REL""$VER".zip *
		if ! [ -d "$ZIP_MOVE" ]; then
		  mkdir $ZIP_MOVE
		fi;
		mv Matrix_"$REL""$VER".zip $ZIP_MOVE
		cd $KERNEL_DIR

