import QtQuick 2.12
import QtQuick.Window 2.12
import "appCore.js" as AppCore


Window {
    id: root
    color: "#182825"
    visible: true
    //visibility: "FullScreen"
    width: 640
    height: 480
    title: qsTr("agMedica-Terminal")
    flags: Qt.SubWindow | Qt.Tool | Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowStaysOnTopHint

     Component.onCompleted:   AppCore.applicationInfo()
    // QML FUNCTIONS
     Timer {
         id: timer
         running: false
         repeat: false
         property var callback
         onTriggered: AppCore.gotoHomeMenu()
     }

     Timer {
         id: changeButtonBorderColor
         interval :1000
         repeat : true
         running : true
         triggeredOnStart : true
         onTriggered: AppCore.toggleButtonBoderColor()
     }


  // PAGE ONE BUTTONS OPTIONS
  Rectangle { id: pageOne
      Rectangle { id: layoutButtons
                  visible:true
        Rectangle {
            id: attgeral
            width: 250//root.width-490
            height: 250//root.height-330
            x:50
            y:root.height/3.5
            color: '#FF5733'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
                id: attLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 10
                text: "ATT GERAL"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                   AppCore.getServiceType="Att Geral"
                   AppCore.showPrintOptions();
                }
            }
        }
        Rectangle {
            id: consulta
            width: 200//root.width-540
            height: 200//root.height-380
            x:330
            y:root.height/3
            color: '#C70039'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
               id: consultaLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 12
                text: "Consulta"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AppCore.getServiceType="Consulta"
                    AppCore.showPrintOptions();
                }
            }
        }
        Rectangle {
            id: exame
            width: 200//root.width-540
            height: 200//root.height-380
            x:540
            y:root.height/3
            color: '#900C2F'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
               id: exameLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 12
                text: "Exame"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AppCore.getServiceType="Exame Medico"
                    AppCore.showPrintOptions();
                }
            }
        }
        Rectangle {
            id: goToPageTwo
            width: 200//root.width-540
            height: 200//root.height-380
            x:750
            y:root.height/3
            color: '#900C3F'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
               id: pageTwoLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 12
                color: 'white'
            }
            Image {
                id: nextItem
                source: "./next01.png"
                anchors.centerIn: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         AppCore.pageNavigator()
                    }
                }
            }

        }
      }

  }

 // PAGE TWO BUTTONS OPTIONS
 Rectangle { id: pageTwo
             visible:false

        Rectangle {
            id: resultados
            width: 250
            height: 250
            x:50
            y:root.height/3.5
            color: '#031B88'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
                id: resultadosLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 10
                text: "RESULTADOS"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                   AppCore.getServiceType="Resultados"
                   AppCore.showPrintOptions();
                }
            }
        }
        Rectangle {
            id: visita
            width: 200
            height: 200
            x:330
            y:root.height/3
            color: '#6096fd' //'#C70039'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
               id: visitaLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 12
                text: "Visita"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AppCore.getServiceType="Visita"
                    AppCore.showPrintOptions();
                }
            }
        }
        Rectangle {
            id: revisao
            width: 200
            height: 200
            x:540
            y:root.height/3
            color: '#AAB6FB' //'#900C2F'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
               id: revisaoLabel
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 12
                text: "Revisao"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AppCore.getServiceType="Revisao"
                    AppCore.showPrintOptions();
                }
            }
        }
        Rectangle {
            id: nextPage
            width: 200
            height: 200
            x:750
            y:root.height/3
            color: '#900C3F'
            border.color: "#39393A"
            border.width: 5
            radius: width*0.5
            Text {
               id: pageTwoText
                anchors.centerIn: parent
                font.family: "Helvetica"
                font.pointSize: 12
                color: 'white'
            }
            Image {
                id: nextPageseta
                source: "./next01.png"
                anchors.centerIn: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        AppCore.pageNavigator()
                    }
                }
            }

        }
      }

    // PRINT OPTION
 Rectangle {
     id:printOptions
     width: root.width;
     height: root.height;
     color: 'white'
     visible: false

    Rectangle {
        id: digitalTicket
        width: 230;
        height: 356;
        radius: width*0.2
        color: '#535150'
        x:90
        y:root.height/3.5
        Image {
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "../takePhotoIcon.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AppCore.nmbrOffOperationsRequested++
                    AppCore.showNowTicket()
                    AppCore.apiPostTicket()
                   }
            }
        }
    }
    Rectangle {
        id: printTicket
        width: 200;
        height: 356;
        radius: width*0.2
        color: '#F9F6EF'
        x:470
        y:root.height/3.5
        Image {
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "../printIcon.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AppCore.nmbrOffOperationsRequested++
                    AppCore.printingTicket()
                    AppCore.apiPostTicket()
                   }

            }
        }
    }

    // TAKE A PHOTO OF DIGITAL TIKET
    Rectangle {
        id: getTickePhoto
        width: root.width;
        height: root.height;
        color: 'white'
        visible: false

        Rectangle {
            id: personalTicket
            width: 250;
            height: 300;
            border.color: "black"
            border.width: 5
            anchors.alignWhenCentered: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: hospitalName
                x: 40
                y: 10
                text: qsTr("HOSPITAL SAN JOSE")
                font.family: "Helvetica"
                style: Text.Outline
                styleColor: "red"
                font.pointSize: 12
            }

            Image {
                id: hospitalLog
                anchors.alignWhenCentered: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../icon-ticket02.png"
            }
            Text {
                id: ticketCode
                y: 40
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("CSTA045")
                font.family: "Helvetica"
                style: Text.Raised
                styleColor: "#AAAAAA"
                font.pointSize: 24
            }
            Text {
                id: location
                x: 20
                y: 260
                text: qsTr("Mr. Figueira nº 48")
                font.family: "Arial"
                style: Text.Sunken
                styleColor: "#AAAAAA"
                font.pointSize: 8
            }
            Text {
                id: printDatetime
                x: 20
                y: 280
                text: qsTr("20/06/2020 12h33")
                font.family: "Arial"
                style: Text.Sunken
                styleColor: "#AAAAAA"
                font.pointSize: 8
            }
        }
    }
  }
}
