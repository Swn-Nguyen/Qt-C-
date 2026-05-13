#include "source.h"

Source::Source(QObject *parent)
    : QObject{parent}
{}

void Source::test()
{
    emit MySignal("Send From Signal");
}
