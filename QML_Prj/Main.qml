import QtQuick
import QtQuick.Window

Window {
    id: root
    width: 200
    height: 100
    visible: true
    title: qsTr("Hello World")
    color: "#1e1e1e"

    // Ảnh nền (GIF)
    AnimatedImage {
        id: kamehameha
        source: "daima-db.gif"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    // Đồng hồ
    Text {
        id: timeText
        text: Qt.formatTime(new Date(), "hh:mm:ss")
        color: "#00ff00"
        font.pixelSize: 10
        font.bold: true
        style: Text.Outline
        styleColor: "black"

        // --- BỘ MỎ NEO GÓC PHẢI DƯỚI ---
        anchors.bottom: parent.bottom // Móc đáy chữ vào đáy cửa sổ
        anchors.right: parent.right   // Móc cạnh phải chữ vào cạnh phải cửa sổ

        // Thêm khoảng lề (margin) để chữ không bị sát rạt vào viền mép cửa sổ
        anchors.bottomMargin: 15
        anchors.rightMargin: 15
    }

    // Timer (Để bên ngoài, không cần bọc trong UI Element nào vì nó là Logic ngầm)
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            timeText.text = Qt.formatTime(new Date(), "hh:mm:ss")
        }
    }
}