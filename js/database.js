/*
Library for accessing and manipulating the local database
*/

function connect_db(name, version, desc, size){
    return LocalStorage.openDatabaseSync(name, version, desc, size);
}
