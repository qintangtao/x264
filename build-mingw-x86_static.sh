# 1. mingw32下自动获取host错误(x86_64-pc-mingw32)
#	config.guess中使用<uname -m>获取的是x86_64
# 	需要我们手动设置host: --host=i686-pc-mingw32 （i486 or i586 or i686）
# 2. Minimum version is nasm-2.13
#	If you really want to compile without asm, configure with --disable-asm.
#	2.1. 直接禁用 	--disable-asm
#	2.2. 升级nasm	pacman -Sy nasm

./configure --enable-static --host=i686-pc-mingw32 --disable-asm --prefix=./install/windows/x86_mingw_static
make -j8
make install