#ifndef SAMSUNGWATCH_H
#define SAMSUNGWATCH_H

#include <QObject>
#include <QDebug>
#include "samsungproduct.h"

class SamsungWatch : public SamsungProduct
{
    Q_OBJECT
public:
    explicit SamsungWatch(QObject *parent = nullptr);
    QString Color = "Metal gray";
    QString Shape = "oval";
    bool followHealth(bool);
    void Ominitrix();

signals:
};

#endif // SAMSUNGWATCH_H
