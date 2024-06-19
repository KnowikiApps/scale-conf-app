import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
// import QtQuick.Dialogs 1.2

import "components/modals"
import "components/navigation"

import "qrc:/js/database.js" as DB
import "qrc:/js/initialize.js" as Initializer
import "qrc:/js/nav.js" as NavHelper

ApplicationWindow {
    id: window
    visible: true
    width: 500
    height: 700

    property alias drawerPosition: menu.position

    //run app startup code
    Component.onCompleted: Initializer.startup()

    //set the tool bar to the header
    header: TopBar{id:topBar}

    //declare the nav menu container
    NavMenu{id: menu}

    //declare the page manager
    StackView{
        id:pages
        Component.onCompleted: NavHelper.nav_tray_push("qrc:/pages/Home/Home.qml")
    }

    ErrorModal {
        id: errorDialog
    }

    ScheduleAddedModal {
        id: addedModal
    }

    EventAlreadySavedModal {
        id: savedAlreadyModal
    }

    ScheduleDeleteModal {
        id: confirmDelete
        onAccepted: {
            console.log("deleting: " + talkTitle);
            DB.remove_schedule_entry(talkTitle);
            model.clear();
            DB.get_schedule_list(model);
            this.close()
        }
    }

    onClosing: {
        close.accepted = false;
        if(pages.depth > 1){
            pages.pop();
        }
    }
}
