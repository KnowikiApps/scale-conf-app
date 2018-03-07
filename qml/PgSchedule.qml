import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as Database
import "qrc:/js/feed.js" as Feed

ColumnLayout {

    spacing: 50

    ScheduleFilter {
        id: dayFilter
        width: window.width
    }

    ListView {
        id: schedule
        width: window.width
        height: window.height
        model: SignModel{}

        delegate: Rectangle {
            id: delegateRoot
            width: schedule.width * 0.94

            property bool rowVisible: Feed.dayMatches(dayFilter.currentDay, day)
            property int dividerHeight: rowVisible ? delegateRoot.height - (rowVisible * 10) : 0
            property int availWidth: schedule.width - 33 - addButton.width
            property int delegateHeight: Feed.heightOf(dayFilter.currentDay, day, shortabstractText.height)

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
                    id: shortabstractText
                    text: shortabstract
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
                    text: "+"
                    onClicked: {
                        Database.add_record("schedule_list",{time: time, day: Feed.parseDay(day), talkTitle: title, room: room, path: path})
                    }
                    visible: Feed.dayMatches(dayFilter.currentDay, day)
                }
            }

            MouseArea{
                z: 1
                anchors.fill: parent
                onClicked: {
                    NavHelper.nav_tray_push("qrc:/PresentationDetail.qml", {page: path});
                }
                onPressAndHold: {
                    Database.add_record("schedule_list", {time: time, talkTitle: title, room: room, path: path})
                }
            }

        }
    }
}
