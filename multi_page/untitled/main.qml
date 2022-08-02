import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 850
    height: 400
    visible: true
    title: qsTr("Hello World")

    property variant mlist: [idModelist1, idModelist2, idModelist3]     //tao ra 1 mang cac listmode de moi co phan text va anh khac nhau

    Image {         //backgroud
        anchors.fill: parent
        source: "qrc:/image1/101-anh-sieu-xe-4k-tai-free-lam-hinh-nen-dt-may-tinh.jpg"
    }

    ListModel{
        id: idModelist1
        ListElement{
            name: "<b>FM</b>"
            isource: "qrc:/image/FM.jpg"
        }
        ListElement{
            name: "<b>MAP</b>"
            isource: "qrc:/image/map.jpg"
        }
        ListElement{
            name: "<b>MEDIA</b>"
            isource: "qrc:/image/media.png"
        }
        ListElement{
            name: "<b>MUSIC</b>"
            isource: "qrc:/image/music.jpg"
        }
        ListElement{
            name: "<b>PHONE</b>"
            isource: "qrc:/image/phone.jpg"
        }
        ListElement{
            name: "<b>SETTING</b>"
            isource: "qrc:/image/setting2.png"
        }
    }
    ListModel{
        id: idModelist2
        ListElement{
            name: "<b>AUTO</b>"
            isource: "qrc:/imageleft/auto.png"
        }
        ListElement{
            name: "<b>BLACKJACK</b>"
            isource: "qrc:/imageleft/BlackJack.png"
        }
        ListElement{
            name: "<b>BOOK</b>"
            isource: "qrc:/imageleft/book.png"
        }
        ListElement{
            name: "<b>CAMERA</b>"
            isource: "qrc:/imageleft/Camera.png"
        }
        ListElement{
            name: "<b>FILM</b>"
            isource: "qrc:/imageleft/film.png"
        }
        ListElement{
            name: "<b>GAME</b>"
            isource: "qrc:/imageleft/game.png"
        }
    }
    ListModel{
        id: idModelist3
        ListElement{
            name: "<b>BLUETOOTH</b>"
            isource: "qrc:/imageright/bluetooth.png"
        }
        ListElement{
            name: "<b>CATE</b>"
            isource: "qrc:/imageright/cate.png"
        }
        ListElement{
            name: "<b>CLOUD</b>"
            isource: "qrc:/imageright/cloud.png"
        }
        ListElement{
            name: "<b>SERVER</b>"
            isource: "qrc:/imageright/server.png"
        }
        ListElement{
            name: "<b>WEB</b>"
            isource: "qrc:/imageright/web.png"
        }
        ListElement{
            name: "<b>WIFI</b>"
            isource: "qrc:/imageright/wifi.png"
        }
    }

    ListView{           //listview nay de xem cac listview đuoc long ben trong
        id: mainListView
        width: 850
        height: 200
        anchors.top: parent.top
        anchors.topMargin: 100
        snapMode: ListView.SnapOneItem          //xac dinh cac cuon che do xem se on dinh sau khi keo hoac vuot
        model: mlist            //tao ra so luong listview nho
        orientation: ListView.Horizontal        //xem tung listview dang nam ngang
        delegate:    ListView {
            id: idlist
            width: 850
            height: 200
            currentIndex: -1            //gan index ban dau cho vi tri -1, muc dich de tranh cac su kien khong mong muon khi chay chuong trinh
            orientation: ListView.Horizontal            //xem listview dang nam ngang
            spacing: 20         //khoang cach giua cac Rectangle
            model: mlist[index]         //goi den tung model trong mang mlist
            delegate: Rectangle {           //tao ra 1 hinh chu nhat lon
                id: rect
                width: 125
                height: 200
                color: focus && idlist.focus ? "blue" : "lightblue"
                radius: 15
                MouseArea{
                    anchors.fill: rect
                    onClicked: {
                        idlist.focus = true    //kiem tra trong cai listview co cai nao chon chua
                        if(idlist.focus == true && parent.focus == false){          //neu da nhap chuot vao trong listview do va doi tuong do chua chon thì sẽ doi mau
                            parent.focus = !parent.focus
                        }else if(idlist.focus == false && parent.focus == true){        //neu chua nhap chuot vao trong listview do ma van con focus true thi dao lai
                            parent.focus = !parent.focus
                        }
                    }
                }

                Rectangle{          //tao ra 1 hinh chu nhat nho nam trong hinh chu nhat lon de chua anh
                    id: rect1
                    width: 117
                    height: 117
                    anchors.top: rect.top
                    anchors.topMargin: 4
                    anchors.left: rect.left
                    anchors.leftMargin: 4
                    radius: 15
                    Image {
                        anchors.verticalCenter: rect1.verticalCenter
                        anchors.horizontalCenter: rect1.horizontalCenter
                        scale: 0.2
                        source: isource
                    }
                }
                Rectangle{          //tao ra 1 hinh chu nhat nho nam trong hinh chu nhat lon de chua text
                    id: rect2
                    width: 117
                    height: 30
                    anchors.bottom: rect.bottom
                    anchors.bottomMargin: 15
                    anchors.left: rect.left
                    anchors.leftMargin: 4
                    Text {
                        anchors.verticalCenter: rect2.verticalCenter
                        anchors.horizontalCenter: rect2.horizontalCenter
                        text: name
                        font.pixelSize: 15
                    }
                }
            }
        }
    }
}
