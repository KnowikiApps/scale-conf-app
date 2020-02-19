import QtQuick 2.0


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
    }
}
