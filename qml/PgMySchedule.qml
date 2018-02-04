import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as DB

ListView {
    id: schedule_list
    width: parent.parent.width; height: parent.parent.height

    model: ListModel {
        id: scheduleListModel
        Component.onCompleted: DB.get_schedule_list()
    }

    delegate: Component {
        Rectangle {
            width: schedule_list.width
            height: schedule_list.height * 0.1

            Row {
                spacing: schedule_list.width * 0.25
                Text {
                    text: time
                    width: schedule_list.width * 0.15
                    wrapMode: Text.NoWrap
                }
                Text {
                    text: title
                    width: schedule_list.width * 0.15
                    wrapMode: Text.Wrap
                }
                Text {
                    text: room
                    width: schedule_list.width * 0.1
                    maximumLineCount: 3
                    wrapMode: Text.NoWrap
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
                    console.log("row long press...");
                    DB.remove_schedule_entry(title);
                    //TODO - add event to user schedule
                }
            }
        }
    }
}
