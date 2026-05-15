#include "samsungwatch.h"

SamsungWatch::SamsungWatch(QObject *parent)
    : SamsungProduct{parent}
{}

bool SamsungWatch::followHealth(bool support)
{
    return support;
}

void SamsungWatch::Ominitrix()
{
    qInfo() << "Humungousaur";
}
