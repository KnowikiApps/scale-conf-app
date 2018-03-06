import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

Rectangle {
    property string currentDay: ""

    Row {

        Button {
            width: parent.parent.width * 0.25
            text: "Thursday"
            onClicked: {
                parent.parent.currentDay = "Thursday"
            }
        }

        Button {
            width: parent.parent.width * 0.25
            text: "Friday"
            onClicked: {
                parent.parent.currentDay = "Friday"
            }
        }

        Button {
            width: parent.parent.width * 0.25
            text: "Saturday"
            onClicked: {
                parent.parent.currentDay = "Saturday"
            }
        }

        Button {
            width: parent.parent.width * 0.25
            text: "Sunday"
            onClicked: {
                parent.parent.currentDay = "Sunday"
            }
        }
    }
}
