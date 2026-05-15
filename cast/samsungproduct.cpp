#include "samsungproduct.h"

SamsungProduct::SamsungProduct(QObject *parent)
    : QObject{parent}
{}

void SamsungProduct::function(QString func)
{
    qInfo() << "Function(product) call: "<< func;
}

void SamsungProduct::Warranty(bool inTime)
{
    if(inTime)
        qInfo() << "Device can warranty";
    else
        qInfo() << "Device no longer warranty";
}


