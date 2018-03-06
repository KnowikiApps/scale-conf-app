import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.1
import "qrc:/js/nav.js" as NavHelper
import "qrc:/js/database.js" as DB
import "qrc:/js/feed.js" as Feed

ColumnLayout {

    spacing: 45

    ScheduleFilter {
        id: dayFilter
        width: parent.parent.parent.parent.width
    }

    ListView {
        id: schedule_list
        width: parent.parent.parent.parent.width; height: parent.parent.parent.parent.height

        model: ListModel {
            id: scheduleListModel
            Component.onCompleted: DB.get_schedule_list()
        }

        delegate: Component {
            Rectangle {
                width: schedule_list.width * 0.94
                height: Feed.heightOf(dayFilter.currentDay, day, schedule_list.height * 0.1)

                Row {
                    spacing: schedule_list.width * 0.25

                    Text {
                        text: time
                        width: schedule_list.width * 0.02
                        wrapMode: Text.NoWrap
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }
                    Text {
                        text: talkTitle
                        width: schedule_list.width * 0.15
                        wrapMode: Text.Wrap
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }
                    Text {
                        text: room
                        width: schedule_list.width * 0.02
                        maximumLineCount: 3
                        wrapMode: Text.NoWrap
                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }
                    Button {
                        text: "-"
                        width: schedule_list.width * 0.06
                        onClicked: {
                            console.log("close button clicked...");
                            confirmDelete.open();
                        }

                        visible: Feed.dayMatches(dayFilter.currentDay, day)
                    }
                }

                MessageDialog {
                    id: confirmDelete
                    title: "Delete Entry"
                    text: "Press OK to confirm saved event deletion"
                    standardButtons: StandardButton.Ok | StandardButton.Cancel
                    icon: StandardIcon.NoIcon;
                    modality: Qt.WindowModal
                    onAccepted: {
                        console.log("deleting: " + talkTitle);
                        DB.remove_schedule_entry(talkTitle);
                        this.close()
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
                        console.log("row long press");
                        confirmDelete.open();
                    }
                }
            }
        }
    }

}
