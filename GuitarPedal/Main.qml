import QtQuick

Window {
    minimumWidth: 260
    minimumHeight: 380
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    visible: true
    title: qsTr("Guitar pedal")

    property url backGroundURL: "00-Assets/assets/Guitar-Pedal-Background.png"
    property url screwURL: "00-Assets/assets/Screw.png"

    Image {
        id: backGroundID
        source: backGroundURL
        anchors.fill: parent
    }
    Item {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 17
        anchors.bottomMargin: 17

        Image {
            source: screwURL
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Image {
            source: screwURL
            anchors.top: parent.top
            anchors.right: parent.right
        }

        Image {
            source: screwURL
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }

        Image {
            source: screwURL
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }
    }
}
