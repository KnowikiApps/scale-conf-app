import QtQuick 2.0
import QtQuick 2.14

import QtQuick.Controls 2.1
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Layouts 1.0

import "../components/ScheduleFilter"

import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as DB
import "qrc:/js/feed.js" as Feed

ColumnLayout {
    spacing: 4

    FontLoader {
        id: sourceCodeProBlack
        source: "qrc:/fonts/SourceCodePro-Black"
    }

    ScheduleFilter {
        id: dayFilter
        width: window.width
        z:2

        listRef: mySchedule
    }

    ListView {
        id: mySchedule
        width: window.width
        height: window.height - parent.spacing*1.75
        anchors.top: dayFilter.bottom

        model: ListModel{
            id: scheduleListModel
            Component.onCompleted: DB.get_schedule_list(this);
        }

        delegate: Rectangle {
            id: delegateRoot
            width: mySchedule.width * 1
            color: "#e9f2f9"

            property bool rowVisible: Feed.dayMatches(dayFilter.currentDay, day)
            property int dividerHeight: rowVisible ? delegateRoot.height - (rowVisible * 10) : 0
            property int availWidth: mySchedule.width - 33 - deleteButton.width
            property int delegateHeight: Feed.heightOf(dayFilter.currentDay, day, talkTitleText.height + 32)

            height: delegateHeight + (rowVisible * 50)

            MouseArea {
                z: 1
                height: delegateRoot.height
                width: delegateRoot.width - deleteButton.width

                onClicked: {
                    NavHelper.nav_tray_push("qrc:/pages/components/PresentationDetail/PresentationDetail.qml", {page: path});
                }
                onPressAndHold: {
                    confirmDelete.open();
                }

                Rectangle {id: divideRect; height: 8; color: "#ffffff"; width: mySchedule.width}

                Row {
                    id: delegateRow
                    spacing: 10
                    anchors.top: divideRect.bottom
                    anchors.topMargin: 20

                    Text {
                        text: time
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                        color: "#8cadc8"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        topPadding: 1
                        elide: Text.ElideRight
                        font.family: sourceCodeProBlack.name
                    }
                    //Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                    Text {
                        id: talkTitleText
                        text: talkTitle
                        width: delegateRoot.availWidth * 0.7
                        maximumLineCount: 4
                        wrapMode: Text.Wrap
                        font.family: sourceCodeProBlack.name
                        font.weight: Font.Black
                        font.pointSize: 10
                        color: "#8cadc8"
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }
                    //Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                    Text {
                        text: room
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        color: "#8cadc8"
                        font.family: sourceCodeProBlack.name
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignTop
                        topPadding: ((delegateRoot.height - divideRect.height) / 6)
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }
                    //Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                    Button {
                        id: deleteButton
                        width: height
                        font.pointSize: 20
                        font.bold: true
                        font.family: sourceCodeProBlack.name
                        text: "-"
                        onClicked: {
                            confirmDelete.open();
                            confirmDelete.model = scheduleListModel;
                            confirmDelete.talkTitle = DB.sanitize(talkTitleText.text);
                        }
                        visible: Feed.dayMatches(dayFilter.currentDay, day)

                        contentItem: Text {
                            text: deleteButton.text
                            font: deleteButton.font
                            //opacity: enabled ? 1.0 : 0.3
                            //color: control.down ? "#17a81a" : "#21be2b"
                            color: "#8cadc8"
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            //topPadding:((delegateRoot.height - divideRect.height) / 8)
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
//                anchors.left: parent.left
//                anchors.top: parent.top
//                anchors.bottom: parent.bottom
//                anchors.right: deleteButton.left
//                onClicked: {
//                    NavHelper.nav_tray_push("qrc:/pages/components/PresentationDetail/PresentationDetail.qml", {page: path});
//                }
//                onPressAndHold: {
//                    confirmDelete.open();
//                }
//            }
        }
    }
}
