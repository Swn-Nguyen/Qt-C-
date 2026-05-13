#ifndef STATION_H
#define STATION_H

#include <QObject>
#include <QDebug>

class Station : public QObject
{
    Q_OBJECT

public:
    explicit Station(QObject *parent = nullptr, int chanel = 0, QString name = "Unknown");
    QString name;
    int channel;

signals:
    void send(int chanel, QString name, QString message);

public slots:
    void broadcast(QString message);
};

#endif // STATION_H
