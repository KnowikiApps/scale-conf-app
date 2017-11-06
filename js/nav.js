/*
Navigation helpers library
*/

/*
  @param pageName - qrc:/ location of qml file to be pushed onto the nav stack
  @param props - JSON object containing properties for the new component
*/
function nav_tray_push(pageName, props){
    console.log("pushing onto the stack: "+pageName);
    pages.push(pageName, props);
    menu.close();
}
