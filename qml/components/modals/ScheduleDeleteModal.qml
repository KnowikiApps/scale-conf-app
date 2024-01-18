import QtQuick 2.0
import QtQuick.Controls 2.3

Dialog {
    title: "Delete Entry"
    standardButtons: Dialog.Ok | Dialog.Cancel

    property string talkTitle
    property ListModel model

    parent: Overlay.overlay
    anchors.centerIn: parent


    closePolicy: Popup.NoAutoClose
    modal: true
    implicitWidth: implicitContentWidth
    contentItem: Label {
        id: text
        text: "Press OK to confirm delete"
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.WordWrap
        elide: Text.ElideRight

        background: Rectangle {
            color: "lightskyblue"
        }
    }
}
