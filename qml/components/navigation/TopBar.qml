import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "qrc:/js/nav.js" as NavHelper

ToolBar{
    id: toolBar
    background: Rectangle {
        anchors.fill: parent
        color: "#ffffff"
    }

    property real button_dimensions: window.height * 0.05
    property bool hideNavBtn: false

    RowLayout {
        anchors.fill: parent

        //show nav menu
        ToolButton {
            id: navMenuButton
            visible: !toolBar.hideNavBtn
            onClicked: menu.open()
            implicitHeight: button_dimensions
            implicitWidth: button_dimensions * 1.2
            background: Rectangle {
                color: "#8cadc8"
                radius: 7

                Image {
                    source: "qrc:/img/SCaLE_icons-03_menu-hamburger.svg"
                    fillMode: Image.PreserveAspectFit
                    width: button_dimensions * 0.6
                    height: button_dimensions * 0.7
                    anchors.centerIn: parent
                }
            }
        }

        //back button
        ToolButton{
            id: backButton
            Layout.alignment: Qt.AlignLeft
            //only show if there are pages in the stackview
            enabled: pages.depth > 1
            visible: enabled
            onClicked: {
                pages.pop();
                toolBar.hideNavBtn = false;
            }
            Layout.preferredHeight: button_dimensions
            Layout.preferredWidth: button_dimensions
            background: Image {source: "qrc:/img/arrow-left.svg"}
        }

        Rectangle {
            id: homeRect
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: window.width * 0.5
            Layout.preferredHeight: button_dimensions
            color: "#8cadc8"

            Image {
                id: logoImage
                anchors.left: homeRect.left
                sourceSize.width: homeRect.width * 0.89
                height: button_dimensions
                source: "qrc:img/SCaLE_icons-01_logo.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

//        ToolButton {
//            anchors.left: homeRect.right
//            anchors.top: homeRect.top
//            onClicked: console.log('clicked')
//            z: 2

//            background: Rectangle {
//                color: "#8cadc8"
//                width: button_dimensions
//                height: button_dimensions
//                z: 1

//                Image {
//                    source: "qrc:/img/SCaLE_icons-02_home.svg"
//                    fillMode: Image.PreserveAspectFit
//                    width: button_dimensions
//                    height: button_dimensions
//                }
//            }
//        }
    }
}
