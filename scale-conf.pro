QT += qml quick svg webview

CONFIG += c++11 qzxing_multimedia

QTPLUGIN+= qsqlite

SOURCES += \
    cpp/main.cpp

DISTFILES += \
    qml/main.qml \
    js/database.js

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    qml/qml.qrc \
    js/js.qrc \
    img/img.qrc

include(QZXing/QZXing.pri)
