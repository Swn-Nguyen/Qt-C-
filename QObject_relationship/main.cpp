#include <QCoreApplication>
#include <QDebug>
#include <QTextStream>
//#include <QMetaObject>
#include <QMetaProperty>
#include "myobject.h"
// #include "server.h"
// #include "client.h"

MyObject* makeObject()
{
    MyObject *root = new MyObject(nullptr, "root");

    for(int P= 0; P< 5; P++)
    {
        MyObject *pObj = new MyObject(root, "Parent-" + QString::number(P));
        for(int C= 0; C< 3; C++)
        {
            MyObject *cObj = new MyObject(pObj, "Parent-" + QString::number(P) + " Child-" + QString::number(C));
            for(int S= 0; S< 3; S++)
            {
                MyObject *sObj = new MyObject(cObj, "Parent-" + QString::number(P) + " Child-" + QString::number(C) + " Sub-" + QString::number(S));
                Q_UNUSED(sObj);
            }
        }
    }

    return root;
}

void printTree(MyObject* root, int level = 0)
{
    if(root->children().length()== 0) return;
    QString lead = "-";
    lead.fill('-', level* 5);

    foreach (QObject* obj, root->children()) {
        MyObject* child= qobject_cast<MyObject*>(obj);
        if(!child) return;
        qInfo() << lead << child;
        printTree(child, level+ 1);
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    MyObject *rObj = makeObject();
    printTree(rObj);
    delete rObj;
    return a.exec();
}
