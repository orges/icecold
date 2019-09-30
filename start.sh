export CROSS_COMPILE_ARM32=/root/gcc/bin/arm-linux-androideabi-
make O=out ARCH=arm64 whyred_defconfig
PATH="/root/clang/bin:/root/gcc64/bin:${PATH}"
make -j$(nproc --all) O=out \ ARCH=arm64 \ CC=clang \ CLANG_TRIPLE=aarch64-linux-gnu- \ CROSS_COMPILE=aarch64-linux-android-
rm /root/icecold/AnyKernel2/*.zip 
cp out/arch/arm64/boot/Image.gz-dtb /root/icecold/AnyKernel2/ 
cd /root/icecold/AnyKernel2/
zip -r9 IceColdR4.2-Q.zip *
