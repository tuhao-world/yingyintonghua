#include "fileobject.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);

  // QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
#endif

  //设置此参数会导致窗口缩放掉帧，什么原因？
  // QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);

  //设置此参数，窗口缩放流畅，什么原因？
  QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  const QUrl url(QStringLiteral("qrc:/main.qml"));

  //注册c++对象
  qmlRegisterType<FileObject>("FileObject", 1, 0, "FileObject");

  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);

  engine.load(url);

  return app.exec();
}
