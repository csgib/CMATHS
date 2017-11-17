import QtQuick 2.0
import "../WIDGETS/"

Item {

    WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            fn_close_activity()
        }
    }

    Image{
        x: 0
        y: parent.height - 176
        width: parent.width
        height: 40
        source: "../Images/Game_art/terre_haut.png"
        fillMode: Image.Tile
    }

    Image{
        x: 0
        y: parent.height - 140
        width: parent.width
        height: 140
        source: "../Images/Game_art/terre_bas.png"
        fillMode: Image.Tile
    }

    Image{
        x: 0
        y: parent.height - 286
        width: 80
        height: 110
        source: "../Images/Game_art/player.png"
    }

    Item{
        id: flotte_next

        x: 400
        y: parent.height - 176
        width: 210
        height: 176

        Image{
            x: 0
            y: 70
            width: parent.width
            height: parent.height - 70
            source: "../Images/Game_art/eau_bas.png"
            fillMode: Image.Tile
        }

        Image{
            x: 0
            y: 0
            width: parent.width
            height: 70
            source: "../Images/Game_art/eau_haut.png"
            fillMode: Image.Tile
        }
    }

    function init_work()
    {

    }
}
