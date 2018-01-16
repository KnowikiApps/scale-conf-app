.import "database.js" as Database

/*
Library for handling the conference event feed
*/
function get_feed() {
    var doc = new XMLHttpRequest();

    //declare callback function for onreadystatechange event
    doc.onreadystatechange = function(){
        if(doc.readyState === XMLHttpRequest.HEADERS_RECEIVED){
            console.log(doc.getAllResponseHeaders());
        }else if(doc.readyState === XMLHttpRequest.DONE && doc.responseText.length > 0){
            Database.add_xml(doc.responseText, "sign_data"); //add feed xml to database
        }
    }

    doc.open("GET", "https://www.socallinuxexpo.org/scale/15x/sign.xml");
    doc.send();
}

function get_announcements() {
    var doc = new XMLHttpRequest();

    //declare callback function for onreadystatechange event
    doc.onreadystatechange = function(){
        if(doc.readyState === XMLHttpRequest.HEADERS_RECEIVED){
            console.log(doc.getAllResponseHeaders());
        }else if(doc.readyState === XMLHttpRequest.DONE && doc.responseText.length > 0){
            Database.add_xml(doc.responseText, "announcements"); //add feed xml to database
        }
    }

    doc.open("GET", "https://www.socallinuxexpo.org/announcementappdata/16x");
    doc.send();
}















