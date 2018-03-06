import QtQuick 2.0
import QtQuick.Controls 2.2

Dialog {
    title: "Event exists"
    standardButtons: Dialog.Ok

    x: (parent.width / 2) - (implicitWidth / 2)
    y: (parent.height / 2) - (implicitHeight / 2)

    closePolicy: Popup.NoAutoClose
    modal: true
    onAccepted: this.close()
    contentItem: Rectangle {
        color: "lightskyblue"
        implicitWidth: parent.parent.width * 0.75
        implicitHeight: parent.parent.height * 0.10

        Text {
            text: "Event is already saved in your schedule!"
            horizontalAlignment: Text.AlignCenter
            wrapMode: Text.WordWrap
            width: parent.width
            elide: Text.ElideRight
        }
    }
}
