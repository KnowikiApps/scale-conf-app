#!/usr/bin/env bash

# process command line arguments
while getopts t:h flag
do
    case "${flag}" in
        t) tag=${OPTARG};;
	h) echo "-t optional android app version tag v#.#.#"
    esac
done

version_name=${tag:1}
version_code=${version_name//.}

echo "ANDROID_VERSION_CODE->${version_code}"
echo "ANDROID_VERSION_NAME->${version_name}"

BUILD_DIR="/work/build"

# Generate the photos using the render script
(cd android/img/ && exec python3 render-images.py)


# Build build dir if it doesn't exist
if [ ! -d "$BUILD_DIR" ]; then
	echo 'MAKING BUILD DIR'
	mkdir "$BUILD_DIR"
fi

#array of android platforms
declare -a platforms=(
[0]=android_x86_64
[1]=android_x86
[2]=android_arm64_v8a
[3]=android_armv7
)

#Run cmake generator and build for each platform
for platform in "${platforms[@]}"
do
	/Qt/6.7.3/$platform/bin/qt-cmake -G Ninja -S /work -B $BUILD_DIR/$platform\
	-DANDROID_NDK_ROOT=$ANDROID_NDK_ROOT \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \

	cmake --build $BUILD_DIR/$platform --target all
done

