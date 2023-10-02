import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property int buttonsRowWidth: root.width/2
    property int dateWidth: root.width/4
    //property string dateString: Date().toLocaleString(Locale.Brazil, Locale.ShortFormat)
    property string dateString: "20:10:52"
    property int dateStringSize: 20
    property color backgroundColor: "black" //Qt.rgba(0,0,0,0) // transparent
    property color textColor: "white"
    property int buttonsSpacing: 5

    signal goBack();

    width: parent.width

    Rectangle {
        id : statusBarRect
        color: backgroundColor
        anchors.fill: parent
        RowLayout {
            id: buttonRow
            height: parent.height - 2*buttonsSpacing
            width: buttonsRowWidth
            spacing: buttonsSpacing
            anchors {
                left: parent.left
                top: parent.top
                margins: buttonsSpacing
            }

            Button {
                id: backButton
                text: "<b>VOLTAR</b>"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: {
                    root.goBack();
                }
            }

            Button {
                id: homeButton
                text: "<b>PÁGINA INICIAL</b>"
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

//            Button {
//                id: favButton
//                text: "Fav"
//                Layout.fillWidth: true
//                Layout.fillHeight: true
//            }
        }

        Text {
            id: dateText
            width: dateWidth
            height: parent.height
            anchors {
                top: parent.top
                right: parent.right
                rightMargin: 20
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font {
                pixelSize: dateStringSize
                bold: true
                //font: ""
            }
            color: textColor
            text: dateString
        }
    }
}
