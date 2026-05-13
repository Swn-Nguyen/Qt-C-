#include <QCoreApplication>
#include <QDebug>
#include <QTextStream>
#include "server.h"
#include "client.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    Client Son12;
    Server* Servers[3];
    Servers[0] = new Server(&Son12, "FPT", 0);
    Servers[1] = new Server(&Son12, "VNPT", 1);
    Servers[2] = new Server(&Son12, "Viettel", 2);

    Client::connect(&Son12, &Client::Quit, &a, &QCoreApplication::quit, Qt::QueuedConnection);

    do
    {
        qInfo()<< "Enter Connect, Disconnect, Test or Quit";
        QTextStream qtin(stdin);
        QString line = qtin.readLine().trimmed().toUpper();

        if(line == "CONNECT")
        {
            for(int i = 0; i < 3; i++ )
            {
                Server* Sv = Servers[i];
                QObject::connect(&Son12, &Client::CallAPI, Sv, &Server::ListenAPI, Qt::UniqueConnection);
                QObject::connect(Sv, &Server::Send, &Son12, &Client::Feedback, Qt::UniqueConnection);
                Son12.CallAPI(Sv->name, Sv->Ids, "TestConnect: run API");
                Sv->Send("Run Test connect", Sv->Ids, Sv->name);
                qInfo() << "\n";
            }
        }
        if(line == "DISCONNECT")
        {
            for(int i = 0; i < 3; i++)
            {
                Server* Sv = Servers[i];
                QObject::disconnect(&Son12, &Client::CallAPI, Sv, &Server::ListenAPI);
                QObject::disconnect(Sv, &Server::Send, &Son12, &Client::Feedback);
                Son12.CallAPI(Sv->name, Sv->Ids, "Test disconnect: run API");
                Sv->Send("Run Test connect", Sv->Ids, Sv->name);
            }
        }
        if(line == "TEST")
        {
            for(int i = 0; i < 3; i++)
            {
                Server* Sv = Servers[i];
                Sv->TestPing("Test ping server");
            }
            qInfo()<< "Test complete";
        }
        if(line == "QUIT")
        {
            Son12.Quit();
            break;
        }
    }
    while(true);


    return a.exec();
}
