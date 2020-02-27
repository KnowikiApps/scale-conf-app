import QtQuick 2.0
import QtQuick.Layouts 1.0

ColumnLayout {
    spacing: 10

    FontLoader { id: anonymousProBold; source: "qrc:/fonts/AnonymousPro-Bold.ttf" }
    FontLoader { id: sourceCodeProBlack; source: "qrc:/fonts/SourceCodePro-Black.ttf" }

    property string _name: ""
    property string _title: ""
    property string _org: ""
    property string _pic: ""
    property string _bio: ""
    property var _website: null

    Rectangle{
        id: header
        width: window.width
        height: window.height * 0.05

        Text{
            id: headerText
            text: "SPEAKERS"
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
    Image{
        id: personPic
        source: _pic
        fillMode: Image.PreserveAspectCrop
        Layout.maximumWidth: window.width*0.6
        Layout.maximumHeight: width
        Layout.alignment: Qt.AlignCenter
    }
    Text{
        text: _name
        Layout.maximumWidth: personPic.width
        Layout.alignment: Qt.AlignCenter
        wrapMode: Text.WordWrap
        font.family: anonymousProBold.name
        font.pixelSize: headerText.contentHeight
    }
    Text{
        text: _title
        Layout.maximumWidth: personPic.width
        Layout.alignment: Qt.AlignCenter
        wrapMode: Text.WordWrap
        font.family: anonymousProBold.name
    }
    Text{
        text: _website.name
        Layout.maximumWidth: personPic.width
        Layout.alignment: Qt.AlignCenter
        wrapMode: Text.WordWrap
        font.family: anonymousProBold.name
    }
    Text{
        text: _website.url
        Layout.maximumWidth: personPic.width
        Layout.alignment: Qt.AlignCenter
        wrapMode: Text.WordWrap
        font.family: anonymousProBold.name
    }
    Text{
        text: _bio
        Layout.maximumWidth: window.width*0.8
        Layout.alignment: Qt.AlignCenter
        wrapMode: Text.WordWrap
        font.family: anonymousProBold.name
    }
}
