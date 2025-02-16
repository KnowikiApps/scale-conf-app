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
        source: "qrc:/fonts/SourceCodePro-Black.ttf"
    }

    contentItem: RowLayout {
        id: navButtonRoot

        Text {
            Layout.alignment: Qt.AlignLeft
            color: "#eb6c4b"
            text: "*"
            font.family: sourceCode.name
            font.pointSize: 16
            font.weight: Font.Black
            verticalAlignment: Text.AlignTop
            elide: Text.ElideRight
        }

        Text {
            Layout.alignment: Qt.AlignRight
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
        anchors.fill: parent
        //border.color: "black"
    }
    //padding: 12
}
