#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QStandardPaths>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class FileIO : public QObject
{
    Q_OBJECT

public:
    explicit FileIO(QObject *parent = nullptr);
    Q_INVOKABLE void save(QString text, QString path);
};

#endif // FILEIO_H
