#include "myobject.h"

MyObject::MyObject(QObject *parent, QString nameObject)
    : QObject{parent}
{
    setObjectName(nameObject);
    qInfo() << "Constructed" << this;
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

MyObject::~MyObject()
{
    qInfo() << "Deconstructed" << this;
}

void MyObject::on_valueChanged()
{
    qInfo() << "m_value: "<< m_value;
}

