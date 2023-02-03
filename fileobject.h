#ifndef FILEOBJECT_H
#define FILEOBJECT_H

#include <QObject>

class FileObject : public QObject {

  Q_OBJECT
  Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
public:
  explicit FileObject(QObject *parent = 0);

  Q_INVOKABLE QString read();
  Q_INVOKABLE bool write(const QString &data);

  void setSource(const QString &source) { m_source = source; };
  QString source() { return m_source; };

signals:
  void sourceChanged(const QString &source);

private:
  QString m_source;
};

#endif // FILEOBJECT_H
