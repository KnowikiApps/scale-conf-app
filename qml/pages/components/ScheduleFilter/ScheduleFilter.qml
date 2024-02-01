import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

ColumnLayout {
    id: layout
    FontLoader { id: sourceCodeProBlack; source: "qrc:/fonts/SourceCodePro-Black.ttf" }
    z: 5

    property string currentDay: bar.currentItem.text
    property var listRef: null

    TabBar {
        id: bar
        spacing: 0

        Repeater {
            model: ["thursday", "friday", "saturday", "sunday"]
            delegate: TabButton {
                id: tabButton
                text: modelData

                contentItem: Text {
                    text: tabButton.text.toUpperCase()
                    color: "#1D3261"
                    font.family: sourceCodeProBlack.name
                    font.pointSize: 12
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignHCenter
                    elide: Text.ElideRight

                }
                width: window.width/4
                background: Rectangle {
                    color: tabButton.checked ? "#eb6c4b" : "#e9f2f9"
                }
                onClicked: {
                    if(layout.listRef){
                        layout.listRef.positionViewAtBeginning();
                    }
                }
            }
        }
    }
}
