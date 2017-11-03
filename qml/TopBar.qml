import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

ToolBar{
    id: toolBar

    property real button_dimensions: window.height * 0.05

    RowLayout {
        anchors.fill: parent

        //show nav menu
        ToolButton {
            id: navMenuButton
            onClicked: menu.open()
            implicitHeight: button_dimensions
            implicitWidth: button_dimensions
            background: Image {source: "qrc:/img/navicon.svg"}
        }

        //back button
        ToolButton{
            anchors.left: navMenuButton.right
            anchors.leftMargin: 25
            //only show if there are pages in the stackview
            enabled: pages.depth > 1
            visible: enabled
            onClicked: pages.pop()
            implicitHeight: button_dimensions
            implicitWidth: button_dimensions
            width: button_dimensions
            background: Image {source: "qrc:/img/arrow-left.svg"}
        }
    }
}
