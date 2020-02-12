import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

ColumnLayout{
    spacing: 50

    GridView{
        id: speakerList
        width: window.width
        height: window.height
        model: speakerModel.model
        cellWidth: width/2
        cellHeight: cellWidth

        SpeakersModel{
            id: speakerModel
        }

        delegate: Rectangle{
            id: delegateRoot
            width: speakerList.cellWidth; height: speakerList.cellHeight
            color: 'red'
            Image{
                source: photo.src
                width: speakerList.cellWidth
                height: width
                fillMode: Image.PreserveAspectCrop
            }

            Rectangle{
                width: speakerList.cellWidth * 0.5
                height: width
                anchors.bottom: delegateRoot.bottom
                anchors.right: delegateRoot.right
                color: 'blue'

                Text{
                    FontLoader { id: daFont; source: "qrc:/fonts/AnonymousPro-Regular.ttf" }
                    font.family: daFont.name
                    text: name.replace(" ", "\n")
                    fontSizeMode: Text.Fit
                    width: parent.width - (parent.width*0.20); height: width
                    minimumPixelSize: 10
                    font.pixelSize: 72
                    horizontalAlignment: Text.AlignRight
                    anchors.centerIn: parent
                }
            }
        }
    }
}
