QT += qml quick svg webview

CONFIG += c++11 qzxing_multimedia

QTPLUGIN+= qsqlite

# Default rules for deployment.
include(deployment.pri)


SOURCES += \
    cpp/main.cpp

DISTFILES += \
    android/build.gradle \
    android/gradle.properties \
    android/gradlew.bat \
    qml/main.qml \
    js/database.js \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    qml/qml.qrc \
    js/js.qrc \
    img/img.qrc \
    fonts/fonts.qrc

include(QZXing/QZXing.pri)

#include(android_openssl/openssl.pri)

#ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

ANDROID_MIN_SDK_VERSION = 30
ANDROID_TARGET_SDK_VERSION = 30
ANDROID_VERSION_CODE = 191
ANDROID_VERSION_NAME = "1.9.1"
ANDROID_PACKAGE_NAME = "com.knowikiapps.SCaLE"

HEADERS +=

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
