#include <QCoreApplication>
#include <QDebug>
#include <vector>
#include <QSharedPointer>
#include "toy.h"
#include "cat.h"

void test()
{
    int max = 5;
    QSharedPointer<toy> CatToy(new toy);
    std::vector<QSharedPointer<cat>> cats(max);
    for(int i= 0; i< max; i++)
    {
        cats[i].reset(new cat());
        cats[i]->play(CatToy);
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    test();
    return a.exec();
}
