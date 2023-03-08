import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import "qrc:/js/utils.js" as Utils
import "qrc:/js/nav.js" as NavHelper

ColumnLayout {
    spacing: 0

    FontLoader { id: sourceCodeProBlack; source: "qrc:/fonts/SourceCodePro-Black.ttf" }

    Rectangle{
        id: header
        width: window.width
        height: window.height * 0.05

        Text{
            text: "ANNOUNCEMENTS"
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

    GridView{
        id: speakerList
        width: window.width
        height: window.height
        cellWidth: width/2
        cellHeight: cellWidth
        model: AnnouncementsModel{}

        header: Rectangle{
            visible: !speakerList.model.count

            Text{
                text: "No Announcements Yet!"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: sourceCodeProBlack.name
                color: "#EB6C4B"
                width: speakerList.width
                font.weight: Font.ExtraBold
                fontSizeMode: Text.HorizontalFit
                minimumPixelSize: 10;
                font.pixelSize: 72
            }
        }

        delegate: Rectangle{
            id: delegateRoot
            width: speakerList.cellWidth; height: speakerList.cellHeight

            Rectangle{
                property string boxColor: "#1D3261"
                property string textColor: "#ffffff"

                Component.onCompleted: {
                    var rand = Utils.randomNumber(0, 4);
                    switch(rand){
                    case 0:
                        boxColor = "#E9F2F9";
                        textColor = "#1d3561";
                        break;
                    case 1:
                        boxColor = "#8CADC8";
                        textColor = Utils.randomNumber(0, 9) % 2 ? "#ffffff" : "#1d3561";
                        break;
                    case 2:
                        boxColor = "#EB6C4B";
                        textColor = Utils.randomNumber(0, 9) % 2 ? "#ffffff" : "#1d3561";
                        break;
                    default:
                        break;
                    }
                }

                id: textBox
                width: speakerList.cellWidth
                height: width
                anchors.bottom: delegateRoot.bottom
                anchors.right: delegateRoot.right
                color: boxColor

                FontLoader { id: srcFont; source: "qrc:/fonts/SourceCodePro-Black.ttf" }
                FontLoader { id: daFont; source: "qrc:/fonts/AnonymousPro-Bold.ttf" }

                Text {
                    id: titleText
                    text: title
                    width: parent.width - (parent.width*0.20)//; height: width/2
                    wrapMode: Text.WordWrap
                    font.pointSize: (window.width * 0.024)
                    font.weight: Font.ExtraBold
                    font.family: srcFont.name
                    color: textBox.textColor
                }
                Text {
                    id: shortabstractText
                    text: body
                    color: textBox.textColor
                    width: parent.width - (parent.width*0.20)//; height: width
                    wrapMode: Text.WordWrap
                    anchors.top: titleText.bottom
                    font.family: daFont.name
                    font.pointSize: (window.width * 0.022)
                    horizontalAlignment: Text.AlignLeft
                }
            }
        }
    }
}
