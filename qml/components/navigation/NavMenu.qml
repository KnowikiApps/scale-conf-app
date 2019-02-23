import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper

Drawer {
    width: 0.5 * window.width
    height: window.height

    ColumnLayout{
        spacing: 2

        Rectangle {
            width: parent.width
            height: width/3
            Image {
                id: banner
                source: "qrc:/img/HomePageBanner.svg"
                width: 123
                height: parent.height
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: NavHelper.nav_tray_push("qrc:/pages/Home/Home.qml")
            }
        }

        NavButton{
            id: schedule
            text: "Schedule"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Schedule/Schedule.qml")
        }
        NavButton {
            id: mySchedule
            text: "My Schedule"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/MySchedule/MySchedule.qml")
        }

        NavButton{
            id: contacts
            text: "Contacts"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Contacts/Contacts.qml")
        }
        NavButton{
            id: exhibitors
            text: "Exhibitors"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Exhibitors/Exhibitors.qml")
        }
        NavButton{
            id: speakers
            text: "Speakers"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Speakers/Speakers.qml")
        }
        NavButton{
            id: qrScan
            text: "Scan Badge QR Code"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/QrScan/QrScan.qml")
        }
    }
}
