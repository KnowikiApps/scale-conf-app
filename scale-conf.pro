QT += qml quick svg webview

CONFIG += c++11 qzxing_multimedia

QTPLUGIN+= qsqlite

# Default rules for deployment.
include(deployment.pri)


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

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    qml/qml.qrc \
    js/js.qrc \
    img/img.qrc \
    fonts/fonts.qrc

include(./QZXing/QZXing.pri)



HEADERS +=


android:{
    include(./android_openssl/openssl.pri)

    ANDROID_MIN_SDK_VERSION = 27
    ANDROID_TARGET_SDK_VERSION = 31
    ANDROID_VERSION_CODE = 1100
    ANDROID_VERSION_NAME = "1.10.0"
    ANDROID_PACKAGE_NAME = "com.knowikiapps.SCaLE"
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    ANDROID_PERMISSIONS += android.permission.INTERNET
    ANDROID_PERMISSIONS += android.permission.ACCESS_NETWORK_STATE
    ANDROID_PERMISSIONS += android.permission.CAMERA

    ICON = $$PWD/android/img/google-play-store/ic_launcher.png
}
