/*
Javascript library for initializing components used by the application
*/

.import "feed.js" as Feed
.import "database.js" as Database

//startup script for when the app first loads
function startup(){
    Database.create_tables();
}
