import QtQuick 2.0
import QtQuick.Controls 2.3

Dialog {
    id: savedAlreadyModal
    title: "Event exists"
    standardButtons: Dialog.Ok

    parent: Overlay.overlay

    anchors.centerIn: parent


    closePolicy: Popup.NoAutoClose
    modal: true
    implicitWidth: implicitContentWidth
    contentItem: Label {
        id: text
        text: "Event is already saved in your schedule!"
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.WordWrap
        elide: Text.ElideRight
        background: Rectangle {
            color: "lightskyblue"
        }
    }
}
