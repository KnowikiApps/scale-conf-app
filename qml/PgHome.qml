import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ListView {
    id: announcements
    width: parent.parent.width; height: parent.parent.height
    model: AnnouncementsModel{}

    delegate: Component {
        Rectangle {
            width: announcements.width
            height: shortabstractText.height

            Row {
                spacing: announcements.width * 0.05
                Text {
                    text: announcementId
                    width: announcements.width * 0.1
                    wrapMode: Text.Wrap
                }
                Text {
                    text: title
                    width: announcements.width * 0.3
                    wrapMode: Text.Wrap
                }
                Text {
                    id: shortabstractText
                    text: body
                    width: announcements.width * 0.5
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
