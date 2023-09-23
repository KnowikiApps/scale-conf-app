#!/usr/bin/env bash

BUILD_DIR='build'

# Generate the photos using the render script
(cd android/img/ && exec python3 render-images.py)


# Build build dir if it doesn't exist
if [ ! -d "$BUILD_DIR" ]; then
	echo 'MAKING BUILD DIR'
	mkdir "$BUILD_DIR"
fi

# # qmake calls
# /Qt/5.15.2/android/bin/qmake ../scale-conf-docker.pro -spec android-clang -Wall 2>&1 | tee  /work/build/output_qmake.txt
# /usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make qmake_all | tee >> /work/build/output_qmake.txt
# 
# # make calls
# /usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make 2>&1 | tee /work/build/output_make.txt
# /usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make INSTALL_ROOT=/work/build/android-build install
# cd /work/build/android-build
# /usr/lib/android-sdk/ndk/21.3.6528147/prebuilt/linux-x86_64/bin/make INSTALL_ROOT=/work/build/android-build install
# 
# # android build
# /Qt/5.15.2/android/bin/androiddeployqt --input /work/build/android-scale-conf-docker-deployment-settings.json --output /work/build/android-build --android-platform android-31 --jdk /jdk-20.0.2/bin --gradle --verbose | tee > /work/build/output_androiddeployqt.txt

cd "$BUILD_DIR"
/Qt/5.15.2/android/bin/qmake CONFIG+=debug CONFIG+=qml_debug CONFIG+=qtquickcompiler /work/scale-conf.pro
make aab
