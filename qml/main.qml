import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.1
import "qrc:/js/database.js" as DB
import "qrc:/js/initialize.js" as Initializer

ApplicationWindow {
    id: window
    visible: true
    width: 500
    height: 700

    //run app startup code
    Component.onCompleted: Initializer.startup()

    //set the tool bar to the header
    header: TopBar{id:topBar}

    //declare the nav menu container
    NavMenu{id: menu}

    //declare the page manager
    StackView{
        id:pages
        initialItem: "qrc:/PgHome.qml"
    }

    ErrorModal {
        id: errorDialog
    }

    ScheduleAddedModal {
        id: addedModal
    }
}
