#include <QCoreApplication>
#include <QDebug>
#include <iostream>
#include "test.h"

/*
void test(QString val)
{
    qInfo()<< &val<< "Size: "<< val.length(); //copy- Stack

}
*/

void test_ptr(QString *ptr)
{
    qInfo()<< "Point to:" << ptr; //pointer- Stack
    qInfo()<< "Address of pointer:" <<&ptr;
    qInfo()<< "Val:" <<  *ptr;
    qInfo()<< Q_FUNC_INFO;
}


void test_uniPtr()
{
    std::unique_ptr<Test> t(new Test());
    t->doStuff();
}

Test* GetAge()
{
    Test *c = new Test();
    return c;

}

int DogYears(int age, Test *Ob)
{
    return Ob->DogAge(age);
}

int CatYears(int age, Test *Ob)
{
    return Ob->CatAge(age);
}


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    QString name = "Ng.ThanhSon"; //Stack - C++ managerment
    //QString *name_ptr = new QString("ng.thanhson"); //Heap - we manage this
    int age=0;
    Test *c = GetAge();
    qInfo() << "Input your age:";
    std::cin >> age;
    qInfo() << "Dog ages: " << DogYears(age, c);
    qInfo() << "Cat ages: " << CatYears(age, c);
    delete c;
    return a.exec();
}
