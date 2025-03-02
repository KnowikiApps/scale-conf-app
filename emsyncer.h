#ifndef EMSYNCER_H
#define EMSYNCER_H

#include <QObject>
#include <QQmlEngine>
\
class EmSyncer : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit EmSyncer(QObject *parent = nullptr);
    Q_INVOKABLE void call_EM_Sync();
};

#endif // EMSYNCER_H
