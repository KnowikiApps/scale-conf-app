#!/bin/bash

mkdir /work/build

cd /work/build

/Qt/5.15.2/android/bin/qmake ../scale-conf-docker.pro -spec android-clang -Wall

/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make all

#/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make -f Makefile.Armeabi-v7a all
#/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make -f Makefile.Arm64-v8a all
#/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make -f Makefile.X86 all
#/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make -f Makefile.X86_64 all

/Qt/5.15.2/android/bin/androiddeployqt --input /work/build/android-scale-conf-docker-deployment-settings.json --output /work/build/android-build --android-platform android-31 --jdk /jdk-20.0.2/bin --gradle --aab --jarsigner --release
