/*
Library for accessing and manipulating the local database
*/

.import QtQuick.LocalStorage 2.0 as Sql

function connect_db(name, version, desc, size){
    return Sql.LocalStorage.openDatabaseSync(name, version, desc, size);
}

function create_tables(){
    var tables = ["speakers(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, first TEXT, last TEXT, company TEXT, position TEXT, bio TEXT)",
                  "presentations(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, title TEXT, room TEXT, day_time TEXT, speakers TEXT, topic TEXT, abstract TEXT, photo TEXT, path TEXT)",]

    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);
    try{
        db.transaction(function(tx){
            for(var i=0; i<tables.length; i++){
                tx.executeSql("CREATE TABLE IF NOT EXISTS "+tables[i]);
            }
        })
    }catch(err){
        console.log("Error creating table in database: " + err)
    };
}
