/**
MIT License

Copyright (c) 2017 Andrey Semenov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import QtQuick 2.0
import QtQuick.Controls 1.4 as OldControls
import QtQuick.Controls 2.1
import Qt.labs.folderlistmodel 2.1
import QtQuick.Window 2.0
import Qt.labs.platform 1.0
import QtQuick.Controls.Styles 1.4

import "qrc:/js/utils.js" as Utils
import "qrc:/js/database.js" as DB

Item {
	id:picker
	signal fileSelected(string fileName)
    signal fileSaved()
	readonly property real textmargin: Utils.dp(Screen.pixelDensity, 8)
	readonly property real textSize: Utils.dp(Screen.pixelDensity, 10)
	readonly property real headerTextSize: Utils.dp(Screen.pixelDensity, 12)
	readonly property real buttonHeight: Utils.dp(Screen.pixelDensity, 24)
	readonly property real rowHeight: Utils.dp(Screen.pixelDensity, 36)
	readonly property real toolbarHeight: Utils.dp(Screen.pixelDensity, 48)
	property bool showDotAndDotDot: false
	property bool showHidden: true
	property bool showDirsFirst: true
    property string folder: StandardPaths.writableLocation(StandardPaths.DownloadLocation)
	property string nameFilters: "*.*"

    function writeCsvFile(path){
        var request = new XMLHttpRequest();
        request.open("PUT", path+"/SCaLE-Contacts.csv", false);
        request.send(DB.get_contacts_csv());
        fileSaved();
    }

	function currentFolder() {
		return folderListModel.folder;
	}

	function isFolder(fileName) {
		return folderListModel.isFolder(folderListModel.indexOf(folderListModel.folder + "/" + fileName));
	}
	function canMoveUp() {
		return folderListModel.folder.toString() !== "file:///";
	}

    function onItemClick(fileName) {
		if(!isFolder(fileName)) {
			fileSelected(fileName)
			return;
		}
		if(fileName === ".." && canMoveUp()) {
			folderListModel.folder = folderListModel.parentFolder
		} else if(fileName !== ".") {
			if(folderListModel.folder.toString() === "file:///") {
				folderListModel.folder += fileName
			} else {
				folderListModel.folder += "/" + fileName
			}
		}
	}

    Rectangle {
        id: toolbar
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        height: toolbarHeight
        color: Utils.backgroundColor()
        Button {
            id: button
            text: "Save"
            anchors.right: parent.right
            anchors.rightMargin: buttonHeight
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            width: buttonHeight * 3
            background: Rectangle {
                color: "lightskyblue"
            }

            onClicked: {
                console.log(folderListModel.folder.toString());
                writeCsvFile(folderListModel.folder.toString());
            }
        }
    }

	FolderListModel {
		id:  folderListModel
		showDotAndDotDot: picker.showDotAndDotDot
		showHidden: picker.showHidden
		showDirsFirst: picker.showDirsFirst
		folder: picker.folder
		nameFilters: picker.nameFilters
        showFiles: false
	}
	OldControls.TableView {
		id: view
        anchors.top: toolbar.bottom
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		model: folderListModel
        headerDelegate:headerDelegate
		rowDelegate: Rectangle {
			height: rowHeight
        }

		OldControls.TableViewColumn {
            title: qsTr("Select a folder to save your csv file to")
			role: "fileName"
			resizable: true
			delegate: fileDelegate
		}

		Component {
			id: fileDelegate
			Item {
				height: rowHeight
				Rectangle {
					anchors.fill: parent
					MouseArea {
						anchors.fill: parent
						onClicked: {
							onItemClick(fileNameText.text)
						}
					}
					Text {
						id: fileNameText
						height: width
						anchors.left: image.right
						anchors.top: parent.top
						anchors.bottom: parent.bottom
						anchors.right: parent.right
						text: styleData.value !== undefined ? styleData.value : ""
						verticalAlignment: Text.AlignVCenter
					}
					Image {
						id: image
						height: buttonHeight
						width: height
						anchors.left: parent.left
						anchors.leftMargin: textmargin
						anchors.verticalCenter: parent.verticalCenter
                        source: isFolder(fileNameText.text) ? "qrc:/img/ic_folder_open_black_48dp.png" : "qrc:/img/ic_insert_drive_file_black_48dp.png"
					}
				}
			}
		}
		Component {
			id: headerDelegate
			Rectangle {
				height: rowHeight
				color: Utils.textAltColor()
				border.color: Utils.textAltColor()
				Text {
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
					height: headerTextSize
					font.bold: true
					elide: Text.ElideMiddle
					color: Utils.primaryColor()
					text: styleData.value !== undefined ? styleData.value : ""
				}
			}
		}
	}
}
