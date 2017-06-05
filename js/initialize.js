/*
Javascript library for initializing components used by the application
*/

.import "feed.js" as Feed
.import "database.js" as Database

//startup script for when the app first loads
function startup(){
    Feed.get_feed();//get event feed xml file
//    Database.create_tables();
//    Database.add_record("speakers", {first:"doug", last:"johnson", company:"Balls Corp", position:"fondler", bio:"doug loves balls"});
}
