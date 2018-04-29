#!/usr/bin/env bash
export CC=clang
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer
export CROSS_SDK=MacOSX.sdk

make clean
./Configure darwin64-x86_64-cc enable-ssl2 enable-ssl3 no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC
make depend && make all
mkdir ./libopenssl_macosx
cd ./libopenssl_macosx
rm -rf *.a
cp ../libcrypto.a libcrypto.a
cp ../libssl.a libssl.a
cd ../
