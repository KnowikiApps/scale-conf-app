import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "qrc:/js/feed.js" as Feed
import "qrc:/js/database.js" as DB
import '../components/JSONListModel'

Item {
    property string day: ""

    JSONListModel {
        id: jsonModel
        source: "https://scale-app-backend-113205d83b1f.herokuapp.com/events/" + day
    }

    function setDay(currentDay) {
        day = currentDay
    }

    function getModelID() {
        return jsonModel;
    }
}
