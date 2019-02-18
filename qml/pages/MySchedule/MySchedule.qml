import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

import "../components/ScheduleFilter"

import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as DB
import "qrc:/js/feed.js" as Feed

ColumnLayout {
    spacing: 50

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
            width: mySchedule.width * 0.94

            property bool rowVisible: Feed.dayMatches(dayFilter.currentDay, day)
            property int dividerHeight: rowVisible ? delegateRoot.height - (rowVisible * 10) : 0
            property int availWidth: mySchedule.width - 33 - addButton.width
            property int delegateHeight: Feed.heightOf(dayFilter.currentDay, day, talkTitleText.height * 3)

            height: delegateHeight + (rowVisible * 10)

            Row {
                id: delegateRow
                spacing: 5

                Text {
                    text: time
                    width: delegateRoot.availWidth * 0.15
                    wrapMode: Text.Wrap
                    visible: Feed.dayMatches(dayFilter.currentDay, day)
                }
                Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                Text {
                    id: talkTitleText
                    text: talkTitle
                    width: delegateRoot.availWidth * 0.7
                    maximumLineCount: 3
                    wrapMode: Text.Wrap
                    visible: Feed.dayMatches(dayFilter.currentDay, day)
                }
                Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                Text {
                    text: room
                    width: delegateRoot.availWidth * 0.15
                    wrapMode: Text.Wrap
                    visible: Feed.dayMatches(dayFilter.currentDay, day)
                }
                Rectangle {height: dividerHeight; color: "lightgray"; width: 1; visible: rowVisible}
                Button {
                    id: addButton
                    width: height
                    text: "-"
                    onClicked: {
                        confirmDelete.open();
                        confirmDelete.model = scheduleListModel;
                        confirmDelete.talkTitle = talkTitleText.text;
                    }
                    visible: Feed.dayMatches(dayFilter.currentDay, day)
                }
            }

            MouseArea{
                z: 1
                anchors.fill: parent
                onClicked: {
                    NavHelper.nav_tray_push("qrc:/pages/components/PresentationDetail/PresentationDetail.qml", {page: path});
                }
                onPressAndHold: {
                    confirmDelete.open();
                }
            }

        }
    }
}
