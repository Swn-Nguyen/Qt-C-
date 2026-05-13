#include <QCoreApplication>
#include <QDebug>
#include <QTextStream>
#include <QVariant>
#include "test.h"
#include "watcher.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    test tester;
    watcher destination;
    QObject::connect(&tester, &test::messageChanged, &destination, &watcher::Changed);

    // tester.setProperty("message", QVariant("Hello world"));
    // tester.setMessage("Call from set message");
    bool isStatic = tester.setProperty("thuoc_tinh_ma", QVariant("Toi la ma"));

    // Kiểm tra xem nó có được lưu không?
    qInfo() << "Is property static (declared in Q_PROPERTY)? :" << isStatic;
    qInfo() << "Gia tri cua thuoc_tinh_ma :" << tester.property("thuoc_tinh_ma").toString();

    // Liệt kê toàn bộ các thuộc tính động đang bám trên object này
    qInfo() << "Danh sach Dynamic Properties:";
    for(const QByteArray &name : tester.dynamicPropertyNames()) {
        qInfo() << " -" << name;
    }

    return QCoreApplication::exec();
}
