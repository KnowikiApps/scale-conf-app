import QtQuick 2.1
import QtQuick 2.8

import QtQuick.Controls 2.1
import QtQuick.Controls 2.8
import QtQuick.Layouts 1.8
import QtQuick.Layouts 1.0

import "../components/ScheduleFilter"

import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as DB
import "qrc:/js/feed.js" as Feed

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
        Layout.fillWidth: true
        listRef: mySchedule
    }

    ListView {
        id: mySchedule
        Layout.fillWidth: true
        Layout.fillHeight: true

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
                    NavHelper.nav_tray_push("qrc:/qt/qml/Scaleconf/qml/pages/components/PresentationDetail/PresentationDetail.qml", {page: path});
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
                        color: "#eb6c4b"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
//                        topPadding: 1
                        elide: Text.ElideRight
                        font.family: sourceCodeProBlack.name
                    }

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

                    Text {
                        text: room
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        color: "#8cadc8"
                        font.family: anonymousProBold.name
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignTop
//                        topPadding: ((delegateRoot.height - divideRect.height) / 6)
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }

                    Button {
                        id: deleteButton
                        width: height
                        font.pointSize: 20
                        font.bold: true
                        font.family: anonymousProBold.name
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
                            color: "#eb6c4b"
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }

                        background: Rectangle {
                            color: "#e9f2f9"
                            width: height
                        }
                    }
                }
            }
        }
    }
}
