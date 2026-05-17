#include "consumer.h"

Consumer::Consumer(QObject *parent)
    : QObject{parent}
{}

void Consumer::feedBack()
{
    Producer* p = qobject_cast<Producer*>(this-> sender());
    if(!p)
        return;
    qInfo() <<"Sender" <<p << p->objectName();
}
