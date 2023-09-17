#!/bin/bash

mkdir /work/build

cd /work/build

# qmake calls
/Qt/5.15.2/android/bin/qmake ../scale-conf-docker.pro -spec android-clang -Wall -d -d 2>&1 | tee  /work/build/output_qmake.txt
/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make qmake_all | tee >> /work/build/output_qmake.txt

# make calls
/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make -d 2>&1 | tee /work/build/output_make.txt
/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make INSTALL_ROOT=/work/build/android-build install
cd /work/build/android-build
/usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make INSTALL_ROOT=/work/build/android-build install

# android build
/Qt/5.15.2/android/bin/androiddeployqt --input /work/build/android-scale-conf-docker-deployment-settings.json --output /work/build/android-build --android-platform android-31 --jdk /jdk-20.0.2/bin --gradle --aab --jarsigner --release | tee > /work/build/output_androiddeployqt.txt
