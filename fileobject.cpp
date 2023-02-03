#include "fileobject.h"

#include <QFile>
#include <QTextStream>
#include <QUrl>

FileObject::FileObject(QObject *parent) : QObject(parent) {}

QString FileObject::read() {
  QUrl url(m_source);
  QString content;
  QFile file(url.toLocalFile());
  if (file.open(QIODevice::ReadOnly)) {
    content = file.readAll();
    file.close();
  }

  return content;
}

bool FileObject::write(const QString &data) {
  QFile file(m_source);
  if (file.open(QFile::WriteOnly | QFile::Truncate)) {
    QTextStream out(&file);
    out << data;
    file.close();
    return true;
  }
  return false;
}
