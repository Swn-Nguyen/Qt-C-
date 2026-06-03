#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>
#include <QRect>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QScreen *screen = QGuiApplication::primaryScreen();
    QRect available = screen->availableGeometry();

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty(
        "availableWidth",
        available.width());

    engine.rootContext()->setContextProperty(
        "availableHeight",
        available.height());

    engine.loadFromModule("QML_Prj", "Main");

    return app.exec();
}