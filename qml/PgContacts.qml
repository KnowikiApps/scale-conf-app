import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import "qrc:/js/database.js" as DB
import "qrc:/js/nav.js" as NavHelper

Rectangle {
    id: pgContacts
    width: window.width
    height: window.height

    Row {
        id: buttonRow
        spacing: 10
        layoutDirection: Qt.RightToLeft
        Button {
            id: exportButton
            text: "Export to CSV"
            onClicked: {
                filePicker.visible = true;
                visible = false;
            }
//            anchors.top: parent.top
//            anchors.right: parent.right
            background: Rectangle {
                color: "lightskyblue"
                border.color: "black"
            }
            padding: 10
        }

        Button {
            id: scanButton
            text: "Scan Badge"
            onClicked: NavHelper.nav_tray_push("qrc:/PgQrScan.qml")
//            anchors.top: parent.top
//            anchors.right: exportButton.left
            background: Rectangle {
                color: "lightskyblue"
                border.color: "black"
            }
            padding: 10
        }
    }


    ListView {
        id: contacts
        width: parent.width
        anchors.top: buttonRow.bottom
        anchors.bottom: parent.bottom

        FilePicker {
            id: filePicker
            anchors.fill: parent
            showDotAndDotDot: true
            visible: false
            onFileSaved: {
                visible = false
            }
        }

        model: ListModel {
            id: contactsModel
            Component.onCompleted: DB.get_contacts()
        }

        delegate: Component {
            Rectangle {
                width: contacts.width
                height: shortabstractText.height

                Row {
                    spacing: contacts.width * 0.05
                    Text {
                        text: first
                        width: contacts.width * 0.15
                        wrapMode: Text.Wrap
                    }
                    Text {
                        text: last
                        width: contacts.width * 0.15
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: shortabstractText
                        text: email
                        width: contacts.width * 0.6
                        maximumLineCount: 3
                        wrapMode: Text.Wrap
                    }
                }

                MouseArea{
                    z: 1
                    anchors.fill: parent
                    onClicked: {
                        console.log("row clicked");
    //                    NavHelper.nav_tray_push("qrc:/PresentationDetail.qml", {page: path});
                    }
                    onPressAndHold: {
                        console.log("row long press...");
                        //TODO - add event to user schedule
                    }
                }
            }
        }
    }
}

