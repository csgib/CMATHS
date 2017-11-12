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
        text: "Gibault Stéphane - 2017"
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
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        z: 2
        gradcolor_2: "#1a281b"
        gradcolor_1: "#2a382b"
        textcolor: "#FFFFFF"

        button_title: "Démarrer"
        onClicked: {
            fn_start_game()
        }
    }
}
