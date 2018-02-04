import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper

Drawer {
    width: 0.5 * window.width
    height: window.height

    ColumnLayout{
        spacing: 2

        NavButton{
            id: schedule
            text: "Schedule"
            onClicked: NavHelper.nav_tray_push("qrc:/PgSchedule.qml")
        }
        NavButton {
            id: mySchedule
            text: "My Schedule"
        }

        NavButton{
            id: contacts
            text: "Contacts"
            onClicked: NavHelper.nav_tray_push("qrc:/PgContacts.qml")
        }
        NavButton{
            id: exhibitors
            text: "Exhibitors"
            onClicked: NavHelper.nav_tray_push("qrc:/PgExhibitors.qml")
        }
        NavButton{
            id: qrScan
            text: "Scan QR Code"
            onClicked: NavHelper.nav_tray_push("qrc:/PgQrScan.qml")
        }
    }
}
