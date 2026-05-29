import QtQuick

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#ADD8E6"

    component SquareButton: Rectangle{
        id: root
        signal activated(xPosition:real, yPosition:real)
        signal deactivated

        property int side: 100
        width: side; height: side
        color: "#B2D8FF"
        MouseArea{
            anchors.fill: parent
            onReleased: root.deactivated()
            onPressed: (mouse) => root.activated(mouse.z, mouse.y)
        }
    }
    SquareButton{
        onDeactivated: console.log("deactived")
        onActivated: (xPosition, yPosition) =>
                     console.log("Actived at:", xPosition, yPosition)
    }
}

