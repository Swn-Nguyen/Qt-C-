#ifndef MYOBJECT_H
#define MYOBJECT_H

#include <QObject>
#include <QDebug>

class MyObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString information MEMBER m_information NOTIFY informationChanged)
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged FINAL)

public:
    explicit MyObject(QObject *parent = nullptr);
    int value() const;
    void setValue(int newValue);

signals:
    void informationChanged();
    void valueChanged();


public slots:
    void on_informationChanged();
    void on_valueChanged();
private:
    QString m_information;
    int m_value;

};

#endif // MYOBJECT_H
