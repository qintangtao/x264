#1. /bin/bash^M: bad interpreter: No such file or directory
# 	这个原因相信不少人都碰到过，也知道个大概原因，这里我就再述说一遍。一般都是不同的系统对换行符的理解不同，即对\r的理解不同，所以就会出现这种情况。
#	sed -i 's/\r$//
#2. configure文件需要修改 arm-hisiv200-linux-gcc 不支持

sed -i 's/\r$//' configure
sed -i 's/\r$//' config.guess
sed -i 's/\r$//' config.sub
sed -i 's/\r$//' version.sh
sed -i 's/\r$//' tools/cltostr.sh
CC=arm-hisiv200-linux-gcc ./configure --enable-shared --disable-asm --cross-prefix=arm-hisiv200-linux- --host=arm-hisiv200-linux-gnueabi --prefix=./install/linux/hisiv200
make
make install