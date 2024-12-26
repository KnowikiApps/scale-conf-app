import QtQuick
import QtQuick.Controls
import QtCore

Item {
    id: scannerLoader
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        CameraPermission {
            id: cameraPermission
        }

        states: [
            State {
                name: "cameraPermissionUnkown"
                when: cameraPermission.status === Qt.PermissionStatus.Undetermined
                PropertyChanges {
                    target: checkPermission; visible: true
                }
            },

            State {
                name: "cameraPermissionGranted"
                when: cameraPermission.status === Qt.PermissionStatus.Granted
                PropertyChanges {
                    target: loader; source : "QrScan.qml"
                }
            }
        ]



        Rectangle {
            id: checkPermission
            anchors.fill: parent
            visible: false
            Text {
                id: notice
                anchors.centerIn: parent
                text: qsTr("We need to request access to this device's camera")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: cameraPermission.request()
            }
        }

        Loader {
            id: loader
            anchors.fill: parent
        }
    }
}
