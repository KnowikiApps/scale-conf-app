import QtQuick 2.0
import QtQuick.Controls 2.2
//import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.5
import QtQuick.Window 2.0
import QZXing 2.3
import "qrc:/js/database.js" as DB

Pane{
    id: scanningPage
    contentWidth: theLayout.implicitWidth
    contentHeight: theLayout.implicitHeight

    Dialog {
        id: contactError
        standardButtons: Dialog.Ok

        property string text

        onAccepted: this.close()
        contentItem: Rectangle {
            color: "lightskyblue"
            implicitWidth: parent.contentWidth * 0.75
            implicitHeight: parent.contentHeight * 0.10

            Text {
                text: contactError.text
                horizontalAlignment: Text.AlignCenter
                wrapMode: Text.WordWrap
                width: parent.width
                elide: Text.ElideRight
            }
        }
    }

    Dialog {
        id: contactDialog
        title: "Add Contact"
        standardButtons: Dialog.Yes | Dialog.No
        modal: true

        property string tag

        contentItem: Rectangle {
                    color: "lightskyblue"
                    implicitWidth: window.width * 0.75
                    implicitHeight: window.height * 0.10

                    Text {
                        text: {
                            var info = contactDialog.tag.split("~");
                            return "Add to contacts? \n"+info[1] + " " + info[2] + '\n' + info[3];
                        }
                        horizontalAlignment: Text.AlignCenter
                        wrapMode: Text.WordWrap
                        width: parent.width
                        elide: Text.ElideRight
                    }
                }

        onRejected: this.close();
        onAccepted: {
            this.close();
            try {
                DB.add_contact(tag.split("~"));
            } catch(err){
                contactError.text = err.message;
                contactError.open();
            }

        }
    }

    ColumnLayout{
        id: theLayout
        spacing: 2

        Camera{
            id: camera
            focus {
                focusMode: CameraFocus.FocusContinuous
                focusPointMode: CameraFocus.FocusPointAuto
            }
        }

        VideoOutput{
            id: videoOutput
            source: camera
            Layout.preferredWidth: window.width
            Layout.preferredHeight: window.height
            autoOrientation: true
            fillMode: VideoOutput.PreserveAspectFit
            filters: [zxingFilter]

            MouseArea{
                id: focusArea
                anchors.fill: parent
                onClicked: {
                    console.log("focus area clicked");
                    camera.focus.customFocusPoint = Qt.point(mouse.x/width, mouse.y/height);
                    camera.focus.focusMode = CameraFocus.FocusMacro;
                    camera.focus.focusPointMode = CameraFocus.FocusPointCustom;
                }

                PinchArea{
                    id: zoomControl
                    height: parent.height
                    width: parent.width

                    onPinchUpdated:{
                        camera.digitalZoom = camera.digitalZoom + (pinch.previousScale - pinch.scale);
                    }
                }
            }
            Rectangle{
                id: captureZone
                color: "red"
                opacity: 0.2
                width: parent.width / 2
                height: parent.height / 2
                anchors.centerIn: parent
            }
        }

        QZXingFilter{
            id: zxingFilter
            captureRect: {
                videoOutput.contentRect;
                videoOutput.sourceRect;
                return videoOutput.mapRectToSource(videoOutput.mapNormalizedRectToItem(Qt.rect(0.25, 0.25, 0.5, 0.5)));
            }
            decoder{
                enabledDecoders: QZXing.DecoderFormat_QR_CODE
                onTagFound: {
                    console.log(tag.split("~"));
                    if(!contactDialog.visible){
                        contactDialog.tag = tag;
                        contactDialog.open();
                    }

//                    DB.add_contact(tag.split("~"));
                }

                tryHarder: true
            }
    //        onDecodingStarted: {console.log("Decoding Started...");}
    //        onDecodingFinished: {console.log("Decoding Finished...");}
        }
    }
}


