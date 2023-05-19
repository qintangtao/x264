if [ ! -n "$1" ]
then
   echo "Please input install path."
   exit
fi
./configure --enable-static --prefix=$1
make -j8
make install