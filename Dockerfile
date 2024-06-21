# syntax = docker/dockerfile:1.2
FROM debian:latest

# Before
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /

# Debian
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y wget qtcreator libxcb-xinerama0 libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386
RUN apt-get autoclean && apt-get clean

# Qt5.15.2
RUN wget https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.6.1-online.run
RUN chmod +x qt-unified-linux-x64-4.6.1-online.run
RUN --mount=type=secret,id=qt_acct_email \
    --mount=type=secret,id=qt_acct_pw \
    ./qt-unified-linux-x64-4.6.1-online.run --root /Qt --accept-licenses --confirm-command --accept-messages install qt.qt5.5152.android --email $(cat /run/secrets/qt_acct_email) --pw $(cat /run/secrets/qt_acct_pw) --accept-obligations

# JDK 20
RUN wget https://download.java.net/java/GA/jdk20.0.2/6e380f22cbe7469fa75fb448bd903d8e/9/GPL/openjdk-20.0.2_linux-x64_bin.tar.gz
RUN tar xvf openjdk-20.0.2_linux-x64_bin.tar.gz

# Android SDK and tools
RUN apt-get install -y android-sdk python3-cairosvg
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
RUN unzip commandlinetools-linux-10406996_latest.zip -d /usr/lib/android-sdk/

ENV PATH="/usr/lib/android-sdk/cmdline-tools/bin:$PATH"
ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV ANDROID_NDK_ROOT=/usr/lib/android-sdk/ndk/21.3.6528147
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --update
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses
RUN sdkmanager --sdk_root=$ANDROID_SDK_ROOT --install "cmdline-tools;latest" "platform-tools" "platforms;android-31" "build-tools;28.0.3" "build-tools;30.0.3" "build-tools;31.0.0" "ndk;21.3.6528147"
