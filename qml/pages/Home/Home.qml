import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

ColumnLayout {
    spacing: 50

    Rectangle {
        width: window.width
        height: width/3
        Image {
            id: banner
            source: "qrc:/img/HomePageBanner.svg"
            height: parent.height
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            anchors.top: parent.top
        }
        Rectangle {
            width: parent.width
            color: "lightgray"
            height: announcementsText.height
            anchors.top: banner.bottom

            Text {
                id: announcementsText
                width: parent.width
                text: "Announcements"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
            }
        }
    }

    ListView {
        id: announcements
        width: window.width;
        height: window.height - banner.height
        spacing: 5
        model: AnnouncementsModel{}

        delegate: Rectangle{
            id: delegateRoot
            width: announcements.width
            height: contentColumn.height

            property int availWidth: announcements.width

            Column{
                id: contentColumn
                spacing: 5
                Text {
                    id: titleText
                    text: title
                    width: availWidth
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.underline: true
                    horizontalAlignment: Text.AlignJustify
                    leftPadding: 10
                    rightPadding: leftPadding
                }
                Text {
                    id: shortabstractText
                    text: body
                    width: availWidth
                    wrapMode: Text.Wrap
                    leftPadding: 10
                    rightPadding: leftPadding
                    horizontalAlignment: Text.AlignJustify
                }
                Rectangle {height: 1; color: "lightgray"; width: parent.width}
            }
        }
    }
}
