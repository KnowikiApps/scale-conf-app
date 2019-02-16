import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

Rectangle {
    id: scheduleFilterRoot
    property string currentDay: ""

    property var listRef: null

    Row {
        id: buttonRow
        spacing: 5
        Button {
            width: (parent.parent.width * 0.25) - 3.75
            text: "Thursday"
            onClicked: {
                parent.parent.currentDay = "Thursday";
                if(listRef){
                    parent.parent.listRef.positionViewAtBeginning();
                }
            }
            background: Rectangle {
                color: (scheduleFilterRoot.currentDay === "Thursday") ? "white" : "lightskyblue"
                border.color: "black"
            }
            padding: 12
        }

        Button {
            width: (parent.parent.width * 0.25) - 3.75
            text: "Friday"
            onClicked: {
                parent.parent.currentDay = "Friday";
                if(listRef){
                    parent.parent.listRef.positionViewAtBeginning();
                }
            }
            background: Rectangle {
                color: (scheduleFilterRoot.currentDay === "Friday") ? "white" : "lightskyblue"
                border.color: "black"
            }
            padding: 12
        }

        Button {
            width: (parent.parent.width * 0.25) - 3.75
            text: "Saturday"
            onClicked: {
                parent.parent.currentDay = "Saturday";
                if(listRef){
                    parent.parent.listRef.positionViewAtBeginning();
                }
            }
            background: Rectangle {
                color: (scheduleFilterRoot.currentDay === "Saturday") ? "white" : "lightskyblue"
                border.color: "black"
            }
            padding: 12
        }

        Button {
            width: (parent.parent.width * 0.25) - 3.75
            text: "Sunday"
            onClicked: {
                parent.parent.currentDay = "Sunday";
                if(listRef){
                    parent.parent.listRef.positionViewAtBeginning();
                }
            }
            background: Rectangle {
                color: (scheduleFilterRoot.currentDay === "Sunday") ? "white" : "lightskyblue"
                border.color: "black"
            }
            padding: 12
        }
    }
}
