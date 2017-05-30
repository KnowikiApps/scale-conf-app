/*
Javascript library for initializing components used by the application
*/

.import "feed.js" as Feed

//startup script for when the app first loads
function startup(){
    Feed.get_feed();//get event feed xml file
}
