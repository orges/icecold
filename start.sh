export CROSS_COMPILE_ARM32=/root/gcc/bin/arm-linux-androideabi-
make O=out ARCH=arm64 whyred_defconfig
PATH="/root/clang/bin:/root/gcc64/bin:${PATH}"
make -j$(nproc --all) O=out \ ARCH=arm64 \ CC=clang \ CLANG_TRIPLE=aarch64-linux-gnu- \ CROSS_COMPILE=aarch64-linux-android-
