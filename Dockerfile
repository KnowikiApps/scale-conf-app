FROM debian:latest

# Before
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /

RUN apt-get update

# Qt
RUN apt-get install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools

# Java
RUN apt-get install -y default-jre sdkmanager

# Android
RUN apt-get install -y android-sdk android-sdk-build-tools
ENV ANDROID_HOME=/usr/lib/android-sdk
RUN sdkmanager "cmdline-tools;latest" "platforms;android-31" "platform-tools"
