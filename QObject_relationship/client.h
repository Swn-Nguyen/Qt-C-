#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QDebug>

class Client : public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = nullptr);
    ~Client();

signals:
    void Quit();
    void CallAPI(QString NameServer, int IDs, QString NameAPI);

public slots:
    void Feedback(QString Message, int Ids, QString NameServer);
    void RunAPI(QString NameServer, int IDs, QString NameAPI);
};

#endif //
