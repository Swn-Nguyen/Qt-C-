#include "person.h"

Person::Person(QObject *parent, QString firstname, QString lastname)
    : QObject{parent}
{

    m_firstname = firstname;
    m_lastname = lastname;
    qInfo() << "Constructor: " << this;
}

Person::~Person()
{
    qInfo() << "Deconstructor: " << this;
}


QStringView Person::display()
{
    QString objInfo = m_firstname + m_lastname;
    QStringView viewStr(objInfo);
    return viewStr;
}


