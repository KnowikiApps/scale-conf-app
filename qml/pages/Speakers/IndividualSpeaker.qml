import QtQuick 2.0
import QtQuick.Layouts 1.0

ColumnLayout {
    spacing: 0

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
            text: "SPEAKERS"
//            font.family: sourceCodeProBlack.name
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
        source: _pic
        width: parent.width
        height: width
        fillMode: Image.PreserveAspectCrop
    }
    Text{
        text: _name
    }
    Text{
        text: _title
    }
    Text{
        text: _website.name
    }
    Text{
        text: _website.url
    }
    Text{
        text: _bio
    }
}
