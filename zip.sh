##Zip Creation Scripts

AK_DIR="/home/abhijith/dev/anykernel3"
ZIP_MOVE="/home/abhijith/dev/ZIPS"
KROOT="$(pwd)"
IMAGE_DIR="$KROOT/arch/arm64/boot"
REL="aosp"
VER="1.6"
ZIP="Matrix-Release-aosp1.6.zip"
                cp -vr $IMAGE_DIR/Image.gz-dtb $AK_DIR/

		cd $AK_DIR
                
		echo "$REL""$VER" > VERSION;
		zip -r9 Matrix_"$REL""$VER".zip *
		if ! [ -d "$ZIP_MOVE" ]; then
		  mkdir $ZIP_MOVE
		fi;
		mv Matrix_"$REL""$VER".zip $ZIP_MOVE
		cd $KERNEL_DIR

