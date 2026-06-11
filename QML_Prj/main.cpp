#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>
#include <QRect>

#ifdef Q_OS_WIN
#include <windows.h>
#endif

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    // Thiết lập organization cho QSettings
    app.setApplicationName("QML_Prj");
    app.setOrganizationName("QML_Prj");
    app.setOrganizationDomain("qml-prj.local");

#ifdef Q_OS_WIN
    SetThreadExecutionState(ES_CONTINUOUS | ES_SYSTEM_REQUIRED);
#endif

    QScreen *screen = QGuiApplication::primaryScreen();
    QRect available = screen->availableGeometry();

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("availableWidth", available.width());
    engine.rootContext()->setContextProperty("availableHeight", available.height());

    engine.loadFromModule("QML_Prj", "Main");

    int result = app.exec();
    
#ifdef Q_OS_WIN
    SetThreadExecutionState(ES_CONTINUOUS);
#endif
    
    return result;
}