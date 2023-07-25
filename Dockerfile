FROM ubuntu:22.04
LABEL description="This is a custom Docker Image for building android version"
#ubuntu setup
RUN apt update
#Qt setup
RUN apt-get --assume-yes install qtbase5-dev qt5-qmake
