#include <QCoreApplication>
#include <QSettings>
#include <QDebug>

void info(QSettings &setting)
{
    qInfo() << "File: " << setting.fileName();
    qInfo() << "Keys: " << setting.allKeys();
}

void save(QSettings &setting, QString group, QString key, QString val)
{
    setting.beginGroup(group);
    setting.setValue(key, val);
    setting.endGroup();
    qInfo() << setting.status();
    qInfo() << "Saved";
}

void load(QSettings &setting, QString group, QString key)
{
    info(setting);
    setting.beginGroup(group);
    if(!setting.contains(key))
    {
        qWarning() << "Error: Does not contain key";
        setting.endGroup();
        return;
    }
    qInfo() << setting.value(key).toString();
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QCoreApplication::setApplicationName("Settings test");
    QCoreApplication::setOrganizationName("Samsung R&D");
    QCoreApplication::setOrganizationDomain("samsung.com");

    QSettings setting(QCoreApplication::organizationName(), QCoreApplication::applicationName());
    save(setting, "Human", "Son", "man");
    save(setting, "Pet", "Cat", "male");
    save(setting, "Jewelry", "Ring", "Silver");

    load(setting, "Human", "Son");
    load(setting, "Pet", "Dog");
    load(setting, "Jewerly", "Necklace");
    // Set up code that uses the Qt event loop here.
    // Call QCoreApplication::quit() or QCoreApplication::exit() to quit the application.
    // A not very useful example would be including
    // #include <QTimer>
    // near the top of the file and calling
    // QTimer::singleShot(5000, &a, &QCoreApplication::quit);
    // which quits the application after 5 seconds.

    // If you do not need a running Qt event loop, remove the call
    // to QCoreApplication::exec() or use the Non-Qt Plain C++ Application template.

    return QCoreApplication::exec();
}
