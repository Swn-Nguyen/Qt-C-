import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Window {
    id: root
    width: 200
    height: taskbar + 10 + line

    visible: true
    title: qsTr("Hello World")
    color: "transparent"

    property url imgSource: "daima-db.gif"
    property int taskbar: Screen.height - availableHeight
    property int line: 20
    property int btnWidth: 20
    property bool showLine: false
    property string appStartTime: ""
    property string endTimeID: ""
    property bool showFireworks: false

    flags: Qt.FramelessWindowHint |Qt.Tool | Qt.WindowStaysOnTopHint

    Settings {
        id: appSettings
        category: "app"
        property string lastGif: "daima-db.gif"
    }

    DragHandler{
        onActiveChanged: {
            if(active)
                root.startSystemMove()
        }
    }

    Component.onCompleted: {
        x = screen.width - width
        y = availableHeight - height
        
        // Lưu thời gian app được mở
        var now = new Date()
        var hours = String(now.getHours()).padStart(2, '0')
        var minutes = String(now.getMinutes()).padStart(2, '0')
        appStartTime = hours + ":" + minutes + ":" + "00"
        endTimeID = appStartTime
        
        // Tải gif đã lưu
        imgSource = appSettings.lastGif
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
                height: line
                width: btnWidth
                anchors.left: parent.left
                radius: 4
                color: "#00DD00"
                Text {
                    text: "❎"
                    font.pixelSize: 15
                    anchors.centerIn: parent
                }

                TapHandler{
                    gesturePolicy: TapHandler.ReleaseWithinBounds
                    onTapped: Qt.quit()
                }
            }

            Rectangle {
                id: imgBtnID
                height: line
                width: btnWidth
                anchors.left: closeBtnID.right
                anchors.leftMargin: 2
                radius: 4
                color: "#fcc40d"
                Text {
                    text: "🖼"
                    font.pixelSize: 15
                    anchors.centerIn: parent
                }
                
                Window {
                    id: gifSelector
                    maximumWidth: 410
                    minimumWidth:410
                    minimumHeight: 130
                    maximumHeight: 130
                    title: "GIF selector"
                    flags: Qt.Window
                    visible: false
                    
                    Rectangle {
                        id: header
                        width: parent.width
                        height: 40
                        color: "#2196F3"
                        
                        Text {
                            text: "GIF"
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        // Rectangle {
                        //     width: 30
                        //     height: 30
                        //     color: "transparent"
                        //     anchors.right: closeBtn.left
                        //     anchors.rightMargin: 5
                        //     anchors.verticalCenter: parent.verticalCenter
                            
                        //     Text {
                        //         text: "−"
                        //         color: "white"
                        //         font.pixelSize: 20
                        //         anchors.centerIn: parent
                        //     }
                            
                        //     MouseArea {
                        //         anchors.fill: parent
                        //         onClicked: gifSelector.showMinimized()
                        //     }
                        // }
                        
                        // Rectangle {
                        //     id: closeBtn
                        //     width: 30
                        //     height: 30
                        //     color: "transparent"
                        //     anchors.right: parent.right
                        //     anchors.rightMargin: 5
                        //     anchors.verticalCenter: parent.verticalCenter
                            
                        //     Text {
                        //         text: "✕"
                        //         color: "white"
                        //         font.pixelSize: 18
                        //         anchors.centerIn: parent
                        //     }
                            
                        //     MouseArea {
                        //         anchors.fill: parent
                        //         onClicked: gifSelector.close()
                        //     }
                        // }
                    }
                    
                    Flow {
                        anchors.top: header.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 10
                        spacing: 10
                        
                        Repeater {
                            model: ListModel {                              
                                ListElement { url: "bubu-dudu-sseeyall.gif" }
                                ListElement { url: "cat-driving-serious.gif" }
                                ListElement { url: "commingHome_1.gif" }
                                ListElement { url: "vegeta-in-the-rain-vegeta.gif" }
                                ListElement { url: "daima-db.gif" }
                            }
                            
                            Rectangle {
                                width: 70
                                height: 70
                                color: "#f5f5f5"
                                radius: 4
                                border.color: "#ddd"
                                border.width: 1
                                
                                AnimatedImage {
                                    source: url
                                    anchors.fill: parent
                                    anchors.margins: 2
                                    fillMode: Image.PreserveAspectFit
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        gifID.source = url
                                        gifSelector.close()
                                    }
                                }
                            }
                        }
                    }
                }
                
                TapHandler{
                    gesturePolicy: TapHandler.ReleaseWithinBounds
                    onTapped: gifSelector.visible = true
                }
            }

            Rectangle {
                id: recTimein
                color: "#0ec4b3"
                height: line
                width: parent.width - 2 * btnWidth - 4
                anchors.left: imgBtnID.right
                anchors.leftMargin: 2
                anchors.top: parent.top
                anchors.verticalCenter: parent.verticalCenter
                radius: 4
                border.color: "#B2DFDB"
                border.width: 1

                Label {
                    id: labelID
                    text: "Time:"
                    color: "white"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle {
                        color: "transparent"
                        radius: 3
                        anchors.fill: parent
                        anchors.margins: 1
                    }
                    padding: 3
                }

                Rectangle {
                    id: txtHourBg
                    width: 28
                    height: 16
                    color: "white"
                    border.color: "#00BCD4"
                    border.width: 1
                    radius: 2
                    anchors.left: labelID.right
                    anchors.leftMargin: 5
                    TextField {
                        id: txtInH
                        anchors.fill: parent
                        maximumLength: 2
                        placeholderText: "HH"
                        selectByMouse: true
                        color: "white"
                        font.pixelSize: 11
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Label {
                    id: colonID
                    text: ":"
                    color: "#00695C"
                    font.pixelSize: 12
                    font.bold: true
                    anchors.left: txtHourBg.right
                    anchors.leftMargin: 3
                    anchors.verticalCenter: parent.verticalCenter
                }

                Rectangle {
                    id: txtMinuteBg
                    width: 28
                    height: 16
                    color: "white"
                    border.color: "#00BCD4"
                    border.width: 1
                    radius: 2
                    anchors.left: colonID.right
                    anchors.leftMargin: 3


                    TextField {
                        id: txtInM
                        anchors.fill: parent
                        maximumLength: 2
                        placeholderText: "MM"
                        selectByMouse: true
                        color: "white"
                        font.pixelSize: 11
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Rectangle {
                    id: btnSet
                    width: 35
                    height: 16
                    color: "#009688"
                    radius: 3
                    anchors.left: txtMinuteBg.right
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: "SET"
                        color: "white"
                        font.pixelSize: 10
                        font.bold: true
                        anchors.centerIn: parent
                    }

                    TapHandler {
                        gesturePolicy: TapHandler.ReleaseWithinBounds
                        onTapped: {
                            var inputHour = parseInt(txtInH.text) || 0
                            var inputMinute = parseInt(txtInM.text) || 0
                            
                            // 8h48 + time input
                            var baseHour = 9
                            var baseMinute = 48
                            
                            var totalMinutes = baseHour * 60 + baseMinute + inputHour * 60 + inputMinute
                            var endHour = Math.floor(totalMinutes / 60) % 24
                            var endMinute = totalMinutes % 60
                            
                            endTimeID = String(endHour).padStart(2, '0') + ":" + String(endMinute).padStart(2, '0') + ":" + "00"
                            //console.log("Time In: " + txtInH.text + ":" + txtInM.text)
                            //console.log("End Time: " + endTimeID)
                            
                            txtInH.focus = false
                            txtInM.focus = false

                            rectBtnID.expanded = false
                            showLine = false
                        }
                    }
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
            
            onSourceChanged: {
                appSettings.lastGif = source
            }
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
                color: "transparent"
                height: parent.height
                width: btnWidth

                property bool expanded: false

                Text{
                    id: textRect
                    text: rectBtnID.expanded ? "▼" : "▲"
                    font.pixelSize: 10
                    color: tapHandle.pressed ? "black": "blue"
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
                color: "white"
                anchors{
                    top: parent.top
                    left: rectBtnID.right
                }
                border{
                    color: "#71bbeb"
                    width: 3
                }
                height: parent.height
                width: 80

                Text {
                    id: textTimeID
                    text: Qt.formatTime(new Date(), "hh:mm:ss")
                    font.bold: true
                    color: "#a0cce8"
                    font.pointSize: 12
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: toTimeID
                    text: "👨‍💻→🚙🛣"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: textTimeID.bottom
                    anchors.bottom: endTimeID.top
                }
                Text {
                    id: endTimeDisplay
                    text: root.endTimeID
                    font.bold: true
                    color: "#00BCD4"
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
            // Kiểm tra khi thời gian hiện tại bằng thời gian kết thúc
            if (textTimeID.text === endTimeDisplay.text && !showFireworks) {
                showFireworks = true
                fireworksTimer.start()
            }
        }
    }

    Window {
        id: fireworksOverlay
        width: Screen.width
        height: Screen.height
        x: 0
        y: 0
        visible: showFireworks
        color: "transparent"
        flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
        
        AnimatedImage {
            anchors.centerIn: parent
            source: "confetti-montego.gif"
            width: Math.min(parent.width, parent.height) * 0.8
            height: width
        }
    }

    Timer {
        id: fireworksTimer
        interval: 1000
        running: false
        repeat: false
        onTriggered: {
            showFireworks = false
        }
    }
}
