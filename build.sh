if [ ! -n "$1" ]
then
   echo "Please input install path."
   exit
fi
./configure --enable-shared --prefix=$1
make -j8
make install