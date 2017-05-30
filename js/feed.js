/*
Library for handling the conference event feed
*/

function get_feed() {
    var doc = new XMLHttpRequest();

    //declare callback function for onreadystatechange event
    doc.onreadystatechange = function(){
        if(doc.readyState === XMLHttpRequest.HEADERS_RECEIVED){
            console.log(doc.getAllResponseHeaders());
        }else if(doc.readyState === XMLHttpRequest.DONE){
            console.log(doc.responseText);//print xml text to console
        }
    }

    doc.open("GET", "https://www.socallinuxexpo.org/scale/15x/sign.xml");
    doc.send();
}
