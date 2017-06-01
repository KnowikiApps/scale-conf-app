/*
Navigation helpers library
*/

function nav_tray_push(pageName){
    console.log("pushing onto the stack: "+pageName);
    pages.push(pageName);
    menu.close();
}
