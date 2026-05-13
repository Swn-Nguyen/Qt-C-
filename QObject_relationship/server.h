#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QDebug>

class Server : public QObject
{
    Q_OBJECT
public:
    QString name;
    int Ids;
    explicit Server(QObject *parent = nullptr, QString name = "Unknown", int Ids = 0);
    ~Server();

signals:
    void Send(QString Message, int Ids, QString NameServer);

public slots:
    void ListenAPI(QString NameServer, int IDs, QString API);
    void TestPing(QString Message);
};

#endif //
