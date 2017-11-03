import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

ListView {
    id: schedule
    width: parent.parent.width; height: parent.parent.height
    model: SignModel{}

    delegate: Row {
        spacing: schedule.width * 0.05
        Text {
            text: time
            width: schedule.width * 0.15
            wrapMode: Text.Wrap
        }
        Text {
            text: shortabstract
            width: schedule.width * 0.6
            maximumLineCount: 3
            wrapMode: Text.Wrap
        }
        Text {
            text: room
            width: schedule.width * 0.15
            wrapMode: Text.Wrap
        }
    }
}
