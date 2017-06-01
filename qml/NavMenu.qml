import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Drawer {
    width: 0.5 * window.width
    height: window.height

    ColumnLayout{
        spacing: 2

        NavButton{
            id: schedule
            text: "Schedule"
            onClicked: pages.push("qrc:/PgSchedule.qml")
        }
        NavButton{
            id: contacts
            text: "Contacts"
            onClicked: pages.push("qrc:/PgContacts.qml")
        }
        NavButton{
            id: messages
            text: "Messges"
            onClicked: pages.push("qrc:/PgMessages.qml")
        }
        NavButton{
            id: qrScan
            text: "Scan QR Code"
            onClicked: pages.push("qrc:/PgQrScan.qml")
        }
    }
}
