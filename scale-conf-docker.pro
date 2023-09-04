DESTDIR = /work/build

QT += qml quick svg webview

CONFIG += c++11 qzxing_multimedia qtquickcompiler

QTPLUGIN+= qsqlite

ANDROID_ABIS='armeabi-v7a arm64-v8a x86 x86_64'
ANDROID_MIN_SDK_VERSION = 27
ANDROID_TARGET_SDK_VERSION = 31
ANDROID_VERSION_CODE = 1131
ANDROID_VERSION_NAME = "1.13.1"
ANDROID_PACKAGE_NAME = "com.knowikiapps.SCaLE"
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
ANDROID_PERMISSIONS += android.permission.INTERNET
ANDROID_PERMISSIONS += android.permission.ACCESS_NETWORK_STATE
ANDROID_PERMISSIONS += android.permission.CAMERA

include(./QZXing/QZXing.pri)
include(./android_openssl/openssl.pri)

HEADERS +=

SOURCES += \
    cpp/main.cpp

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    qml/main.qml \
    js/database.js \
    android/res/values/libs.xml \
    android/build.gradle \

RESOURCES += \
    qml/qml.qrc \
    js/js.qrc \
    img/img.qrc \
    fonts/fonts.qrc

# print all qmake vars for debugging purposes
for(var, $$list($$enumerate_vars())) {
    message($$var "-> " $$eval($$var))
}



