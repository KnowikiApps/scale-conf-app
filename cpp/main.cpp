#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "shareutils.h"
#include <QZXing.h>
#include <QDebug>
#include <QtWebView/QtWebView>



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<ShareUtils> ("com.lasconic", 1, 0, "ShareUtils");


    QtWebView::initialize();

    QZXing::registerQMLTypes();


    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    qDebug()<<"Local Storage DB Location: "<<engine.offlineStoragePath();//show where the database files are located

    return app.exec();
}
