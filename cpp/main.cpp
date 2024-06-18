#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QZXing.h>
#include <QDebug>
#include <QtWebView/QtWebView>

#ifdef Q_OS_ANDROID
#include "shareutils.h"
#endif


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

#ifdef Q_OS_ANDROID
    qmlRegisterType<ShareUtils> ("com.lasconic", 1, 0, "ShareUtils");
#endif

    QtWebView::initialize();

    QZXing::registerQMLTypes();


    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    qDebug()<<"Local Storage DB Location: "<<engine.offlineStoragePath();//show where the database files are located

    return app.exec();
}
