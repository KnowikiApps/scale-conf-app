import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ColumnLayout {
    Rectangle {
        width: window.width
        height: width/3
        Image {
            id: banner
            source: "qrc:/img/HomePageBanner.svg"
            width: 123
            height: parent.height
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Rectangle {
        width: window.width
        color: "lightgray"
        height: announcementsText.height

        Text {
            id: announcementsText
            width: parent.width
            text: "Announcements"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }
    }

    ListView {
        id: announcements
        width: window.width;
        height: window.height - banner.height
        model: AnnouncementsModel{}

        delegate: Rectangle {
            id: delegateRoot
            width: announcements.width
            height: shortabstractText.height

            property int dividerHeight: delegateRoot.height - 10
            property int availWidth: announcements.width - 22

            Row {
                spacing: availWidth * 0.10
                Text {
                    text: announcementId
                    width: announcements.width * 0.1
                    wrapMode: Text.Wrap
                }
                Rectangle {height: dividerHeight; color: "lightgray"; width: 1}
                Text {
                    text: title
                    width: availWidth * 0.15
                    wrapMode: Text.Wrap
                }
                Rectangle {height: dividerHeight; color: "lightgray"; width: 1}
                Text {
                    id: shortabstractText
                    text: body
                    width: availWidth * 0.75
                    maximumLineCount: 3
                    wrapMode: Text.Wrap
                }
            }
        }

    }

}
