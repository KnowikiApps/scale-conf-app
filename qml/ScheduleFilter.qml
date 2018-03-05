import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

Rectangle {
    property string currentDay: ""

    Row {
        anchors.fill: parent

        Button {
            width: parent.parent.width * 0.25
            text: "Thursday"
            onClicked: {
                parent.parent.currentDay = "Thursday"
                console.error("currentDay: " + parent.parent.currentDay);
            }
        }

        Button {
            width: parent.parent.width * 0.25
            text: "Friday"
            onClicked: {
                parent.parent.currentDay = "Friday"
                console.error("currentDay: " + parent.parent.currentDay);
            }
        }

        Button {
            width: parent.parent.width * 0.25
            text: "Saturday"
            onClicked: {
                parent.parent.currentDay = "Saturday"
                console.error("currentDay: " + parent.parent.currentDay);
            }
        }

        Button {
            width: parent.parent.width * 0.25
            text: "Sunday"
            onClicked: {
                parent.parent.currentDay = "Sunday"
                console.error("currentDay: " + parent.parent.currentDay);
            }
        }
    }
}
