#ifndef IPHONE_H
#define IPHONE_H

#include <QObject>
#include <qDebug>

class Iphone : public QObject
{
    Q_OBJECT
public:
    explicit Iphone(QObject *parent = nullptr);
    void airDrop();
    void faceTime();

signals:
};

#endif // IPHONE_H
