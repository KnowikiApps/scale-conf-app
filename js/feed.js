.import "database.js" as Database

function parseDay(day) {
    if (day.indexOf("Thursday") >= 0)
        return "Thursday";
    else if (day.indexOf("Friday") >= 0)
        return "Friday";
    else if (day.indexOf("Saturday") >= 0)
        return "Saturday";
    else if (day.indexOf("Sunday") >= 0)
        return "Sunday";
    else
        return "";
}

function dayMatches(currentDay, day) {
    if (currentDay === parseDay(day) || currentDay === "")
        return true;
    else
        return false;
}

function heightOf(currentDay, day, defaultHeight) {
    if (currentDay === parseDay(day) || currentDay === "")
        return defaultHeight;
    else
        return 0;
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















