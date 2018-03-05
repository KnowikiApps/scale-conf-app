.import "database.js" as Database

var evtCount = 0;

function mark_day() {
    evtCount = evtCount + 1;
    if (evtCount === 1)
        return "Thu, Mar 8";
    else if (evtCount === 21)
        return "Fri, Mar 9";
    else if (evtCount === 90)
        return "Sat, Mar 10";
    else if (evtCount === 162)
        return "Sun, Mar 11";
    else
        return "";
}

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

    doc.open("GET", "https://www.socallinuxexpo.org/scale/16x/sign.xml");
    doc.send();
}

function seenFirstOf(dayOfWeek) {
    return firstEventSeen[dayOfWeek];
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















