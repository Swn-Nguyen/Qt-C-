#include "cat.h"

cat::cat(QObject *parent, QString name)
    : QObject{parent}
{
    setObjectName(name);
    qInfo() << this << "Constructor";
}

cat::~cat()
{
    qInfo() << this << "Deconstructor";
}

void cat::play(QSharedPointer<toy> Toy)
{
    m_toy.swap(Toy);
    qInfo() << this << "Play with" << m_toy.data();
}
