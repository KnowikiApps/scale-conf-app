import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import "qrc:/js/database.js" as DB

ListView {
    id: contacts
    width: parent.parent.width; height: parent.parent.height

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
