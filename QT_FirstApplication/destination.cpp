#include "destination.h"

Destination::Destination(QObject *parent)
    : QObject{parent}
{}

void Destination::MySlot(QString message)
{
    qInfo() << message << "receive from slot";
}
