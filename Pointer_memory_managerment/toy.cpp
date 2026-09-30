#include "toy.h"

toy::toy(QObject *parent, QString name) :QObject(parent)
{
    setObjectName(name);
    qInfo() << this << "Constructor";
}


toy::~toy()
{
    qInfo() << this << "Deconstructor";
}

