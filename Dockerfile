FROM debian:latest

# Required Build args
ARG EMAIL
ARG PW

# Before
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /

# Debian
RUN apt-get update
RUN apt-get install -y wget qtcreator libxcb-xinerama0

# Qt6
RUN wget https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.6.1-online.run
RUN chmod +x qt-unified-linux-x64-4.6.1-online.run
RUN ./qt-unified-linux-x64-4.6.1-online.run --root /Qt --accept-licenses --confirm-command --accept-messages install qt.qt5.5152.android --email "${EMAIL}" --pw "${PW}" --accept-obligations

# Android SDK and tools
RUN apt-get install -y android-sdk
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
RUN unzip commandlinetools-linux-10406996_latest.zip -d /usr/lib/android-sdk/

ENV PATH="/usr/lib/android-sdk/cmdline-tools/bin:$PATH"
ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV ANDROID_NDK_ROOT=/usr/lib/android-sdk/ndk/21.3.6528147
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --update
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses
RUN sdkmanager --sdk_root=$ANDROID_SDK_ROOT --install "cmdline-tools;latest" "platform-tools" "platforms;android-31" "build-tools;28.0.3" "build-tools;30.0.3" "build-tools;31.0.0" "build-tools;33.0.0" "ndk;21.3.6528147"
