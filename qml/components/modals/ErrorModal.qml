import QtQuick 2.0
import QtQuick.Controls 2.3

Dialog {
    title: "Can't Connect to Wi-Fi"
    standardButtons: Dialog.Ok

    parent: Overlay.overlay
    anchors.centerIn: parent


    closePolicy: Popup.NoAutoClose
    modal: true
    implicitWidth: implicitContentWidth
    contentItem: Label {
        id: text
        text: "There was an error downloading the schedule, check your internet connection and try again"
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.WordWrap
        elide: Text.ElideRight

        background: Rectangle {
            color: "lightskyblue"
        }
    }
}
