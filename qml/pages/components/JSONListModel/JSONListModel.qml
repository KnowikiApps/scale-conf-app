import QtQuick 2.0


Item {
    property string source: ""
    property var json: null

    property ListModel model : ListModel { id: jsonModel }

    onJsonChanged: updateJSONModel()

    Component.onCompleted: {
        var xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                try{
                    json = JSON.parse(xhr.responseText);
                }catch(e){
                    console.log(e.name + " - "+ e.message);
                }
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

//        console.log(JSON.stringify(json["62"]));
//        jsonModel.append(json["62"]);
//        jsonModel.append(json["116"]);
//        jsonModel.append(json["259"]);

        for(var key in json){
            jsonModel.append(json[key]);
        }
    }
}
