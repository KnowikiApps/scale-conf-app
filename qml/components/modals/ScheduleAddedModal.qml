import QtQuick 2.0
import QtQuick.Controls 2.3

Dialog {
    title: "Success!"
    standardButtons: Dialog.Ok

    parent: Overlay.overlay
    anchors.centerIn: parent


    closePolicy: Popup.NoAutoClose
    modal: true
    implicitWidth: implicitContentWidth
    contentItem: Label {
        id: text
        text: "Event was added to your schedule"
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.WordWrap
        elide: Text.ElideRight

        background: Rectangle {
            color: "lightskyblue"
        }
    }
}
