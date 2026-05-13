#include "radio.h"

Radio::Radio(QObject *parent)
    : QObject{parent}
{}

void Radio::listen(int chanel, QString name, QString message)
{
    qInfo() << chanel << "-" << name << "-" << message;
}
