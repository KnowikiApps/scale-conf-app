import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper

Drawer {
    id: navDrawer
    width: 0.5 * window.width
    height: window.height
    //background: "#8cadc8"
    background: Rectangle{
        color: "transparent"
    }

    ColumnLayout{
        id: drawerLayout
        spacing: 0

        NavButton{
            id: announcements
            buttonText: "Announcements"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Home/Home.qml")
        }
        NavButton{
            id: schedule
            buttonText: "Schedule"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Schedule/Schedule.qml")
        }
        NavButton {
            id: mySchedule
            buttonText: "My Schedule"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/MySchedule/MySchedule.qml")
        }

        NavButton{
            id: contacts
            buttonText: "Contacts"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Contacts/Contacts.qml")
        }
        NavButton{
            id: exhibitors
            buttonText: "Exhibitors"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Exhibitors/Exhibitors.qml")
        }
        NavButton{
            id: speakers
            buttonText: "Speakers"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/Speakers/Speakers.qml")
        }
        NavButton{
            id: specialEvents
            buttonText: "Special Events"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/SpecialEvents/SpecialEvents.qml")
        }
        NavButton{
            id: qrScan
            buttonText: "Scan Badge QR Code"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/QrScan/QrScan.qml")
        }
        NavButton{
            id: campusMap
            buttonText: "Campus Map"
            onClicked: NavHelper.nav_tray_push("qrc:/pages/CampusMap/CampusMap.qml")
        }
    }
}
