import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "qrc:/js/feed.js" as Feed
import "qrc:/js/database.js" as DB
import '../components/JSONListModel'

Item {
    property string day: ""

    JSONListModel {
        id: jsonModel
        source: "https://scale-app-backend.onrender.com/events/" + day
    }

    function setDay(currentDay) {
        day = currentDay
    }

    function getModelID() {
        return jsonModel;
    }
}

/*
XmlListModel{
    id: model
    source:"https://www.socallinuxexpo.org/scale/17x/sign.xml"
    query: "/nodes/node"

    XmlRole { id: titleRole; name: "title"; query: "Title/string()" }
    XmlRole { id: roomRole; name: "room"; query: "Room/string()" }
    XmlRole { id: dayRole; name: "day"; query: "Day/string()" }
    XmlRole { id: timeRole; name: "time"; query: "Time/string()" }
    XmlRole { id: speakersRole; name: "speakers"; query: "Speakers/string()" }
    XmlRole { id: topicRole; name: "topic"; query: "Topic/string()" }
    XmlRole { id: abstractRole; name: "shortabstract"; query: "Short-abstract/string()" }
    XmlRole { id: photoRole; name: "photo"; query: "Photo/string()" }
    XmlRole { id: pathRole; name: "path"; query: "Path/string()" }

    Component.onCompleted: {Feed.get_feed()}

    onProgressChanged: {
        console.log("progress -> "+progress);
        if(progress < 1){
            //TODO - popup progress bar modal
            //TODO - update progress bar value
        }else{
            //TODO - close progress bar popup
        }
    }

    onStatusChanged: {
        switch(status){
            case 0:
                console.log("Null - No XML data has been set for this model.");
                break;
            case 1:
                console.log("Ready - The XML data has been loaded into the model.");
                break;
            case 2:
                console.log("Loading - The model is in the process of reading and loading XML data.");
                break;
            case 3:
                console.log("Error - An error occurred while the model was loading");
                console.log(errorString());
                xml = DB.get_xml("sign_data");
                var timer = Qt.createQmlObject("import QtQuick 2.0; Timer {}", model);
                timer.interval = 300000;
                timer.triggered.connect(function(){
                    console.log("retrying fetching sign data...");
                    xml = "";
                });
                timer.start();
                errorDialog.open();
                break;
            default:
                break;
        }
    }
}
*/
