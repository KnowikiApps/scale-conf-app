import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.5
import QtQuick.Window 2.0
import QZXing 2.3
import "qrc:/js/database.js" as DB

Pane{
    id: scanningPage
    contentWidth: theLayout.implicitWidth
    contentHeight: theLayout.implicitHeight

    MessageDialog {
        id: contactError
        icon: StandardIcon.Critical
        standardButtons: StandardButton.Ok
        onAccepted: this.close()
    }

    MessageDialog {
        id: contactDialog

        property string tag

        title: "Add Contact"
        text: {
            var info = tag.split("~");
            return "Add to contacts? \n"+info[1] + " " + info[2] + '\n' + info[3];
        }
        standardButtons: StandardButton.Yes | StandardButton.No
        icon: StandardIcon.Question;
        modality: Qt.WindowModal
        onYes: {
            this.close();
            try {
                DB.add_contact(tag.split("~"));
            } catch(err){
                contactError.text = err.message;
                contactError.open();
            }

        }
        onNo: this.close();
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


