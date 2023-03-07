import QtQuick 2.15
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.0
import "../Announcements"
import "qrc:/js/database.js" as DB

Item {
    XmlListModel {
        property var dbIds: []

        id: readAnnouncementsModel;
        query: "/nodes/node"

        XmlRole { id: titleRole; name: "title"; query: "Title/string()" }
        XmlRole { id: bodyRole; name: "body"; query: "Body/string()" }
        XmlRole { id: announcementIdRole; name: "announcementId"; query: "Announcement-ID/string()" }

        Component.onCompleted: {
            readAnnouncementsModel.xml = DB.get_xml("announcements")
        }

        onStatusChanged: {
            switch(status){
                case 0:
                    console.log("Null - No XML data has been set for this model.");
                    break;
                case 1:
                    console.log("Home - Ready - The XML data has been loaded into the model.");
                    for(var i = 0; i < readAnnouncementsModel.count; i++) {
                        dbIds.push(readAnnouncementsModel.get(i).announcementId)
                    }
                    break;
                case 2:
                    console.log("Loading - The model is in the process of reading and loading XML data.");
                    break;
                case 3:
                    console.log("Error - An error occurred while the model was loading");
                    break;
                default:
                    break;
            }
        }
    }

    ColumnLayout{

        Rectangle{
            id: header
            width: window.width
            height: window.height * 0.05

            Text{
                text: "SCaLE Home"
                font.family: sourceCodeProBlack.name
                color: "#EB6C4B"

                width: header.width*0.9
                height: header.height*0.6
                anchors.right: header.right
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter

                fontSizeMode: Text.VerticalFit
                minimumPixelSize: 10
                font.pixelSize: 72
                font.weight: Font.ExtraBold

            }
        }

        ListView {
            id: unreadAnnouncementsView
            width: window.width;
            height: window.height * 0.3
            model: AnnouncementsModel {}

            delegate: Rectangle {
                visible: readAnnouncementsModel.dbIds.indexOf("" + unreadAnnouncementsView.model.get(index).announcementId) < 0
                width: window.width
                height: window.height * 0.1
                id: delegateRoot

                Rectangle {
                    property string textColor: "#1D3561"

                    id: textBox
                    color: "#8CADC8"
                    width: window.width
                    height: window.height * 0.1

                    FontLoader { id: titleFont; source: "qrc:/fonts/SourceCodePro-Black.ttf" }
                    FontLoader { id: bodyFont; source: "qrc:/fonts/AnonymousPro-Bold.ttf" }

                    Text {
                        color: textBox.textColor
                        id: titleText
                        anchors.bottom: delegateRoot.bottom
                        text: title
                        wrapMode: Text.WordWrap
                        font.pointSize: (window.width * 0.024)
                        font.family: titleFont.name
                    }
                    Text {
                        color: textBox.textColor
                        id: shortabstractText
                        anchors.top: titleText.bottom
                        text: body
                        wrapMode: Text.WordWrap
                        font.pointSize: (window.width * 0.022)
                        font.family: bodyFont.name
                    }
                }
            }
        }
    }
}
