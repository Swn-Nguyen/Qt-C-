import QtQuick

Item {
    Theme{
        id: themeID
    }

    component TitleText: Text{
        id: titleID
        text: "Title text"
        color: themeID.primaryText
        font{
            bold: true
            pointSize: 23
            capitalization: Font.AllUppercase
        }
    }

    component HeadingText: Text{
        id: headingID
        text: "Heading text"
        color: themeID.primaryText
        font{
            bold: true
            pointSize: 10
        }
    }

    component BodyText: Text{
        id: headingID
        text: "Heading text"
        color: themeID.primaryText
        font{
            bold: false
            pointSize: 8
        }
    }

    component Btn: Rectangle{
        id: btnID
        height: 30
        width: 100
        radius: height/2
        signal clicked
        property bool checked: false
        property bool checkable: true
        property alias btnText: btnName.text
        color: btnID.checked || TapHandler.pressed? themeID.buttonColor : themeID.buttonTextColor

        anchors{
            bottom: parent.bottom
            left: parent.left
            margins: 5
        }



        border{
            color: btnID.checked || TapHandler.pressed? themeID.buttonTextColor : themeID.buttonColor
            //width: 2
        }

        Text {
            id: btnName
            text: qsTr("Button")
            color: btnID.checked || TapHandler.pressed? themeID.buttonTextColor : themeID.buttonColor
            font{
                bold: true
                pixelSize: 15
            }

            anchors{
                centerIn: btnID
            }
        }

        TapHandler{

            onTapped: {
                if(btnID.checkable){
                    btnID.checked = !btnID.checked
                }
                btnID.clicked()
            }
        }
    }
}
