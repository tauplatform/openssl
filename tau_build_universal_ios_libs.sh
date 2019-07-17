#!/usr/bin/env bash
export CC=clang
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
export CROSS_SDK=iPhoneOS12.1.sdk

make clean
./Configure ios64e-cross enable-ssl2 enable-ssl3 no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC --prefix=/usr/local/openssl64-ios
make depend && make all
mkdir ./libopenssl_ios
cd ./libopenssl_ios
rm -rf *.a
cp ../libcrypto.a libcrypto_arm64e.a
cp ../libssl.a libssl_arm64e.a
cd ../

make clean
./Configure ios64-cross enable-ssl2 enable-ssl3 no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC --prefix=/usr/local/openssl64-ios
make depend && make all
cd ./libopenssl_ios
cp ../libcrypto.a libcrypto_arm64.a
cp ../libssl.a libssl_arm64.a
cd ../


make clean
./Configure ios-cross enable-ssl2 enable-ssl3 no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC --prefix=/usr/local/openssl-ios
make depend && make all
cd ./libopenssl_ios
cp ../libcrypto.a libcrypto_armv7.a
cp ../libssl.a libssl_armv7.a
cd ../

make clean
./Configure ios-cross7s enable-ssl2 enable-ssl3 no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC --prefix=/usr/local/openssl-ios
make depend && make all
cd ./libopenssl_ios
cp ../libcrypto.a libcrypto_armv7s.a
cp ../libssl.a libssl_armv7s.a
cd ../


export CC=clang
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer
export CROSS_SDK=iPhoneSimulator12.1.sdk

make clean
./Configure iphoneos-cross enable-ssl2 enable-ssl3 no-shared no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC --prefix=/usr/local/openssl-iphoneos
make depend && make all
cd ./libopenssl_ios
cp ../libcrypto.a libcryptox86_64.a
cp ../libssl.a libsslx86_64.a
cd ../

export "CC=/usr/bin/gcc -arch i386"
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer
export CROSS_SDK=iPhoneSimulator12.1.sdk

make clean
./Configure iphoneos-cross enable-ssl2 enable-ssl3 no-shared no-engine no-hw no-comp -DOPENSSL_SMALL_FOOTPRINT -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_JPAKE -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_NO_RC5 -DOPENSSL_NO_MD2 -DOPENSSL_NO_KRB5 -DOPENSSL_NO_ASYNC --prefix=/usr/local/openssl-iphoneos-cross386
make depend && make all
cd ./libopenssl_ios
cp ../libcrypto.a libcryptox86.a
cp ../libssl.a libsslx86.a



lipo -create libcrypto_armv7.a libcrypto_armv7s.a libcrypto_arm64.a libcrypto_arm64e.a libcryptox86_64.a libcryptox86.a -output libcrypto.a
lipo -create libssl_armv7.a libssl_armv7s.a libssl_arm64.a libssl_arm64e.a libsslx86_64.a libsslx86.a -output libssl.a
