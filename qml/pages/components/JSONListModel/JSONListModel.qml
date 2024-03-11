import QtQuick 2.1

import "qrc:/js/database.js" as DB


Item {
    property string source: ""
    property var json: null
    property string reqType: ""

    property ListModel model : ListModel { id: jsonModel }

    onJsonChanged: updateJSONModel()

    Component.onCompleted: {
        var xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                try{
                    json = JSON.parse(xhr.responseText.replace(/\"abstract\"\:/g, "\"shortAbstract\":"));
                }catch(e){
                    console.log(e.name + " - "+ e.message);
                }
            }else{
                json = JSON.parse(DB.get_json(source.replace("https://scale-app-backend-113205d83b1f.herokuapp.com/", '').replace("/", '')));
            }
        };

        xhr.open("GET", source);
        xhr.send();
    }

    function updateJSONModel(){
        if (json === null){
            console.log("json empty");
            return;
        }

        jsonModel.clear();

        for(var key in json){
            jsonModel.append(json[key]);
        }

        //sync json data to the local database
        DB.add_json(JSON.stringify(json), source.replace("https://scale-app-backend-113205d83b1f.herokuapp.com/", '').replace("/", ''));
    }
}
