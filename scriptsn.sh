
####Scripts when i don't want to clear stuff###########

M_DIR="$KROOT/matrix-aosp"
KROOT="/home/abhijith/dev"
ZIP="$KROOT/anykernel3"


echo -e "\e[92m ====================================== \e[0m"
echo     -e    "\e[34m Matrix \e[0m"
echo     -e    "\e[36m Compiling \e[0m"
echo     -e    "\e[95m Scripts  \e[0m"
echo     -e "\e[33m Do it on your own risk\e[0m"
echo -e "\e[92m ====================================== \e[0m "



#STEP-1
echo -e "\e[92m ====================================== \e[0m"
echo    -e "\e[31m Compiling Matrix \e[0m"
echo -e "\e[92m ====================================== \e[0m"
 cd "/home/abhijith/dev/toolchain"
export CROSS_COMPILE="/home/abhijith/dev/toolchain/bin/aarch64-linux-android-"
export ARCH=arm64 && SUBARCH=arm64
 cd $KROOT/matrix-aosp

#STEP-2
echo -e "\e[93m ====================================== \e[0m"
echo              -e "\e[35m Making it!!!!! \e[0m"
echo -e "\e[93m ====================================== \e[0m"

make "matrix_defconfig"
make "menuconfig"
make "-j4"

#STEP-3
echo -e "\e[95m =================================== \e[0m"
echo             -e "\e[36m zipping it \e[0m"
echo -e "\e[95m =================================== \e[0m"
ZIP_MOVE="/home/abhijith/dev/ZIPS"
IMAGE_DIR="$KROOT/matrix-aosp/arch/arm64/boot"
REL="aosp"
VER="1.6"
                cp -vr $IMAGE_DIR/Image.gz-dtb $ZIP/

                cd $ZIP

                echo "$REL"-"$VER" > VERSION;
                zip -r9 Matrix_"$REL"-"$VER".zip *
                if ! [ -d "$ZIP_MOVE" ]; then
                  mkdir $ZIP_MOVE
                fi;
                mv Matrix_"$REL"-"$VER".zip $ZIP_MOVE
                cd $KERNEL_DIR


