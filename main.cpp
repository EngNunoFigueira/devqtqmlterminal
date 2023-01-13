#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "datetime.h"
#include "config.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("getTime", new dateTime);
    engine.rootContext()->setContextProperty("deviceConfig", new config);
    engine.load(url);

    return app.exec();
}
