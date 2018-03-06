/*
Library for accessing and manipulating the local database
*/

.import QtQuick.LocalStorage 2.0 as Sql

function connect_db(name, version, desc, size){
    return Sql.LocalStorage.openDatabaseSync(name, version, desc, size);
}

function create_tables(){
    var table_defaults = "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE";
    var tables = [
                "sign_data(" + table_defaults + ", updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, xml_data TEXT UNIQUE)",
                "contacts(" + table_defaults + ", badge TEXT UNIQUE, first TEXT, last TEXT, email TEXT, title TEXT, company TEXT, phone TEXT, zip TEXT)",
                "announcements(" + table_defaults + ", updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, xml_data TEXT UNIQUE)",
                "schedule_list(" + table_defaults + ", time TEXT, talkTitle TEXT, room TEXT, path TEXT)",
            ];
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

function add_xml(xml_data, table_name){
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);
    try{
        db.transaction(function(tx){
            tx.executeSql("INSERT INTO `"+ table_name + "`(`xml_data`) VALUES (?)", [xml_data]);
        })
    }catch(err){
        console.log("add_xml() -> " + err);
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
            tx.executeSql("INSERT INTO "+ table_name + " " + get_sql(json_data));
        })
        addedModal.open();
    }catch(err){
        console.log("add_record() -> " + err);
        throw err; //pass error on to component for handling
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

function get_xml(table) {
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);
    try{
        var xml;
        db.transaction(function(tx){
            xml = tx.executeSql("SELECT * FROM "+ table + " ORDER BY id DESC LIMIT 1");
        });
        return xml.rows.item(0).xml_data;
    }catch(err){
        console.log("get_xml() -> " + err);
    };
}

/*
  Adds contact info from the QR scanner to the database
  @param = {array} info - array of strings with info from badge
*/
function add_contact(info) {
    var json_data = {
        badge: info[0],
        first: info[1],
        last: info[2],
        email: info[3],
        title: info[4],
        company: info[5],
        phone: info[6],
        zip: info[7],
    };
    add_record("contacts", json_data);
}

function get_schedule_list() {
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);
    db.transaction(function(tx) {
        var results = tx.executeSql("SELECT * FROM schedule_list");

        for (var i = 0; i < results.rows.length; ++i) {
            scheduleListModel.append({
                                         id: results.rows.item(i).rowid,
                                         time: results.rows.item(i).time,
                                         talkTitle: results.rows.item(i).talkTitle,
                                         room: results.rows.item(i).room,
                                         path: results.rows.item(i).path,
            });
        }
    });
}

function remove_schedule_entry(title) {
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);

    db.transaction(function(tx) {
        try {
            tx.executeSql("DELETE FROM schedule_list WHERE talkTitle='" + title + "'");
        }
        catch(err) {
            console.log("remove_schedule_entry() -> " + err);
        }
    });
}

function get_contacts() {
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);

    db.transaction(function(tx){
        var results = tx.executeSql("SELECT * FROM contacts ORDER BY id DESC");

        for (var i = 0; i < results.rows.length; i++) {
            contactsModel.append({
                                     id: results.rows.item(i).rowid,
                                     badge: results.rows.item(i).badge,
                                     first: results.rows.item(i).first,
                                     last: results.rows.item(i).last,
                                     email: results.rows.item(i).email,
                                     title: results.rows.item(i).title,
                                     company: results.rows.item(i).company,
                                     phone: results.rows.item(i).phone,
                                     zip: results.rows.item(i).zip,
                                 });
        }
    });
}

function get_contacts_csv() {
    var db = connect_db("ScalConf", "1.0", "Scale Conference App", 1000000);
    var csv_string = "First Name, Last Name, Title, Company, email, Phone, Zip,\n";

    db.transaction(function(tx){
        var results = tx.executeSql("SELECT * FROM contacts");

        for (var i = 0; i < results.rows.length; i++) {
            csv_string += results.rows.item(i).first + ",";
            csv_string += results.rows.item(i).last + ",";
            csv_string += results.rows.item(i).title + ",";
            csv_string += results.rows.item(i).company + ",";
            csv_string += results.rows.item(i).email + ",";
            csv_string += results.rows.item(i).phone + ",";
            csv_string += results.rows.item(i).zip + ",\n";
        }
    });
    return csv_string;
}









