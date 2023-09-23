#!/usr/bin/env bash

BUILD_DIR='build-aab'

# Generate the photos using the render script
(cd android/img/ && exec python3 render-images.py)


# Build build dir if it doesn't exist
if [ ! -d "$BUILD_DIR" ]; then
	echo 'MAKING BUILD DIR'
	mkdir "$BUILD_DIR"
fi

cd "$BUILD_DIR"
/Qt/5.15.2/android/bin/qmake CONFIG+=debug CONFIG+=qml_debug CONFIG+=qtquickcompiler /work/scale-conf.pro
make aab
