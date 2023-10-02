import QtQuick
import QtQuick.Controls

Item {
    id: root

    property color buttonColor: "green"
    property color buttonTextColor: "white"

    ListModel {
        id: listModel
        ListElement { name: "One"; page: "ActionOne.qml" }
        ListElement { name: "Two"; page: "" }
        ListElement { name: "Three"; page: "" }
        ListElement { name: "Four"; page: "" }
        ListElement { name: "Five"; page: "" }
        ListElement { name: "Six"; page: "" }
        ListElement { name: "Seven"; page: "" }
        ListElement { name: "Eight"; page: "" }
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
                color: buttonColor
                radius: 5
                Text {
                    color: buttonTextColor
                    text: name
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (page !== "") {
                            mainLoader.source = page
                        }
                    }
                    onPressed: {
                        parent.color = Qt.lighter(parent.color)
                    }
                    onReleased: {
                        parent.color = buttonColor
                    }
                }
            }
        }
    }
}
