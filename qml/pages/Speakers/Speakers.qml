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

        SpeakersModel{
            id: speakerModel
        }

        delegate: Rectangle{
            id: delegateRoot
            width: speakerList.cellWidth; height: speakerList.cellHeight
            color: 'red'
            Column{
                spacing: 10
                Image{
                    source: photo.src
                    width: speakerList.cellWidth
                    height: speakerList.cellHeight/2
                    fillMode: Image.PreserveAspectCrop
                }

                Text{
                    text: name
                }
            }

        }
    }
}
