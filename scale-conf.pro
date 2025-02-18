QT += qml quick svg webview

CONFIG += c++11 qzxing_multimedia qtquickcompiler

QTPLUGIN+= qsqlite

# Default rules for deployment.
# include(deployment.pri)


SOURCES += \
    contactexporter.cpp \
    cpp/main.cpp

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    qml/main.qml \
    js/database.js \
    android/res/values/libs.xml \

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    qml/qml.qrc \
    js/js.qrc \
    img/img.qrc \
    fonts/fonts.qrc

#include(./QZXing/QZXing.pri)


HEADERS += \
    contactexporter.h






android{
    #ShareUtils - Sharing related functionality
    HEADERS += shareutils.h

    SOURCES += shareutils.cpp

    # END ShareUtils block
    # include(./android_openssl/openssl.pri)

    ANDROID_MIN_SDK_VERSION = 27
    ANDROID_TARGET_SDK_VERSION = 33
#    ANDROID_VERSION_CODE = 1131
#    ANDROID_VERSION_NAME = "1.13.1"
    ANDROID_PACKAGE_NAME = "com.knowikiapps.SCaLE"
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    ANDROID_PERMISSIONS += android.permission.INTERNET
    ANDROID_PERMISSIONS += android.permission.ACCESS_NETWORK_STATE
    ANDROID_PERMISSIONS += android.permission.CAMERA

#   ICON = $$PWD/android/img/google-play-store/ic_launcher.png

    QT += androidextras
    OTHER_FILES += android/src/com/lasconic/QShareUtils.java
    SOURCES += android/androidshareutils.cpp
    HEADERS += android/androidshareutils.h
    OTHER_FILES += android/res/xml/filepaths.xml
}

ios {
    #custom plist file for bundle
    QMAKE_INFO_PLIST = ios/Info.plist

    #copy custom plist file into build directory
    copydata.commands = $(COPY_DIR) $$PWD/ios/Info.plist $$OUT_PWD
    first.depends = $(first) copydata
    export(first.depends)
    export(copydata.commands)
    QMAKE_EXTRA_TARGETS += first copydata

    #add image assets to bundle
    QMAKE_ASSET_CATALOGS = $$PWD/ios/Images.xcassets
    QMAKE_ASSET_CATALOGS_APP_ICON = "AppIcon"
    QMAKE_ASSET_CATALOGS_LAUNCH_IMAGE = "LaunchImage"
    QMAKE_ASSET_CATALOGS_LAUNCH_SCREEN = ""
    QMAKE_TARGET_BUNDLE_PREFIX = "com.knowikiapps.SCaLE"
}

