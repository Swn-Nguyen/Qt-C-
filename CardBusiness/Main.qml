import QtQuick

Window {
    id: root
    width: height*1.586
    height: 250
    visible: true
    title: qsTr("Business Card")
    color: "white"

    minimumHeight: height
    maximumHeight: height

    minimumWidth: width
    maximumWidth: width

    component ContactInfo: QtObject{
        id: contactInfoRoot
        property string name
        property url photo
        property string company
        property string address
        property string country
        property string phone
        property string email
        property string job
        property url website
    }

    ContactInfo{
        id: myContactInfo
        name: "Ng.ThanhSon"
        photo: "IDPhoto.png"
        address: "279/57 Hoang Mai Road, Ha Noi capital"
        company: "Samsung SRV"
        country: "VietNam"
        phone: "+84 936 165 591"
        email: "thanhson131101@gmail.com"
        job: "Software engineer"
        website: "studywithme.com.vn"
    }

    Rectangle{
        id: cardBackground
        color: "transparent"

        anchors{
            fill: parent
            margins: 10
        }

        border{
            color: "black"
            width: 2
        }

        radius: 15

        Item {
            id: itemCard
            anchors{
                fill: parent
                margins: 5
            }

            Rectangle{
                id: photoFrame
                property int side: 2*root.height/5
                width: side; height: side
                anchors{
                    top: parent.top
                    right: parent.right
                    margins: 5
                }
                border{
                    color: "black"
                    width: 2
                }
                radius: 5
                Image {
                    id: photoID
                    source: Qt.url(myContactInfo.photo)
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        fill: parent
                        margins: photoFrame.radius
                    }
                }
            }

            Text{
                id: nameID
                text: myContactInfo.name
                font{
                    bold: true
                    capitalization: Font.AllUppercase
                    pixelSize: 26
                }
                anchors{
                    top: parent.top
                    left: parent.left
                    //leftMargin: 5
                }
            }

            Rectangle{
                id: btnDetailsID
                height: 30
                width: 100
                radius: height/2
                signal clicked
                property bool checked: false
                property bool checkable: true
                color: btnDetailsID.checked || TapHandler.pressed? "white" : "black"

                anchors{
                    bottom: parent.bottom
                    left: parent.left
                    margins: 5
                }



                border{
                    color: btnDetailsID.checked || TapHandler.pressed? "black" : "white"
                    //width: 2
                }

                Text {
                    id: detailsName
                    text: qsTr("Details")
                    color: btnDetailsID.checked || TapHandler.pressed? "black" : "white"
                    font{
                        bold: true
                        pixelSize: 15
                    }

                    anchors{
                        centerIn: btnDetailsID
                    }
                }

                TapHandler{

                    onTapped: {
                        if(btnDetailsID.checkable){
                            btnDetailsID.checked = !btnDetailsID.checked
                        }
                        btnDetailsID.clicked()
                    }
                }
            }

            Item {
                id: detailInfo
                visible: btnDetailsID.checked
                anchors{
                    top: nameID.bottom
                    topMargin: 5
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                Text {
                    id: addressID
                    text: myContactInfo.address
                    font.bold: true
                    font.pointSize: 10
                }
                Text {
                    id: countryID
                    text: myContactInfo.country
                    font.bold: true
                    font.pointSize: 12
                    anchors{
                        top: addressID.bottom
                        //topMargin: 5
                    }
                }
                Text {
                    id: phoneID
                    text: myContactInfo.phone
                    anchors{
                        top: countryID.bottom
                        topMargin: 5
                    }
                }

                Text {
                    id: emailID
                    text: myContactInfo.email
                    anchors{
                        top: phoneID.bottom
                        topMargin: 5
                    }
                }

                Text {
                    id: webID
                    text: myContactInfo.website
                    anchors{
                        top: emailID.bottom
                        topMargin: 5
                    }
                }

            }
            Item {
                id: basicInfo
                visible: !btnDetailsID.checked
                anchors{
                    top: nameID.bottom
                    topMargin: 5
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                Text {
                    id: companyID
                    text: myContactInfo.company
                    font.bold: true
                    font.pointSize: 15
                    //font.capitalization: Font.AllUppercase
                }
                Text {
                    id: jobID
                    text: myContactInfo.job
                    font.bold: true
                    font.pointSize: 12
                    anchors{
                        top: companyID.bottom
                        topMargin: 5
                    }
                }
            }

        }

    }
}
