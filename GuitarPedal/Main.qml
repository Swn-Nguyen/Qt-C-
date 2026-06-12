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
    property url ledOn_URL: "00-Assets/assets/LED-Checked.png"
    property url ledOff_URL: "00-Assets/assets/LED.png"
    property url dialURL: "00-Assets/assets/Knob-Dial.png"

    FontLoader {
        id: prismaFont
        source: "00-Assets/fonts/Prisma.ttf"
    }

    FontLoader {
        id: russoFont
        source: "00-Assets/fonts/RussoOne-Regular.ttf"
    }

    Image {
        id: backGroundID
        source: backGroundURL
        anchors.fill: parent
    }

    component LabelGroup: Column {
        property alias content: label.text
        property alias fontLoader: label.font.family
        property alias fontSize: label.font.pixelSize
        property int lineWidth

        spacing: 5

        Rectangle {
            id: recContent
            height: 2
            width: lineWidth
            color: "black"
        }

        LabelName {
            id: label
        }

        Rectangle {
            height: 2
            width: lineWidth
            color: "black"
        }
    }

    component LabelName: Text {
        font.bold: true
        font.capitalization: Font.AllUppercase
        anchors.horizontalCenter: parent.horizontalCenter
    }

    component SwitchImage: Image {
        required property string sourceBaseName
        property bool touched
        source: `00-Assets/assets/${sourceBaseName}${touched? "-Checked" : ""}.png`
    }

    component DeviceSwitch: SwitchImage {
        property alias tapMargin: tapHandler.margin

        TapHandler {
            id: tapHandler
            onTapped: parent.touched = !parent.touched
        }
    }

    component DeviceDial: Image {



        id: dial
        source: dialURL

    }

    Item {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 17
        anchors.bottomMargin: 17



        component ScrewImage: Image {
            source: screwURL
        }

        ScrewImage {
            anchors.top: parent.top
            anchors.left: parent.left
        }

        ScrewImage {
            anchors.top: parent.top
            anchors.right: parent.right
        }

        ScrewImage {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }

        ScrewImage {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }

        LabelGroup {
            anchors.top: parent.verticalCenter
            anchors.topMargin: 16
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            content: qsTr("time blender")
            fontLoader: prismaFont.name
            fontSize: 18
            lineWidth: 200
        }

        LabelGroup {
            anchors.top: parent.top
            anchors.topMargin: 60
            anchors.left: parent.left
            spacing: 5
            content: qsTr("out")
            fontLoader: russoFont.name
            fontSize: 8
            lineWidth: 30
        }

        LabelGroup {
            anchors.top: parent.top
            anchors.topMargin: 60
            anchors.right: parent.right
            spacing: 5
            content: qsTr("in")
            fontLoader: russoFont.name
            fontSize: 8
            lineWidth: 30
        }

        // Rectangle {
        //     id: touchPad
        //     height: 100
        //     width: 200
        //     anchors.bottom: parent.bottom
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     color: touched ? "#2c2e33" : "black"

        //     TapHandler {
        //         onPressedChanged: touched = !touched
        //     }
        // }


    }

    DeviceSwitch {
        sourceBaseName: "Switch"
        x: 2*parent.width/3 - width/2
        y: 14
        tapMargin: 16
        LabelName {
            text: qsTr("mode")
            anchors.top: parent.bottom
            anchors.topMargin: 4
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    SwitchImage {
        sourceBaseName: "LED"
        x: parent.width/3 - width/2
        y: 14
        touched: btnPedal.touched
        LabelName {
            text: qsTr("check")
            anchors.top: parent.bottom
            anchors.topMargin: 4
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    DeviceSwitch {
        id: btnPedal
        sourceBaseName: qsTr("Button-Pedal")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 17
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
