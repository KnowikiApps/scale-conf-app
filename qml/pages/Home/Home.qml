import QtQuick 2.15

Item {
    Rectangle{
        id: header
        width: window.width
        height: window.height * 0.05

        Text{
            text: "SCaLE Home"
            font.family: sourceCodeProBlack.name
            color: "#EB6C4B"

            width: header.width*0.9
            height: header.height*0.6
            anchors.right: header.right
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter

            fontSizeMode: Text.VerticalFit
            minimumPixelSize: 10
            font.pixelSize: 72
            font.weight: Font.ExtraBold

        }
    }
}
