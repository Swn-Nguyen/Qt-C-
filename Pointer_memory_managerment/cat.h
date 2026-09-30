#ifndef CAT_H
#define CAT_H

#include <QObject>
#include <QDebug>
#include <QSharedPointer>
#include "toy.h"

class cat : public QObject
{
    Q_OBJECT
public:
    explicit cat(QObject *parent = nullptr, QString name = "");
    ~cat();
    void play(QSharedPointer<toy> Toy);

signals:

private:
    QSharedPointer<toy> m_toy;
};

#endif // CAT_H
