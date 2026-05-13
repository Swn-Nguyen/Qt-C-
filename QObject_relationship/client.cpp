#include "client.h"

Client::Client(QObject *parent)
    : QObject{parent}
{
    qInfo() << this << "Client Constructor";
}

Client::~Client()
{
    qInfo() << this << "Client Destructor";
}

void Client::Feedback(QString Message, int Ids, QString NameServer)
{
    qInfo() << "Server " << NameServer << " " << "Ids: "<< Ids;
    qInfo() << "Message: " << Message;
}

void Client::RunAPI(QString NameServer, int IDs, QString NameAPI)
{
    emit CallAPI(NameServer, IDs, NameAPI);
}
