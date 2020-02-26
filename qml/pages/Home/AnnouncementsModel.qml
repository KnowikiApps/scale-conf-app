import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "qrc:/js/feed.js" as Feed
import "qrc:/js/database.js" as DB

XmlListModel{
    id: announcementsModel
    source:"https://www.socallinuxexpo.org/announcementappdata/18x"
    query: "/nodes/node"

    XmlRole { id: titleRole; name: "title"; query: "Title/string()" }
    XmlRole { id: bodyRole; name: "body"; query: "Body/string()" }
    XmlRole { id: announcementIdRole; name: "announcementId"; query: "Announcement-ID/string()" }

    Component.onCompleted: {Feed.get_announcements()}

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
                xml = DB.get_xml("announcements");
                var timer = Qt.createQmlObject("import QtQuick 2.0; Timer {}", model);
                timer.interval = 300000;
                timer.triggered.connect(function(){
                    console.log("retrying fetching sign data...");
                    xml = "";
                });
                timer.start();
                errorDialog.text = "There was a problem downloading announcements, check your internet connection and try again"
                errorDialog.open();
                break;
            default:
                break;
        }
    }
}
