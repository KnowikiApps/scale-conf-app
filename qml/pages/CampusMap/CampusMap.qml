import QtQuick 2.0

Item {

    Rectangle{
        width: window.width
        height: window.height

        Image {
            id: map
            anchors.fill: parent
            source: "https://1kvji02qicdj3gx383wkmt91-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2014/08/pasadena-convention-center-map.jpg"

            fillMode: Image.PreserveAspectFit
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
