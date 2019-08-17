import QtQuick 2.12
import "WIDGETS/"

Item {
    anchors.fill: parent
    Rectangle{
        x: 0
        anchors.fill: parent
        color: "#FEFEFE"
        z: 1
    }

    Rectangle{
        x: 0
        y: 0
        width: parent.width
        height: parent.height / 2
        z: 2

        Image{
            id: logo_app
            width: parent.width / 2.5
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 10
            fillMode: Image.PreserveAspectFit
            z: 2
            cache: false
            smooth: false
            source: "Images/logo.png"
        }

        Text{
            id: text_start_1
            y: 40
            height: logo_app.height/2
            minimumPixelSize: 8
            font.pixelSize: 128
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            text: "CMATHS"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: logo_app.right
            anchors.leftMargin: 10
            color: "#e877bc"
            style: Text.Outline
            styleColor: "#c8579c"
            z: 2
        }
    }

    Rectangle{
        x: 0
        y: parent.height / 2
        width: parent.width
        height: parent.height / 2
        z: 2

        WID_Button{
            y: parent.height - 100
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.bottom: bt_quit.top
            anchors.bottomMargin: 20
            z: 2
            gradcolor_2: "#1a281b"
            gradcolor_1: "#2a382b"
            textcolor: "#FFFFFF"

            button_title: "Démarrer"
            onClicked: {
                select_level.y = 0
            }
        }

        WID_Button{
            id: bt_quit
            y: parent.height - 100
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            z: 2
            gradcolor_2: "#1a281b"
            gradcolor_1: "#2a382b"
            textcolor: "#FFFFFF"

            button_title: "Quitter CMATHS"
            onClicked: {
                close.accepted = true;
                Qt.quit();
            }
        }
    }

    Item{
        id: select_level
        x: 0
        y: 2200
        width: parent.width
        height: parent.height
        z: 8

        Rectangle{
            anchors.fill:  parent
            color: "#DD222222"

            WID_Button{
                x: parent.width - 35
                y: 5
                width: 30
                height: 30
                button_title: "X"
                onClicked: {
                    select_level.y = parent.height
                }
            }

            Text{
                id: txtselniv
                y: 10
                width: parent.width - 50
                height: 100
                text: "Dans qu'elle classe es tu ?\nAinsi CMATHS te proposera des exercices avec un niveau adapté"
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: local_school.name
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }


            Column{
                anchors.top: txtselniv.bottom
                x: 10
                width: parent.width-20
                anchors.bottom: parent.bottom
                spacing: 10
                Rectangle{
                    width: (parent.height-30)/3
                    height: (parent.height-30)/3
                    color: "#488acd"
                    radius: (parent.height-30)/3
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text{
                        anchors.fill: parent
                        font.pixelSize: 64
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: local_school.name
                        color: "#FFFFFF"
                        style: Text.Outline
                        styleColor: "#000000"
                        text: "CP"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            select_level.y = 2200
                            wl_level_of_difficulty = 5
                            fn_start_game()
                        }
                    }
                }

                Rectangle{
                    width: (parent.height-30)/3
                    height: (parent.height-30)/3
                    color: "#feb627"
                    radius: (parent.height-30)/3
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text{
                        anchors.fill: parent
                        font.pixelSize: 64
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: local_school.name
                        color: "#FFFFFF"
                        style: Text.Outline
                        styleColor: "#000000"
                        text: "CE1"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            select_level.y = 2200
                            wl_level_of_difficulty = 30
                            fn_start_game()
                        }
                    }
                }

                Rectangle{
                    width: (parent.height-30)/3
                    height: (parent.height-30)/3
                    color: "#ed2338"
                    radius: (parent.height-30)/3
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text{
                        anchors.fill: parent
                        font.pixelSize: 64
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: local_school.name
                        color: "#FFFFFF"
                        style: Text.Outline
                        styleColor: "#000000"
                        text: "CE2"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            select_level.y = 2200
                            wl_level_of_difficulty = 70
                            fn_start_game()
                        }
                    }
                }
            }
        }
    }
}
