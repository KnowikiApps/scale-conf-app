#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDebug>
#include <QtWebView/QtWebView>
#include "SBarcodeScanner.h"


// #ifdef Q_OS_ANDROID
// #include "shareutils.h"
// #endif


int main(int argc, char *argv[])
{
    // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

// #ifdef Q_OS_ANDROID
//     qmlRegisterType<ShareUtils> ("com.lasconic", 1, 0, "ShareUtils");
// #endif


    QtWebView::initialize();


    qmlRegisterType<SBarcodeScanner>("com.scythestudio.scodes", 1, 0, "SBarcodeScanner");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Scaleconf", "Main");



    // engine.load(QUrl(QLatin1String("main.qml")));

    qDebug()<<"Local Storage DB Location: "<<engine.offlineStoragePath();//show where the database files are located

    return app.exec();
}
