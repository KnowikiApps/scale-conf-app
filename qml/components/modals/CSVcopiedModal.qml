import QtQuick 2.0
import QtQuick.Controls 2.3

Dialog {
    title: "CSV Copied"
    standardButtons: Dialog.Ok

    parent: Overlay.overlay
    anchors.centerIn: parent


    closePolicy: Popup.NoAutoClose
    modal: true
    implicitWidth: implicitContentWidth
    contentItem: Label {
        id: text
        text: "CSV Text has been copied to the clipboard and can be pasted into another application."
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.WordWrap
        elide: Text.ElideRight

        background: Rectangle {
            color: "lightskyblue"
        }
    }
}
