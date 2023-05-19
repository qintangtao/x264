# 1. 适用于 VS 2017 的本机工具命令提示 （e:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat）
# 2. pushd C:\msys64
# 3. msys2_shell.cmd -mingw32 -full-path
# 4. cd x264

CC=cl ./configure --enable-shared --prefix=./install/windows/x86_msvc
make -j8
make install