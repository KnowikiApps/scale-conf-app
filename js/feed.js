/*
Library for handling the conference event feed
*/

function get_feed() {
    var doc = new XMLHttpRequest();

    //declare callback function for onreadystatechange event
    doc.onreadystatechange = function(){
        if(doc.readyState === XMLHttpRequest.HEADERS_RECEIVED){
//            console.log(doc.getAllResponseHeaders());
        }else if(doc.readyState === XMLHttpRequest.DONE){
//            console.log(doc.responseText);//print xml text to console
            update_db(doc);
        }
    }

    doc.open("GET", "https://www.socallinuxexpo.org/scale/15x/sign.xml");
    doc.send();
}

function update_db(xml){
    var xmlDoc = xml.responseXML;
    var nodes = xmlDoc.documentElement.childNodes;
    for(var i = 0; i < nodes.length; i++){
        var json_data = {};
        for(var j = 0; j < nodes[i].childNodes.length; j++){
            if (nodes[i].childNodes[j].nodeType !== 3 && (typeof nodes[i].childNodes[j].childNodes[0] !== 'undefined')){
                var node_name = nodes[i].childNodes[j].nodeName;
                var node_value = nodes[i].childNodes[j].childNodes[0].nodeValue;
//                console.log("ChildNode -> name: " + node_name + "| value: " + node_value);
                json_data[node_name] = node_value;
                console.log(JSON.stringify(json_data));
                console.log("*************************************")
            }
        }
    }
}























