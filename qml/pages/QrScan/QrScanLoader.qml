import QtQuick 2.5
import QtQuick.Controls 2.0

Item {
    width: 100
    height: 100

    // load and unload the Scanner page so that the camera is only in use when active

    StackView.onActivated: loader.source = "qrc:/pages/QrScan/QrScan.qml"
    StackView.onDeactivated: loader.source = ""

    Loader {
        id: loader
    }
}
