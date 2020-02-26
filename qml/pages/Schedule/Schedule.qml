import QtQuick 2.0
import QtQuick 2.8

import QtQuick.Controls 2.1
import QtQuick.Controls 2.8
import QtQuick.Layouts 1.8
import QtQuick.Layouts 1.0

import "../components/ScheduleFilter"

import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as Database
import "qrc:/js/feed.js" as Feed
import "qrc:/js/utils.js" as Utils

ColumnLayout {
    spacing: 4

    FontLoader {
        id: anonymousProBold
        source: "qrc:/fonts/AnonymousPro-Bold.ttf"
    }

    FontLoader {
        id: anonymousProRegular
        source: "qrc:/fonts/AnonymousPro-Regular.ttf"
    }

    FontLoader {
        id: sourceCodeProBlack
        source: "qrc:/fonts/SourceCodePro-Black.ttf"
    }

    ScheduleFilter {
        id: dayFilter
        z: 2
        listRef: schedule
    }

    SignModel {
        id: signModel
    }

/*
    TabBar {
        id: bar
        spacing: 0

        TabButton {
            id: thursdayButton
            text: "<font color=\"#ffffff\">THURSDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: 125
            background: Rectangle {
                color: (thursdayButton.activeFocus ? "#eb6c4b" : "#e9f2f9")
            }
        }
        TabButton {
            id: fridayButton
            text: "<font color=\"#ffffff\">FRIDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: 125
            background: Rectangle {
                color: (fridayButton.activeFocus ? "#eb6c4b" : "#e9f2f9")
            }
        }
        TabButton {
            id: saturdayButton
            text: "<font color=\"#ffffff\">SATURDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: 125
            background: Rectangle {
                color: (saturdayButton.activeFocus ? "#eb6c4b" : "#e9f2f9")
            }
        }
        TabButton {
            id: sundayButton
            text: "<font color=\"#ffffff\">SUNDAY</font>"
            font.family: sourceCodeProBlack.name
            font.pointSize: 12
            font.weight: Font.Bold
            width: 125
            background: Rectangle {
                color: (sundayButton.activeFocus ? "#eb6c4b" : "#e9f2f9")
            }
        }
    }
*/

    ListView {
        id: schedule
        width: window.width
        height: window.height - parent.spacing*1.75
        anchors.top: dayFilter.bottom
        model: signModel.getModelID().model

        delegate: Rectangle {
            id: delegateRoot
            width: schedule.width * 1
            color: "#e9f2f9"

            property bool rowVisible: Feed.dayMatches(dayFilter.currentDay, when.day)
            property int dividerHeight: rowVisible ? delegateRoot.height - (rowVisible * 10) : 0
            property int availWidth: schedule.width - 33 - addButton.width
            property int delegateHeight: Feed.heightOf(dayFilter.currentDay, when.day, shortabstractText.height + titleText.height)

            height: delegateHeight + (rowVisible * 50)

            MouseArea {
                z: 1
                height: delegateRoot.height
                width: delegateRoot.width - addButton.width
                onClicked: {
                    NavHelper.nav_tray_push("qrc:/pages/components/PresentationDetail/PresentationDetail.qml", {page: url});
                }
                onPressAndHold: {
                    Database.add_record("schedule_list",{time: Feed.timeRange(when.startTime, when.endTime), day: Feed.parseDay(when.day), talkTitle: Database.sanitize(title), room: location, path: url})
                }

                Rectangle {id: divideRect; height: 8; color: "#ffffff"; width: schedule.width}

                Row {
                    id: delegateRow
                    spacing: 10
                    anchors.top: divideRect.bottom
                    anchors.topMargin: 20

                    Text {
                        text: Feed.timeRange(when.startTime, when.endTime)
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                        color: (Database.record_exists_in_schedule_list(url) ? "#eb6c4b" : "#8cadc8")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        topPadding: 1
                        elide: Text.ElideRight
                        font.family: sourceCodeProBlack.name
                    }
                    //Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                    Column{
                        Text {
                            id: titleText
                            text: title
                            width: delegateRoot.availWidth * 0.7
                            maximumLineCount: 1
                            wrapMode: Text.Wrap
                            font.weight: Font.Black
                            font.pointSize: 10
                            color: "#8cadc8"
                            font.family: sourceCodeProBlack.name
                            visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                        }
                        Text {
                            id: shortabstractText
                            text: shortAbstract
                            width: delegateRoot.availWidth * 0.7
                            maximumLineCount: 3
                            wrapMode: Text.Wrap
                            font.family: anonymousProRegular.name
                            font.weight: Font.Normal
                            color: "#8cadc8"
                            //elide: Text.ElideRight
                            visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                        }
                    }

                    //Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                    Text {
                        text: location
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        color: "#8cadc8"
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignTop
                        topPadding: ((delegateRoot.height - divideRect.height) / 5)
                        font.family: anonymousProBold.name
                        //elide: Text.ElideRight
                        visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                    }
                    //Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                    Button {
                        id: addButton
                        text: Database.set_proper_icon(url)
                        font.pointSize: 16
                        font.bold: true
                        font.family: anonymousProBold.name
                        enabled: !Database.record_exists_in_schedule_list(url)
                        onClicked: {
                            Database.add_record("schedule_list",{time: Feed.timeRange(when.startTime, when.endTime), day: Feed.parseDay(when.day), talkTitle: Database.sanitize(title), room: location, path: url})
                            addButton.text = Database.set_proper_icon(url)
                            addButton.enabled = !Database.record_exists_in_schedule_list(url)
                        }
                        visible: Feed.dayMatches(dayFilter.currentDay, when.day)

                        contentItem: Text {
                            text: addButton.text
                            font: addButton.font
                            //opacity: enabled ? 1.0 : 0.3
                            //color: control.down ? "#17a81a" : "#21be2b"
                            color: (Database.record_exists_in_schedule_list(url) ? "#eb6c4b" : "#8cadc8")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            topPadding:((delegateRoot.height - divideRect.height) / 8)
                            elide: Text.ElideRight
                        }

                        background: Rectangle {
                            //implicitWidth: 100
                            //implicitHeight: 40
                            //opacity: enabled ? 1 : 0.3
                            //border.color: control.down ? "#17a81a" : "#21be2b"
                            //border.width: 1
                            color: "#e9f2f9"
                            width: height
                        }
                    }
                }
            }
