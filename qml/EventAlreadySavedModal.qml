import QtQuick 2.0
import QtQuick.Dialogs 1.1

MessageDialog {
    id: savedAlreadyModal
    title: "Event exists"
    text: "Event is already saved in your schedule!"
    standardButtons: StandardButton.Ok
    icon: StandardIcon.NoIcon;
    modality: Qt.WindowModal
    onAccepted: this.close()
}
