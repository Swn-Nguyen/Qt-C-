import QtQuick
import QtQuick.Window

Window {
    id: root
    width: 200
    height: Screen.height - availableHeight + line

    visible: true
    title: qsTr("Hello World")
    color: "transparent"
    property url imgSource: "daima-db.gif"
    property int taskbar: Screen.height - availableHeight
    property int line: 20
    flags: Qt.FramelessWindowHint |Qt.Tool | Qt.WindowStaysOnTopHint

    DragHandler{
        onActiveChanged: {
            if(active)
                root.startSystemMove()
        }
    }

    Component.onCompleted: {
        x = screen.width - width
        y = availableHeight - height
    }

    MouseArea{
        anchors.fill: parent
        // property point pos
        // onPressed: function(mouse){
        //     pos = Qt.point(mouse.x, mouse.y)
        // }
        // onPositionChanged: function(mouse){
        //     if(pressed){
        //         root.x += mouse.x - pos.x
        //         root.y += mouse.y - pos.y
        //     }
        // }
    }

    Rectangle{
        id: rectID
        color: "transparent"
        anchors.fill: parent
        AnimatedImage {
            id: gifID
            source: imgSource
            width: parent.width - 80
            height: parent.height - line

            anchors.right: parent.right
            anchors.bottom:  parent.bottom
        }

        Item {
            id: itemID
            anchors {
                bottom: parent.bottom
                left: parent.left
            }
            height: parent.height - line
            width: 80
            Rectangle {
                id: rectBtnID
                color: "transparent"
                height: parent.height
                width: 20
                Text{
                    text: "▲"
                    font.pixelSize: 10
                    color: tapHandle.pressed ? "black": "white"
                    anchors.centerIn: rectBtnID
                }

                TapHandler {
                    id: tapHandle
                }
            }

            Rectangle{
                id: recTimeID

                anchors{
                    top: parent.top
                    left: rectBtnID.right
                }

                height: parent.height
                width: 60

                Text {
                    id: textTimeID
                    text: Qt.formatTime(new Date(), "hh:mm:ss")
                    color: "black"
                    font.pointSize: 10
                    anchors.top: parent.top
                }
                Text {
                    id: toTimeID
                    text: "👨‍💻→🚙🛣️"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: textTimeID.bottom
                }
                Text {
                    id: endTimeID
                    text: Qt.formatTime(new Date(), "hh:mm:ss")
                    color: "pink"
                    font.pointSize: 10
                    anchors.top: toTimeID.bottom
                }
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            textTimeID.text = Qt.formatTime(new Date(), "hh:mm:ss")
        }
    }
}