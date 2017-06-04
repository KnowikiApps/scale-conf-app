/*
Library for accessing and manipulating the local database
*/

.import QtQuick.LocalStorage 2.0 as Sql

function connect_db(name, version, desc, size){
    return Sql.LocalStorage.openDatabaseSync(name, version, desc, size);
}

function create_tables(){
    var tables = ["speakers(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, first TEXT, last TEXT, company TEXT, position TEXT, bio TEXT)",
                  "presentations(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, title TEXT, room TEXT, day_time TEXT, speakers TEXT, topic TEXT, abstract TEXT, photo TEXT, path TEXT) UNIQUE(room, day_time)"]

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

/*
  Add a record to a database table
  @param - table_name - string with table name
  @param - json_data - JSON object formatted with `column_name: data`
*/
function add_record(table_name, json_data){
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);
    try{
        db.transaction(function(tx){
            tx.executeSql("INSERT INTO "+ table_name + get_sql(json_data));
        })
    }catch(err){
        console.log("Error inserting record: " + err);
    };
}

/*
  Helper function for turning a json object into columns and values syntax.
  JSON should be formated like: column_name: "value"
*/
function get_sql(json_object){
    var cols = "(";
    var vals = "VALUES (";
    for(var x in json_object){
        cols = cols.concat("'", x, "', ");
        vals = vals.concat("'", json_object[x], "', ");
    }

    cols = cols.slice(0, cols.length - 2) + ") ";
    vals = vals.slice(0, vals.length - 2) + ")";
    return cols + vals;
}











