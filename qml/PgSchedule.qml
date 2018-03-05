import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as Database
import "qrc:/js/feed.js" as Feed

Rectangle {

    Column {

        anchors.fill: parent

        ScheduleFilter {
            id: dayFilter
            width: parent.parent.parent.parent.width; height: parent.parent.parent.parent.height
        }

        ListView {
            id: schedule
            width: parent.parent.parent.parent.width; height: parent.parent.parent.parent.height
            model: SignModel{}

            delegate: Component {
                Rectangle {
                    width: schedule.width * 0.94
                    height: shortabstractText.height

                    /*
                    Row {
                        width: schedule.width
                        height: markDay.text.length * 3

                        Text {
                            id: markDay
                            text: Feed.mark_day() // display day above first event only
                            wrapMode: Text.Wrap;
                        }
                    }
                    */

                    Row {
                        spacing: schedule.width * 0.05
                        Text {
                            text: time
                            width: schedule.width * 0.15
                            wrapMode: Text.Wrap
                            visible: Feed.dayMatches(dayFilter.currentDay, day);
                        }
                        Text {
                            id: shortabstractText
                            text: shortabstract
                            width: schedule.width * 0.49
                            maximumLineCount: 3
                            wrapMode: Text.Wrap
                            visible: Feed.dayMatches(dayFilter.currentDay, day);
                        }
                        Text {
                            text: room
                            width: schedule.width * 0.15
                            wrapMode: Text.Wrap
                            visible: Feed.dayMatches(dayFilter.currentDay, day);
                        }
                        Button {
                            width: schedule.width * 0.06
                            text: "+"
                            visible: Feed.dayMatches(dayFilter.currentDay, day)
                            onClicked: {
                                console.log("add button clicked");
                                Database.add_record("schedule_list", {time: time, talkTitle: title, room: room, path: path})
                            }
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
                            console.error("row long press...");
                            //TODO - add event to user schedule
                            Database.add_record("schedule_list", {time: time, talkTitle: title, room: room, path: path})
                        }
                    }
                }
            }
        }

    }
}
