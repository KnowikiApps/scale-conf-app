import QtQuick 2.0
import QtQuick.Controls 2.2

Dialog {
    title: "Delete Entry"
    standardButtons: Dialog.Ok | Dialog.Cancel

    property string talkTitle
    property ListModel model

    x: (parent.width / 2) - (implicitWidth / 2)
    y: (parent.height / 2) - (implicitHeight / 2)

    closePolicy: Popup.NoAutoClose
    modal: true
    contentItem: Rectangle {
        color: "lightskyblue"
        implicitWidth: window.width * 0.75
        implicitHeight: window.height * 0.10

        Text {
            text: "Press OK to confirm delete"
            horizontalAlignment: Text.AlignCenter
            wrapMode: Text.WordWrap
            width: parent.width
            elide: Text.ElideRight
        }
    }
}
