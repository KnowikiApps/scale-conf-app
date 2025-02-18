import QtQuick 2.0
import QtQml.XmlListModel
import "qrc:/js/feed.js" as Feed
import "qrc:/js/database.js" as DB

XmlListModel{
    id: announcementsModel
    source:"https://www.socallinuxexpo.org/announcementappdata/22x"
    query: "/nodes/node"

    XmlListModelRole {name: "title"; elementName: "Title"}
    XmlListModelRole {name: "body"; elementName: "Body"}

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
            default:
                break;
        }
    }
}
