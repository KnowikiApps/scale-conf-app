import QtQuick 2.5
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtMultimedia
import QtQuick.Window 2.0
import com.scythestudio.scodes 1.0
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
        anchors.fill: parent

        VideoOutput{
            id: videoOutput
            //source: camera
            Layout.preferredWidth: window.width
            Layout.preferredHeight: window.height
            fillMode: VideoOutput.PreserveAspectFit


            Rectangle{
                id: captureZone
                color: "red"
                opacity: 0.2
                width: parent.width / 2
                height: parent.height / 2
                anchors.centerIn: parent
            }
        }

        SBarcodeScanner {
          id: barcodeScanner

          forwardVideoSink: videoOutput.videoSink
          scanning: !contactDialog.visible
          captureRect: Qt.rect(0.25, 0.25, 0.5, 0.5)

          onCapturedChanged: function (captured) {
              console.log(captured)
              if(!contactDialog.visible) {
                  contactDialog.tag = captured
                  contactDialog.open()
              }
          }
        }

    }
}


