#include "watcher.h"

watcher::watcher(QObject *parent)
    : QObject{parent}
{}

void watcher::Changed(QString message)
{
    qInfo() << message;
}
