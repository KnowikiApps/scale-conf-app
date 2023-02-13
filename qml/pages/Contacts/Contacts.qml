import QtQuick 2.1
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import "qrc:/js/database.js" as DB
import "qrc:/js/nav.js" as NavHelper

import "../../components/modals"

Rectangle {
    id: pgContacts
    width: window.width
    height: window.height

    TextField{
        id: fullText
        visible: false
        text:DB.get_contacts_csv()
    }

    CSVcopiedModal{
        id: csvCopied
        visible: false
    }

    Row {
        id: buttonRow
        spacing: 10
        layoutDirection: Qt.RightToLeft
        Button {
            id: exportButton
            text: "Export to CSV"
            onClicked: {
                fullText.selectAll();
                fullText.copy();
                console.log(fullText.text);
                csvCopied.visible = true;
            }
            background: Rectangle {
                color: "lightskyblue"
                border.color: "black"
            }
            padding: 10
        }

        Button {
            id: scanButton
            text: "Scan Badge"
            onClicked: NavHelper.nav_tray_push("qrc:/PgQrScan.qml")
            background: Rectangle {
                color: "lightskyblue"
                border.color: "black"
            }
            padding: 10
        }
    }


    ListView {
        id: contacts
        width: parent.width
        anchors.top: buttonRow.bottom
        anchors.bottom: parent.bottom

        model: ListModel {
            id: contactsModel
            Component.onCompleted: DB.get_contacts()
        }

        delegate: Rectangle {
            id: delegateRoot
            width: contacts.width
            height: lastText.height + lastText.height + phoneText.height + zipText.height + 10

            property int dividerHeight: delegateRoot.height - 10
            property int availWidth: contacts.width - 11

            Row {
                spacing: 5

                Column {
                    Text {
                        id: firstText
                        text: "First Name: " + first
                        width: delegateRoot.availWidth * 0.30
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: lastText
                        text: "Last: " + last
                        width: delegateRoot.availWidth * 0.30
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: phoneText
                        text: "Phone: " + phone
                        width: delegateRoot.availWidth * 0.30
                        maximumLineCount: 3
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: zipText
                        text: "Zip: " + zip
                        width: delegateRoot.availWidth * 0.30
                        maximumLineCount: 3
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {height: dividerHeight; color: "lightgray"; width: 1}
                Column {
                    id: rightColumn
                    Text {
                        id: emailText
                        text: "Email: " + email
                        width: delegateRoot.availWidth * 0.70
                        maximumLineCount: 3
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: companyText
                        text: "Company: " + company
                        width: delegateRoot.availWidth * 0.70
                        maximumLineCount: 3
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: titleText
                        text: "Title: " + title
                        width: delegateRoot.availWidth * 0.70
                        maximumLineCount: 3
                        wrapMode: Text.Wrap
                    }
                }
            }

            MouseArea{
                z: 1
                anchors.fill: parent
                onClicked: {
                    console.log("row clicked");
//                    NavHelper.nav_tray_push("qrc:/PresentationDetail.qml", {page: path});
                }
                onPressAndHold: {
                    console.log("row long press...");
                }
            }
        }

    }
}

