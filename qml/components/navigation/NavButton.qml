import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Button {
    Layout.preferredWidth: menu.width
    Layout.preferredHeight: 40
    width: menu.width
    property string buttonText: ""

    FontLoader {
        id: sourceCode
        source: "qrc:/fonts/SourceCodePro-Black"
    }

    contentItem: RowLayout {
        id: navButtonRoot

        Text {
            anchors.left: navButtonRoot.left
            color: "#eb6c4b"
            text: "*"
            font.family: sourceCode.name
            font.pointSize: 16
            font.weight: Font.Black
            verticalAlignment: Text.AlignTop
            elide: Text.ElideRight
        }

        Text {
            anchors.right: navButtonRoot.right
            color: "#1d3261"
            text: buttonText
            font.family: sourceCode.name
            font.capitalization: Font.AllUppercase
            font.weight: Font.Black
            font.pointSize: 11
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    background: Rectangle {
        color: "#e9f2f9"
        //border.color: "black"
    }
    //padding: 12
}
