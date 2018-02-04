import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as Database

ListView {
    id: schedule
    width: parent.parent.width; height: parent.parent.height
    model: SignModel{}

    delegate: Component {
        Rectangle {
            width: schedule.width
            height: shortabstractText.height

            Row {
                spacing: schedule.width * 0.05
                Text {
                    text: time
                    width: schedule.width * 0.15
                    wrapMode: Text.Wrap
                }
                Text {
                    id: shortabstractText
                    text: shortabstract
                    width: schedule.width * 0.6
                    maximumLineCount: 3
                    wrapMode: Text.Wrap
                }
                Text {
                    text: room
                    width: schedule.width * 0.15
                    wrapMode: Text.Wrap
                }
            }

            MouseArea{
                z: 1
                anchors.fill: parent
                onClicked: {
                    console.log("row clicked");
                    NavHelper.nav_tray_push("qrc:/PresentationDetail.qml", {page: path});
                }
                onPressAndHold: {
                    console.error("row long press...");
                    console.error("time:  " + time);
                    console.error("title:  " + title);
                    console.error("room:  " + room);
                    //TODO - add event to user schedule
                    Database.add_record("schedule_list", {time: time, title: title, room: room, path: path})
                }
            }
        }
    }
}
