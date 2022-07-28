import QtQuick 2.0

Item {

    Rectangle{
        id: container
        width: window.width
        height: window.height

        Image {
            id: map
            anchors.fill: parent
            source: "https://emarketing360.com/Hilton/CA/HLAX/assets/sections/content-lower.gif"

            fillMode: Image.PreserveAspectFit
        }

        MouseArea{
            anchors.fill: parent
            drag.target: container
            drag.axis: Drag.XAndYAxis

            onDoubleClicked: {
                container.x = 0;
                container.y = 0;
                map.scale = 1;
            }
        }


        PinchArea{
            anchors.fill: parent
            pinch.target: map
            pinch.minimumRotation: -360
            pinch.maximumRotation: 360
            pinch.minimumScale: 0.1
            pinch.maximumScale: 10
            pinch.dragAxis: Pinch.XAndYAxis
        }
    }



}
