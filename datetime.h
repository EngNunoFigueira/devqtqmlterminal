#ifndef DATETIME_H
#define DATETIME_H

#include <QObject>

class dateTime : public QObject
{
    Q_OBJECT
public:
    explicit dateTime(QObject *parent = nullptr);

signals:

public slots:
    QString getDateTime();
};

#endif // DATETIME_H
