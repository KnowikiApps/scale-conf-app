import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ListView {
    id: schedule
    width: 180; height: 300
    model: SignModel{}

    delegate: Row {
        Text { text: title }
        Text { text: room }
        Text { text: day }
        Text { text: time }
        Text { text: topic }
    }
}
