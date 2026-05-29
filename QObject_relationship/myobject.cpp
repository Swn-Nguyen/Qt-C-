#include "myobject.h"

MyObject::MyObject(QObject *parent)
    : QObject{parent}
{
    QObject::connect(this, &MyObject::informationChanged, this, &MyObject::on_informationChanged);
}

void MyObject::on_informationChanged()
{
    qInfo() << "m_information member variable:"<< m_information;
}

int MyObject::value() const
{
    return m_value;
}

void MyObject::setValue(int newValue)
{
    if (m_value == newValue)
        return;
    m_value = newValue;
    emit valueChanged();
}

void MyObject::on_valueChanged()
{
    qInfo() << "m_value: "<< m_value;
}

