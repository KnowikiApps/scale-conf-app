# syntax = docker/dockerfile:1.2
FROM debian:latest

# Before
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /

# Debian
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y build-essential wget qtcreator libxcb-xinerama0 libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 cmake ninja-build
RUN apt-get autoclean && apt-get clean

# Qt 6.7.3 Install
RUN wget https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.6.1-online.run
RUN chmod +x qt-unified-linux-x64-4.6.1-online.run
RUN --mount=type=secret,id=qt_acct_email \
    --mount=type=secret,id=qt_acct_pw \
    ./qt-unified-linux-x64-4.6.1-online.run --root /Qt --accept-licenses --confirm-command --accept-messages \
    --email $(cat /run/secrets/qt_acct_email) --pw $(cat /run/secrets/qt_acct_pw) --accept-obligations \
    install qt.qt6.673.android qt.qt6.673.addons.qtwebview qt.qt6.673.addons.qtmultimedia

RUN rm qt-unified-linux-x64-4.6.1-online.run

# JDK 20
RUN wget https://download.java.net/java/GA/jdk20.0.2/6e380f22cbe7469fa75fb448bd903d8e/9/GPL/openjdk-20.0.2_linux-x64_bin.tar.gz
RUN tar xvf openjdk-20.0.2_linux-x64_bin.tar.gz

RUN rm openjdk-20.0.2_linux-x64_bin.tar.gz

# Android SDK and command line tools
RUN apt-get install -y android-sdk python3-cairosvg
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
RUN unzip commandlinetools-linux-10406996_latest.zip -d /usr/lib/android-sdk/

RUN rm commandlinetools-linux-10406996_latest.zip

#Set build env variables
ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV ANDROID_NDK_VERS=26.1.10909125
ENV ANDROID_NDK=$ANDROID_SDK_ROOT/ndk/$ANDROID_NDK_VERS
ENV ANDROID_PLATFORM=android-34
ENV ANDROID_NDK_ROOT=$ANDROID_SDK_ROOT/ndk/$ANDROID_NDK_VERS
ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/bin:$PATH"

#Install SDK components
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --update
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses
RUN sdkmanager --sdk_root=$ANDROID_SDK_ROOT --install \
    "cmdline-tools;latest" \
    "platform-tools" \
    "platforms;android-34" \
    "ndk;26.1.10909125" \
    "build-tools;33.0.0"
