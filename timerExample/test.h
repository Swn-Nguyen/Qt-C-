#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QTimer>
#include <QDebug>
#include <QCoreApplication>

class Test : public QObject
{
    Q_OBJECT
    QTimer m_timer;
    int m_count;
public:
    explicit Test(QObject *parent = nullptr);

signals:
    void testFinished();
public slots:
    void timeOut();

};

#endif // TEST_H
