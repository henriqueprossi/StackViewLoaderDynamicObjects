import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    anchors.fill: parent

    property int buttonRowHeight: 50
    property int buttonRowWidth: root.width/2
    property int buttonsSpacing: 5
    property list<string> pagesList: [
        "GridOne.qml", "GridTwo.qml"
    ]
    property int currentPageIndex: 0


    function setInitialPage() {
        currentPageIndex = 0;
    }

    function goToPreviousPage() {

        // Do nothing if initial page is loaded.
        if (stackView.depth === 1) {
            return;
        }
        stackView.pop();
    }

    function goToNextPage() {

        // Do nothing if last page is loaded.
        if (stackView.depth === pagesList.length) {
            return;
        }
        stackView.push(pagesList[stackView.depth]);
    }

    Rectangle {
        id: stackViewRect
        height: parent.height - buttonRowHeight
        width: parent.width
        color: Qt.rgba(0,0,0,0) // transparent
        anchors {
            top: parent.top
            left: parent.left
        }

        StackView {
            id: stackView
            anchors {
                fill: parent
            }
            initialItem: pagesList[0]
        }
    }

    Rectangle {
        id: buttonRect
        height: buttonRowHeight
        width: parent.width
        //color: Qt.rgba(0,0,0,0) // transparent
        color: "white"
        anchors {
            top: stackViewRect.bottom
        }

        RowLayout {
            id: buttonRow
//            spacing: buttonsSpacing
//            anchors {
//                //horizontalCenter: parent.horizontalCenter
//                //bottom: parent.bottom
//                //margins: buttonsSpacing
//                fill: parent
//                margins: buttonsSpacing
//            }
            height: parent.height - 2*buttonsSpacing
            width: buttonRowWidth
            spacing: buttonsSpacing
            anchors {
                centerIn: parent
                margins: buttonsSpacing
            }

            Button {
                id: previousButton
                text: "Anterior"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    goToPreviousPage();
                }
            }

            Button {
                id: nextButton
                text: "Próximo"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    goToNextPage();
                }
            }
        }
    }
}
