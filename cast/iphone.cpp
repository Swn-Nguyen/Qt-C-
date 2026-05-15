#include "iphone.h"

Iphone::Iphone(QObject *parent)
    : QObject{parent}
{}

void Iphone::airDrop()
{
    qInfo() << "Starting airdrop";
}

void Iphone::faceTime()
{
    qInfo() << "Starting facetime";
}
