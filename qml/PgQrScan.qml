import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtMultimedia 5.5
import QtQuick.Window 2.0
import QZXing 2.3

Pane{
    id: scanningPage
    contentWidth: theLayout.implicitWidth
    contentHeight: theLayout.implicitHeight

    ColumnLayout{
        id: theLayout
        spacing: 2

        Camera{
            id: camera
            focus {
                focusMode: CameraFocus.FocusContinuous
                focusPointMode: CameraFocus.FocusPointAuto
            }
            Component.onCompleted: console.log(" completed")
        }

        VideoOutput{
            id: videoOutput
            source: camera
            Layout.preferredWidth: window.width
            Layout.preferredHeight: 200
            autoOrientation: true
            fillMode: VideoOutput.PreserveAspectFit
            filters: [zxingFilter]

            MouseArea{
                anchors.fill: parent
                onClicked: {
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
                onTagFound: console.log(tag + " | " + decoder.foundedFormat() + " | " + decoder.charSet());
                tryHarder: false
            }
    //        onDecodingStarted: {console.log("Decoding Started...");}
    //        onDecodingFinished: {console.log("Decoding Finished...");}
        }

        Switch{
            text: "Autofocus"
            checked: camera.focus.focusMode === CameraFocus.FocusContinuous
            anchors{right: parent.right; bottom: parent.bottom}

            onCheckedChanged: {
                if(checked){
                    camera.focus.focusMode = CameraFocus.FocusContinuous;
                    camera.focus.focusPointMode = CameraFocus.FocusPointAuto;
                }else{
                    camera.focus.focusPointMode = CameraFocus.FocusPointCustom;
                    camera.focus.customFocusPoint = Qt.point(0.5,  0.5);
                }
            }
        }
    }
}


