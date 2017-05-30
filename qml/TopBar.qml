import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ToolBar{
    RowLayout {
        anchors.fill: parent

        //show nav menu
        ToolButton {
            text: "☰"
            onClicked: menu.open()
        }

        //back button
        ToolButton{
            text: "←"
            //only show if there are pages in the stackview
            enabled: pages.depth > 1
            onClicked: pages.pop()
        }
    }
}
