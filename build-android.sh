NDK=/D/Users/open/android-sdk/ndk/21.0.6113669
API=29
HOST_TAG=windows-x86_64
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG/bin
SYSROOT=$NDK/sysroot

echo $TOOLCHAIN

#创建link
#ln -f -s libx264.so.164 */libx264.so

configure()
{
	#get the parameter
    TARGET_CPU=$1
	if [ "$TARGET_CPU" == "x86" ];then
        echo "build i686 32bit lib"
        ARCH=i686
        TARGET=i686-linux-android
        CROSS_PREFIX=$TOOLCHAIN/i686-linux-android-
        #CC=$TOOLCHAIN/$TARGET$API-clang
        #CXX=$TOOLCHAIN/$TARGET$API-clang++
    elif [ "$TARGET_CPU" == "x86_64" ];then
        echo "build x86_64 64bit lib"
        ARCH=x86_64
        TARGET=x86_64-linux-android
        CROSS_PREFIX=$TOOLCHAIN/x86_64-linux-android-
        #CC=$TOOLCHAIN/$TARGET$API-clang
        #CXX=$TOOLCHAIN/$TARGET$API-clang++
    elif [ "$TARGET_CPU" == "armeabi-v7a" ];then
        echo "build 32bit lib"
        ARCH=armv7a
        TARGET=armv7a-linux-androideabi
        CROSS_PREFIX=$TOOLCHAIN/arm-linux-androideabi-
        #CC=$TOOLCHAIN/$TARGET$API-clang
        #CXX=$TOOLCHAIN/$TARGET$API-clang++
    else
        echo "build 64bit lib"
        ARCH=aarch64
        TARGET=aarch64-linux-android
        CROSS_PREFIX=$TOOLCHAIN/aarch64-linux-android-
        #CC=$TOOLCHAIN/$TARGET$API-clang
        #CXX=$TOOLCHAIN/$TARGET$API-clang++
    fi

    echo ARCH=$ARCH
    echo TARGET=$TARGET
    echo CROSS_PREFIX=$CROSS_PREFIX
    #echo CC=$CC
    #echo CXX=$CXX

	#CC=$TOOLCHAIN/$TARGET$API-clang ./configure --enable-shared --disable-asm --cross-prefix=$CROSS_PREFIX --host=$ARCH-android-linux-gnueabi --prefix=./install/android/$TARGET_CPU
	CC=$TOOLCHAIN/$TARGET$API-clang ./configure --enable-static --disable-asm --cross-prefix=$CROSS_PREFIX --host=$ARCH-android-linux-gnueabi --prefix=./install/android/$TARGET_CPU-static
}

build_one()
{
    TARGET_CPU=$1
    echo "configure $TARGET_CPU"
    configure $TARGET_CPU
    echo "build $TARGET_CPU"
    make -j8
    echo "build $TARGET_CPU done"
    make install
    echo "install $TARGET_CPU done"
    #need to call make clean if you want to build for more than one target    
    make clean
}

#the entry
build_all()
{
    build_one armeabi-v7a
    build_one arm64-v8a
    build_one x86
    build_one x86_64
}

#call the entry
build_all