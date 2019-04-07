import QtQuick 2.0
import QtQuick.Controls 2.2

Dialog {
    title: "CSV Copied"
    standardButtons: Dialog.Ok

    x: (parent.width / 2) - (implicitWidth / 2)
    y: (parent.height / 2) - (implicitHeight / 2)

    closePolicy: Popup.NoAutoClose
    modal: true
    onAccepted: this.close()
    contentItem: Rectangle {
        color: "lightskyblue"
        implicitWidth: window.width * 0.75
        implicitHeight: window.height * 0.10

        Text {
            text: "CSV Text has been copied to the clipboard and can be pasted into another application."
            horizontalAlignment: Text.AlignCenter
            wrapMode: Text.WordWrap
            width: parent.width
            elide: Text.ElideRight
        }
    }
}
