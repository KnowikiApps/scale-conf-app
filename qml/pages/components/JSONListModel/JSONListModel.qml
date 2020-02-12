import QtQuick 2.0


Item {
    property string source: ""

    property ListModel model : ListModel { id: jsonModel }

    Component.onCompleted: {
            var xhr = new XMLHttpRequest;
            xhr.open("GET", source);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE)
                    json = xhr.responseText;
            }
            xhr.send();
        }

    function updateJSONModel() {
            jsonModel.clear();

            if ( json === "" )
                return;

            var objectArray = JSON.parse;
            for ( var key in objectArray ) {
                var jo = objectArray[key];
                jsonModel.append( jo );
            }
        }

}
