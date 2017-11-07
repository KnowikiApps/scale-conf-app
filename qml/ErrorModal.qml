import QtQuick 2.0
import QtQuick.Dialogs 1.1

MessageDialog {
    id: errorDialog
    title: "Can't Connect to Wi-Fi"
    text: "There was an error downloading the schedule, check your internet connection and try again"
    standardButtons: StandardButton.Ok
    icon: StandardIcon.Critical;
    modality: Qt.WindowModal
    onAccepted: this.close()
}
