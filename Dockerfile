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