//            MouseArea{
//                z: 1
//                anchors.fill: parent
//                onClicked: {
//                    NavHelper.nav_tray_push("qrc:/pages/components/PresentationDetail/PresentationDetail.qml", {page: url});
//                }
//                onPressAndHold: {
//                    Database.add_record("schedule_list", {time: time, day: Feed.parseDay(when.day), talkTitle: title, room: location, path: url})
//                }
//            }

        }
    }

    /*
    StackLayout {
        width: parent.width
        currentIndex: bar.currentIndex

        Item {
            id: thursdayTab
            Text {
                text: "This is the Thursday tab"
            }
        }
        Item {
            id: fridayTab
            Text {
                text: "This is the Friday tab"
            }
        }
        Item {
            id: saturdayTab
            Text {
                text: "Saturday is lit"
            }
        }
        Item {
            id: asdfadsfTab
            Text {
                text: "Sunday is funday"
            }
        }
    }
    */
}

/*
ColumnLayout{
    spacing: 0
    FontLoader { id: sourceCodeProBlack; source: "qrc:/fonts/SourceCodePro-Black" }

    GridView{
        id: speakerList
        width: window.width
        height: window.height
        model: speakerModel.model
        cellWidth: width/2
        cellHeight: cellWidth

        SignModel{
            id: speakerModel
        }

        delegate: Rectangle{
            id: delegateRoot
            width: speakerList.cellWidth; height: speakerList.cellHeight

            Image{
                source: photo.src
                width: speakerList.cellWidth
                height: width
                fillMode: Image.PreserveAspectCrop
            }

            Rectangle{
                property string boxColor: "#1D3261"
                property string textColor: "#ffffff"

                Component.onCompleted: {
                    var rand = Utils.randomNumber(0, 4);
                    switch(rand){
                    case 0:
                        boxColor = "#E9F2F9";
                        textColor = Utils.randomNumber(0, 9) % 2 ? "#ffffff" : "#1d3561";
                        break;
                    case 1:
                        boxColor = "#8CADC8";
                        textColor = Utils.randomNumber(0, 9) % 2 ? "#ffffff" : "#1d3561";
                        break;
                    case 2:
                        boxColor = "#EB6C4B";
                        textColor = Utils.randomNumber(0, 9) % 2 ? "#ffffff" : "#1d3561";
                        break;
                    default:
                        break;
                    }
                }

                id: textBox
                width: speakerList.cellWidth * 0.5
                height: width
                anchors.bottom: delegateRoot.bottom
                anchors.right: delegateRoot.right
                color: boxColor

                Text{
                    FontLoader { id: daFont; source: "qrc:/fonts/AnonymousPro-Bold.ttf" }
                    font.family: daFont.name
                    text: name.replace(" ", "\n")
                    fontSizeMode: Text.Fit
                    width: parent.width - (parent.width*0.20); height: width
                    minimumPixelSize: 10
                    font.pixelSize: 72
                    horizontalAlignment: Text.AlignRight
                    anchors.centerIn: parent
                    font.weight: Font.ExtraBold
                    color: parent.textColor
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
*/
