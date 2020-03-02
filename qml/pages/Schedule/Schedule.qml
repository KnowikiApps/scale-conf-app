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

    ListView {
        id: schedule
        width: window.width
        height: window.height - parent.spacing*1.75
//        anchors.top: dayFilter.bottom
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
                        id: timeText
                        text: Feed.timeRange(when.startTime, when.endTime)
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                        color: (Database.record_exists_in_schedule_list(url) ? "#eb6c4b" : "#1D3261")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        topPadding: 1
                        elide: Text.ElideRight
                        font.family: sourceCodeProBlack.name
                    }

                    Column{
                        Text {
                            id: titleText
                            text: title
                            width: delegateRoot.availWidth * 0.7
                            maximumLineCount: 1
                            wrapMode: Text.Wrap
                            font.weight: Font.Black
                            font.pointSize: 10
                            color: "#1D3261"
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
                            color: "#1D3261"
                            visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                        }
                    }

                    Text {
                        text: location
                        width: delegateRoot.availWidth * 0.15
                        wrapMode: Text.Wrap
                        color: "#1D3261"
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignTop
                        topPadding: ((delegateRoot.height - divideRect.height) / 5)
                        font.family: anonymousProBold.name
                        visible: Feed.dayMatches(dayFilter.currentDay, when.day)
                    }

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
                            addButtonText.color = (Database.record_exists_in_schedule_list(url) ? "#eb6c4b" : "#1D3261")
                            timeText.color = (Database.record_exists_in_schedule_list(url) ? "#eb6c4b" : "#1D3261")
                            addButton.enabled = !Database.record_exists_in_schedule_list(url)
                        }
                        visible: Feed.dayMatches(dayFilter.currentDay, when.day)

                        contentItem: Text {
                            id: addButtonText
                            text: addButton.text
                            font: addButton.font
                            color: (Database.record_exists_in_schedule_list(url) ? "#eb6c4b" : "#1D3261")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            topPadding:((delegateRoot.height - divideRect.height) / 8)
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
