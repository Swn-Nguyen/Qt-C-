import QtQuick

Window {
    id: root
    width: height*1.586
    height: 250
    visible: true
    title: qsTr("Business Card")
    color: themeID.primaryText

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

    Theme{
        id: themeID
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
        id: cardID
        color: themeID.cardBackground

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

            ContentText.TitleText{
                id: nameID
                text: myContactInfo.name
            }




            // Text{
            //     id: nameID
            //     text: myContactInfo.name
            //     font{
            //         bold: true
            //         capitalization: Font.AllUppercase
            //         pixelSize: 26
            //     }
            //     anchors{
            //         top: parent.top
            //         left: parent.left
            //         //leftMargin: 5
            //     }
            // }

            ContentText.Btn{
                id: btnDetailsID
                btnText: "Details"
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
                // Text {
                //     id: addressID
                //     text: myContactInfo.address
                //     font.bold: true
                //     font.pointSize: 11
                // }

                ContentText.HeadingText{
                    id: addressID
                    text: myContactInfo.address
                }

                ContentText.HeadingText{
                    id: countryID
                    text: myContactInfo.country
                    anchors{
                        top: addressID.bottom
                        topMargin: 5
                    }
                }
                // Text {
                //     id: countryID
                //     text: myContactInfo.country
                //     font.bold: true
                //     font.pointSize: 12
                //     anchors{
                //         top: addressID.bottom
                //         //topMargin: 5
                //     }
                // }
                Text {
                    id: phoneID
                    color: themeID.primaryText

                    text: myContactInfo.phone
                    anchors{
                        top: countryID.bottom
                        topMargin: 5
                    }
                }

                Text {
                    id: emailID
                    color: themeID.primaryText

                    text: myContactInfo.email
                    anchors{
                        top: phoneID.bottom
                        topMargin: 5
                    }
                }

                Text {
                    id: webID
                    color: themeID.primaryText

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

                // Text {
                //     id: companyID
                //     text: myContactInfo.company
                //     font.bold: true
                //     font.pointSize: 10
                //     //font.capitalization: Font.AllUppercase
                // }
                ContentText.HeadingText{
                    id: companyID
                    text: myContactInfo.company
                }

                ContentText.HeadingText{
                    id: jobID
                    text: myContactInfo.job
                    anchors{
                        top: companyID.bottom
                        topMargin: 5
                    }
                }
                // Text {
                //     id: jobID
                //     text: myContactInfo.job
                //     font.bold: true
                //     font.pointSize: 10
                //     anchors{
                //         top: companyID.bottom
                //         topMargin: 5
                //     }
                // }
            }

        }

    }


}
