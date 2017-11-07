import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper

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
                    console.log("row long press...");
                    //TODO - add event to user schedule
                }
            }
        }
    }
}
