import QtQuick
import QtQuick.Window

Window {
    id: root
    width: 1024
    height: 680
    visible: true
    title: qsTr("InfotainmentExample")

    Image {
        id: backgroundImage
        anchors.fill: parent
        fillMode: Image.Tile
        source: "qrc:/assets/stockWallpaper.jpg"
    }

    StatusBar {
        id: statusBar
        height: 50
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        onGoBack: {
            mainLoader.source = "StackViewPage.qml"
        }
    }

    Loader {
        id: mainLoader
        anchors {
            left: parent.left
            right: parent.right
            top: statusBar.bottom
            bottom: parent.bottom
        }
        source: "StackViewPage.qml"
    }
}
