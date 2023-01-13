#include "datetime.h"
#include <QDateTime>
#include <QString>

dateTime::dateTime(QObject *parent) :
QObject(parent)
{
}
QString dateTime::getDateTime()
{
  return QDateTime::currentDateTime().toString("dd/MM/yyyy hh:mm:ss.zzz");
}
