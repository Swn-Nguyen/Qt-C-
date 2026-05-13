#include "test.h"

QString test::message() const
{
    return m_message;
}

void test::setMessage(const QString &newMessage)
{
    m_message = newMessage;
    emit messageChanged(m_message);
}

test::test(QObject *parent)
    : QObject{parent}
{}
