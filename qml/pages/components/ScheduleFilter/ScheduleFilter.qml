import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

ColumnLayout {
    id: layout
    FontLoader { id: sourceCodeProBlack; source: "qrc:/fonts/SourceCodePro-Black.ttf" }
    z: 5

    property string currentDay: ""
    property var listRef: null

    TabBar {
        id: bar
        spacing: 0

        TabButton {
            id: thursdayButton
            text: "<font color=\"#1D3261\">THURSDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: window.width/4
            background: Rectangle {
                color: (bar.currentIndex == 0 ? "#eb6c4b" : "#e9f2f9")
            }
            onClicked: {
                layout.currentDay = "thursday";
                if(layout.listRef){
                    layout.listRef.positionViewAtBeginning();
                }
            }
        }
        TabButton {
            id: fridayButton
            text: "<font color=\"#1D3261\">FRIDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: window.width/4
            background: Rectangle {
                color: (bar.currentIndex == 1 ? "#eb6c4b" : "#e9f2f9")
            }
            onClicked: {
                layout.currentDay = "friday";
                if(layout.listRef){
                    layout.listRef.positionViewAtBeginning();
                }
            }
        }
        TabButton {
            id: saturdayButton
            text: "<font color=\"#1D3261\">SATURDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: window.width/4
            background: Rectangle {
                color: (bar.currentIndex == 2 ? "#eb6c4b" : "#e9f2f9")
            }
            onClicked: {
                layout.currentDay = "saturday";
                if(layout.listRef){
                    layout.listRef.positionViewAtBeginning();
                }
            }
        }
        TabButton {
            id: sundayButton
            text: "<font color=\"#1D3261\">SUNDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: window.width/4
            background: Rectangle {
                color: (bar.currentIndex == 3 ? "#eb6c4b" : "#e9f2f9")
            }
            onClicked: {
                layout.currentDay = "sunday";
                if(layout.listRef){
                    layout.listRef.positionViewAtBeginning();
                }
            }
        }
    }
}

/*
Rectangle {
    id: scheduleFilterRoot
    height: buttonRow.implicitHeight

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
*/
