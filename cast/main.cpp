#include <QCoreApplication>
#include <QDebug>
#include <QTextStream>
#include "samsungproduct.h"
#include "samsungwatch.h"
#include "iphone.h"

void chkInfo(SamsungProduct* ss, bool wrt)
{
    ss->Warranty(wrt);
    ss->function("call");
}

void watchPro(SamsungWatch* ss, bool wrt)
{
    ss->Warranty(wrt);
    ss->function("call");
    ss->Ominitrix();
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    double value = 9.5;
    //int age = value; //implicit cast should not be trusted
    int age = (double)value; //explicit cast should be trusted
    qInfo() << age;

    //dynamic cast
    // SamsungWatch* Watch8 = new SamsungWatch(&a);
    // chkInfo(Watch8, true); //uncorrect way

    // SamsungProduct* prod = dynamic_cast<SamsungProduct*> (Watch8);
    // if(prod)
    //     chkInfo(prod, true);

    // Iphone* I16PM = new Iphone(&a);
    // SamsungProduct* wtf = dynamic_cast<SamsungProduct*> (I16PM);
    // if(!wtf)
    //     qInfo() << "Can't cast";
    // qInfo() << wtf ;

    //static cast
    SamsungProduct* prod = new SamsungProduct(&a);
    qInfo() << prod;
    //watchPro((SamsungWatch*)prod, true);
    SamsungWatch* proWatch = static_cast<SamsungWatch*> (prod);
    qInfo() << proWatch;
    if(proWatch)
        watchPro(proWatch, true);
    QString Str;
    Str = "Hel.lo.";
    Str += "Worl.d";
    qInfo() << Str.split('.');
    return QCoreApplication::exec();
}
