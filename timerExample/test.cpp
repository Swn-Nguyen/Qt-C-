#include "test.h"

Test::Test(QObject *parent)
    : QObject{parent}
{
    m_count = 0;
    connect(&m_timer, &QTimer::timeout, this, &Test::timeOut);
    QObject::connect(this, &Test::testFinished, qApp, &QCoreApplication::quit);
    m_timer.setInterval(1000);
    m_timer.start();

}

void Test::timeOut()
{
    qInfo() << m_count;
    m_count++;
    if(m_count >= 10)
    {
        m_timer.stop();
        emit testFinished();
    }
}



