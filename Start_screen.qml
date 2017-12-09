import QtQuick 2.0
import "WIDGETS/"

Item {
    Rectangle{
        x: 0
        anchors.fill: parent
        color: "#FEFEFE"
        z: 1
    }

    Image{
        anchors.fill: parent
        fillMode: Image.Tile
        z: 1
        source: "Images/grid.png"
    }

    Image{
        id: logo_app
        width: parent.width / 2.5
        anchors.top: parent.top
        anchors.topMargin: 40
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
        font.pixelSize: 512
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

    Text{
        id: text_start_2
        x: 30
        height: logo_app.height/2
        anchors.top: text_start_1.bottom
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: logo_app.right
        anchors.leftMargin: 10
        minimumPixelSize: 8
        font.pixelSize: 512
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: local_school.name
        text: "Gibault Stéphane"
        styleColor: "#00000000"
        color: "#211e1e"
        z: 2
    }

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
            Qt.quit()
        }
    }

    Item{
        id: select_level
        x: 0
        y: frm_application.height
        width: parent.width
        height: parent.height
        z: 8

        /*Behavior on y {
            NumberAnimation {
                easing.amplitude: 1.8
                easing.overshoot: 0
                duration: 1000
                easing.type: Easing.Linear
            }
        }*/

        Rectangle{
            anchors.fill:  parent
            color: "#AA740846"

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
                y: 10
                width: parent.width - 50
                height: 100
                text: "Choisis un niveau de difficulté"
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: local_school.name
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }

            WID_Button{
                y: 180
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.left: parent.left
                anchors.leftMargin: 40
                button_title: "Facile"

                gradcolor_2: "#EEEEEE"
                gradcolor_1: "#F5F5F5"
                textcolor: "#222222"

                onClicked: {
                    select_level.y = 0
                    wl_level_of_difficulty = 5
                    fn_start_game()
                }
            }

            WID_Button{
                y: 240
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.left: parent.left
                anchors.leftMargin: 40
                button_title: "Moyen"

                gradcolor_2: "#EEEEEE"
                gradcolor_1: "#F5F5F5"
                textcolor: "#222222"

                onClicked: {
                    select_level.y = 0
                    wl_level_of_difficulty = 15
                    fn_start_game()
                }
            }

            WID_Button{
                y: 300
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.left: parent.left
                anchors.leftMargin: 40
                button_title: "Difficile"

                gradcolor_2: "#EEEEEE"
                gradcolor_1: "#F5F5F5"
                textcolor: "#222222"

                onClicked: {
                    select_level.y = 0
                    wl_level_of_difficulty = 30
                    fn_start_game()
                }
            }
        }
    }
}
