import QtQuick 2.0
import QtQuick.Controls 2.2

Dialog {
    title: "Can't Connect to Wi-Fi"
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
            text: "There was an error downloading the schedule, check your internet connection and try again"
            horizontalAlignment: Text.AlignCenter
            wrapMode: Text.WordWrap
            width: parent.width
            elide: Text.ElideRight
        }
    }
}
