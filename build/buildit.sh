export TARGET=i686-pc-linux-gnu 
export PREFIX=/opt.i686

rm -rf $PREFIX
mkdir $PREFIX

cd build_binutils

../binutils-2.21/configure --prefix=$PREFIX --target=$TARGET --disable-nls
make -j 6
make install

 
cd ..
cd build_gcc
../gcc-4.5.2/configure --prefix=$PREFIX --target=$TARGET --without-headers --disable-nls --enable-languages=c,c++ 
make all-gcc -j 6
make install-gcc

#make all-target-libgcc -j 6
#make install-target-libgcc

export PATH=$PREFIX/bin:$PATH
 
cd ..
mkdir build_newlib
cd build_newlib
rm -rf *
../newlib-1.19.0/configure --prefix=$PREFIX --disable-nls --target=$TARGET
make -j 6
make install

cd ..
cd build_gcc
../gcc-4.5.2/configure --prefix=$PREFIX --target=$TARGET --with-headers --disable-nls --enable-languages=c,c++ --with-newlib
make -j 6
make install