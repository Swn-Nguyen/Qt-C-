#ifndef RADIO_H
#define RADIO_H

#include <QObject>
#include <QDebug>

class Radio : public QObject
{
    Q_OBJECT
public:
    explicit Radio(QObject *parent = nullptr);


signals:
    void quit();

public slots:
    void listen(int chanel, QString name, QString message);
};

#endif // RADIO_H
