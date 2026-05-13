#include "test.h"

Test::Test(QObject *parent) :QObject(parent)
{
    qInfo() << this << "Constructor";
}

Test::~Test()
{
    qInfo() << this << "Deconstructor";
}

void Test::doStuff()
{
    qInfo() << this << Q_FUNC_INFO;
}

int Test::DogAge(int age)
{
    return age*7;
}

int Test::CatAge(int age)
{
    return age*5;
}
