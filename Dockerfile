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
RUN ./qt-unified-linux-x64-4.6.1-online.run --root /Qt --accept-licenses --confirm-command --accept-messages install qt.qt6.650.gcc_64 --email "${EMAIL}" --pw "${PW}" --accept-obligations

# Qt5
WORKDIR /Qt
RUN ./Tools/sdktool/libexec/qtcreator/sdktool addQt --id qt.qt5.5152.android --name "Qt 5.15.2 for Android" --type Qt4ProjectManager.QtVersion.Android --qmake /Qt/6.5.0/gcc_64/bin/qmake
