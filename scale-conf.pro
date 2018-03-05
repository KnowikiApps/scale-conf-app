QT += qml quick svg webview widgets

CONFIG += c++11 qzxing_multimedia

QTPLUGIN+= qsqlite

# Default rules for deployment.
include(deployment.pri)

SOURCES += \
    cpp/main.cpp

DISTFILES += \
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
    img/img.qrc

include(QZXing/QZXing.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/android/ssl-libs/x86/libcrypto.so \
        $$PWD/android/ssl-libs/x86/libssl.so
}

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/android/ssl-libs/armeabi-v7a/libcrypto.so \
        $$PWD/android/ssl-libs/armeabi-v7a/libssl.so
}
