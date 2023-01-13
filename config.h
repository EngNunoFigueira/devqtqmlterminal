#ifndef CONFIG_H
#define CONFIG_H

#include <QObject>
#include "QFile"
#include "QString"

class config: public QObject
{
    Q_OBJECT
public:
    explicit config(QObject *parent = nullptr);

signals:

public slots:
    QString getGSPlt();
    QString getGSPlg();
    void setTerminalConfig();
    QString getServerIpAddress();
    QString getTerminalStatus();


private:
    //void process_line(QByteArray line );
    QString ipAddress;
    QString gpsLt;
    QString gpsLg;
    QString terminalStatus;
};

#endif // CONFIG_H
