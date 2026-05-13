#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QDebug>

class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);
    ~Test();
    void doStuff();
    int DogAge(int age);
    int CatAge(int age);
signals:
};

#endif //
