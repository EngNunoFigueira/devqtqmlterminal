#include "config.h"
#include <QFile>


#define  GPSLT    6
#define STATUS    6
#define IPADDRESS 10

config::config(QObject *parent) :
QObject(parent)
{
  setTerminalConfig();
}

void config::setTerminalConfig()
{

    QString referencePointOfGpsLat="GPS-Lt";
    QString referencePointOfGpsLong="GPS-Lg";
    QString referencePointForStatus="STATUS";
    QString referencePointOfiPAddressPosition="IP-ADDRESS";

    QFile file("/opt/mpainel/config/terminal.cfg");
      if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
          return;

    QString getConfig = file.readLine();  // IP-ADDRESS192.168.100.102GPS-Lt3455865GPS-Lg908457STATUSOK
    file.close();

    int indexFront=getConfig.indexOf("IP-ADDRESS");
    int indexBackend=getConfig.indexOf("GPS-Lt");
    if(indexFront !=-1 && indexBackend != -1)
       ipAddress=getConfig.mid(10,(indexBackend-IPADDRESS));

     indexFront=getConfig.indexOf("GPS-Lt");
     if(indexFront !=-1 && indexBackend != -1)
        gpsLt=getConfig.mid(indexFront+GPSLT,7);

     indexBackend=getConfig.indexOf("GPS-Lg");
     if(indexBackend != -1)
        gpsLg=getConfig.mid(indexBackend+GPSLT, 6);

     indexFront=getConfig.indexOf("STATUS");
     if(indexFront !=-1)
        terminalStatus=getConfig.mid(indexFront+STATUS, 2);
}

QString config::getGSPlt()
{
    return gpsLt;
}
QString config::getGSPlg()
{
    return gpsLg;
}
QString config::getServerIpAddress()
{
    return ipAddress;
}
QString config::getTerminalStatus()
{
    return terminalStatus;
}
