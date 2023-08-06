FROM ubuntu:22.04
LABEL description="This is a custom Docker Image for building android version"
#ubuntu setup
RUN apt update
RUN apt-get --assume-yes install wget make
#Qt setup
RUN apt-get --assume-yes install qtbase5-dev qt5-qmake qtchooser qtbase5-dev-tools
#Java setup
RUN apt-get --assume-yes install default-jre
#Android SDK
RUN apt-get --assume-yes install android-sdk
RUN mkdir -p /android/sdk/cmdline-tools/tools
WORKDIR /android
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip
RUN unzip commandlinetools-linux-9123335_latest.zip
RUN pwd
RUN ls -l
RUN mv -i /android/cmdline-tools/* /android/sdk/cmdline-tools/tools
ENV ANDROID_HOME=/android/sdk
ENV PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
ENV PATH=$ANDROID_HOME/emulator/:$PATH
ENV PATH=$ANDROID_HOME/platform-tools/:$PATH
RUN yes | sdkmanager --update
RUN yes | sdkmanager --licenses
RUN sdkmanager --install "platform-tools" "build-tools;33.0.0" "platforms;android-33" "ndk;22.1.7171670"
