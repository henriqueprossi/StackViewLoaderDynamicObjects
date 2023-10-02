import QtQuick
import QtQuick.Controls

Item {
    id: root
    ListModel {
        id: listModel
        ListElement { name: "Nine"; page: "" }
        ListElement { name: "Ten"; page: "" }
        ListElement { name: "Eleven"; page: "" }
        ListElement { name: "Twelve"; page: "" }
        ListElement { name: "Thirteen"; page: "" }
        ListElement { name: "Fourteen"; page: "" }
        ListElement { name: "Fifhteen"; page: "" }
        ListElement { name: "Sixteen"; page: "" }
    }

    Rectangle {
        id: gridViewRect
        anchors {
            fill: parent
            margins: 5
        }
        color: "white"
        //color: Qt.rgba(0,0,0,0) // transparent

        GridView {
            id: gridView
            anchors.fill: parent
            height: parent.height
            width: parent.width
            model: listModel
            cellHeight: 240
            cellWidth: 240
            clip: true
            delegate: Rectangle {
                width: 200
                height: 200
                color: "green"
                radius: 5
                Text {
                    color: "white"
                    text: name
                    anchors.centerIn: parent
                }
            }
        }
    }
}
