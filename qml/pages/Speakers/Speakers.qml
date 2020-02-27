import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

import "qrc:/js/utils.js" as Utils
import "qrc:/js/nav.js" as NavHelper

ColumnLayout{
    spacing: 0
    FontLoader { id: sourceCodeProBlack; source: "qrc:/fonts/SourceCodePro-Black.ttf" }

    Rectangle{
        id: header
        width: window.width
        height: window.height * 0.05

        Text{
            text: "SPEAKERS"
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
        model: speakerModel.model
        cellWidth: width/2
        cellHeight: cellWidth

        SpeakersModel{
            id: speakerModel
        }

        delegate: Rectangle{
            id: delegateRoot
            width: speakerList.cellWidth; height: speakerList.cellHeight
            color: 'white'

            property var props: ({
                                     _name: name,
                                     _title: title,
                                     _org: organization,
                                     _pic: photo.src,
                                     _bio: biography,
                                     _website: website
                                 })

            MouseArea{
                z: 1
                anchors.fill: parent
                enabled: parent.props ? true : false
                onClicked: {
                    NavHelper.nav_tray_push("qrc:/pages/Speakers/IndividualSpeaker.qml", props);
                }
            }

            Image{
                source: setImgSrc()

                width: speakerList.cellWidth
                height: width
                fillMode: Image.PreserveAspectCrop

                function setImgSrc(){
                    try{
                        return photo.src;
                    }catch(e){
                        var rand = Utils.randomNumber(0,5);
                        switch(rand){
                        case 0:
                            return "qrc:/img/SCaLE_placeholders_speakers_penguin-02.svg";
                        case 1:
                            return "qrc:/img/SCaLE_placeholders_speakers_penguin.svg";
                        case 2:
                            return "qrc:/img/SCaLE_placeholders_speakers_robot-01.svg";
                        case 3:
                            return "qrc:/img/SCaLE_placeholders_speakers_robot-02.svg";
                        case 4:
                            return "qrc:/img/SCaLE_placeholders_speakers_robot-03.svg";
                        case 5:
                            return "qrc:/img/SCaLE_placeholders_speakers_robot-04.svg";
                        }
                    }
                }
            }

            Rectangle{
                property string boxColor: "#1D3261"
                property string textColor: "#ffffff"

                Component.onCompleted: {
                    var rand = Utils.randomNumber(0, 4);
                    switch(rand){
                    case 0:
                        boxColor = "#E9F2F9";
                        textColor = Utils.randomNumber(0, 9) % 2 ? "#ffffff" : "#1d3561";
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
                width: speakerList.cellWidth * 0.5
                height: width
                anchors.bottom: delegateRoot.bottom
                anchors.right: delegateRoot.right
                color: boxColor

                Text{
                    FontLoader { id: daFont; source: "qrc:/fonts/AnonymousPro-Bold.ttf" }
                    font.family: daFont.name
                    text: name.replace(" ", "\n")
                    fontSizeMode: Text.Fit
                    width: parent.width - (parent.width*0.20); height: width
                    minimumPixelSize: 10
                    font.pixelSize: 72
                    horizontalAlignment: Text.AlignRight
                    anchors.centerIn: parent
                    font.weight: Font.ExtraBold
                    color: parent.textColor
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
