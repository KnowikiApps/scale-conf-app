#include "contactexporter.h"

#include <QFile>
#include <QTextStream>
#include <QStandardPaths>
#include <QDebug>
#include <QDir>



void lowLevelWriter(const QString &vals) {

    auto path {QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation) + "/csv/"};

    auto fileName{"contacts.csv"};

    QDir temp{path};

    if (!temp.exists()) {
        qDebug() << "Warning, shareable folder does not exist: " << path << "\n";
        QDir("").mkdir(path);
    }

    QFile file(path + fileName);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)){
        qDebug() << "Something broke while trying to write the file\n";
        qDebug() << "You tried writing: " << fileName << "\n";
        return;
    }

    QTextStream out(&file);
    out << vals;
    qDebug() << "Wrote data";
    file.close();

}

QString getFilePath() {

    auto path {QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation) + "/csv/"};

    auto fileName{"contacts.csv"};

    return path + fileName;

}
