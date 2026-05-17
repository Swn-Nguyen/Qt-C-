#include <QCoreApplication>
#include <QTimer>
#include <QDebug>
#include <QTextStream>
#include <iostream>
bool doDiv(int Max)
{
    try {
        int val;
        qInfo() << "Enter a number";
        std::cin >> val;
        
        // Kiểm tra xem input có thành công không
        if(std::cin.fail()) {
            std::cin.clear();
            std::cin.ignore(10000, '\n');
            throw std::runtime_error("Invalid input - not an integer");
        }
        
        if(val == 0)
        {
            throw std::runtime_error("Divide by zero");
        }
        int ret = Max/val;
        qInfo() << "Return: " << ret;
    } catch (std::exception const& e) {
        qWarning() << "Caught an exception:" << e.what();
        return false;
    } catch (...)
    {
        qDebug() << "Unknown error";
        return false;
    }
    return true;
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Set up code that uses the Qt event loop here.
    // Call QCoreApplication::quit() or QCoreApplication::exit() to quit the application.
    // A not very useful example would be including
    // #include <QTimer>
    // near the top of the file and calling
    // QTimer::singleShot(5000, &a, &QCoreApplication::quit);
    // which quits the application after 5 seconds.

    // If you do not need a running Qt event loop, remove the call
    // to QCoreApplication::exec() or use the Non-Qt Plain C++ Application template.
    int max = 44;
    do {

    } while (doDiv(max));

    QTimer::singleShot(100, &a, &QCoreApplication::quit);
    return QCoreApplication::exec();
}
