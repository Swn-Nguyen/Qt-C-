#include "server.h"


Server::Server(QObject *parent, QString name, int Ids)
{
    qInfo() << this << "Server Constructor";
    this->name = name;
    this->Ids = Ids;
    qInfo() << "Create server name: "<< name<< " ID: "<< Ids ;
}

Server::~Server()
{
    qInfo() << this << "Server Destructor";
}

void Server::ListenAPI(QString NameServer, int IDs, QString API)
{
    if(IDs != this->Ids)
    {
        return;
    }
    qInfo() << NameServer << " "<< IDs << "received "<< API;
}

void Server::TestPing(QString Message)
{
    emit Send(Message, Ids, name);
}

