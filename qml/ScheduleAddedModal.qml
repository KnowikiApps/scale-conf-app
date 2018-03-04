import QtQuick 2.0
import QtQuick.Dialogs 1.1

MessageDialog {
    id: addedModal
    title: "Success!"
    text: "Event was added to your schedule"
    standardButtons: StandardButton.Ok
    icon: StandardIcon.NoIcon;
    modality: Qt.WindowModal
    onAccepted: this.close()
}
