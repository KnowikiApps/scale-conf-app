#include "fileio.h"

FileIO::FileIO(QObject *parent) : QObject(parent)
{

}

void FileIO::save(QString text, QString path){
    qDebug()<<"requested path to save to: "<<path;

    QString loc = QStandardPaths::locate(QStandardPaths::DownloadLocation, QString(), QStandardPaths::LocateDirectory) + "SCaLEContacts.csv";

    qDebug()<<"actually saving to location:"<<loc;

    QFile file(loc);
    if(file.open(QIODevice::ReadWrite)){
        QTextStream stream(&file);
        stream << text << endl;
    }else{
        qDebug()<<"file not saved";
    }
}
