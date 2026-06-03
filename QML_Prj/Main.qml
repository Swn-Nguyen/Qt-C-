import QtQuick
import QtQuick.Window
import QtQuick.Controls
Window {
    id: root
    width: 250
    height: taskbar + 10 + line

    visible: true
    title: qsTr("Hello World")
    color: "transparent"

    property url imgSource: "daima-db.gif"
    property int taskbar: Screen.height - availableHeight
    property int line: 20
    property int btnWidth: 20
    property bool showLine: false
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

    Rectangle {
        id: lineID
        color: "transparent"
        width: parent.width
        height: line
        visible: showLine
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        Item {
            id: itemLineID
            anchors.fill: lineID
            Rectangle {
                id: closeBtnID
                color: "green"
                height: line
                width: btnWidth
                anchors.left: parent.left

                Text {
                    id: closeText
                    text: "❎"
                    font.pixelSize: 15
                    //anchors.fill: parent
                    anchors.centerIn: parent
                }

                TapHandler{
                    gesturePolicy: TapHandler.ReleaseWithinBounds
                    onTapped: Qt.quit()
                }
            }

            Rectangle {
                id: recTimein
                color: "white"
                height: line
                width: parent.width - btnWidth
                anchors.left: closeBtnID.right
                anchors.top: parent.top
                Text{
                    id: labelID
                    text: "Time in:"
                    font.pixelSize: 15
                    anchors.left: parent.left
                }

                TextInput{
                    id: txtInH

                    color: "navy"
                    maximumLength: 2
                    text: "hh"
                    selectByMouse: true
                    font.pixelSize: 15

                }

            }

            Rectangle {
                id: rectInM
                width: line
                height: line
                border.color: "black"
                anchors{
                    left: labelID.right
                    leftMargin: 20
                }
            }
        }
    }

    Rectangle {
        id: rectID
        color: "transparent"
        width: parent.width
        height: parent.height - line
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        AnimatedImage {
            id: gifID
            source: imgSource
            width: rectID.width - 100
            height: rectID.height
            anchors.right: parent.right
            anchors.bottom:  parent.bottom
        }

        Item {
            id: itemID
            anchors {
                bottom: parent.bottom
                left: parent.left
            }
            height: parent.height
            width: 100
            Rectangle {
                id: rectBtnID
                color: "blue"
                height: parent.height
                width: btnWidth

                property bool expanded: false

                Text{
                    id: textRect
                    text: rectBtnID.expanded ? "▼" : "▲"
                    font.pixelSize: 10
                    color: tapHandle.pressed ? "black": "white"
                    anchors.centerIn: rectBtnID
                }

                TapHandler {
                    id: tapHandle
                    gesturePolicy: TapHandler.ReleaseWithinBounds
                    onTapped: {
                        showLine = !showLine
                        rectBtnID.expanded = !rectBtnID.expanded
                    }

                }
            }

            Rectangle{
                id: recTimeID
                color: "#a3f55f"
                anchors{
                    top: parent.top
                    left: rectBtnID.right
                }

                height: parent.height
                width: 80

                Text {
                    id: textTimeID
                    text: Qt.formatTime(new Date(), "hh:mm:ss")
                    font.bold: true
                    color: "black"
                    font.pointSize: 12
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: toTimeID
                    text: "👨‍💻→🚙🛣️"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: textTimeID.bottom
                    anchors.bottom: endTimeID.top
                }
                Text {
                    id: endTimeID
                    text: Qt.formatTime(new Date(), "hh:mm:ss")
                    font.bold: true
                    color: "pink"
                    font.pointSize: 12
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
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