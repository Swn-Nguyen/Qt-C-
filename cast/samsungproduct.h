#ifndef SAMSUNGPRODUCT_H
#define SAMSUNGPRODUCT_H

#include <QObject>
#include <QDebug>

class SamsungProduct : public QObject
{
    Q_OBJECT
public:
    explicit SamsungProduct(QObject *parent = nullptr);
    void function(QString);
    void Warranty(bool);

signals:
};

#endif // SAMSUNGPRODUCT_H
