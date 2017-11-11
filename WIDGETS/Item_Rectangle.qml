import QtQuick 2.0

Item{
    property string wl_color: ""   
    property int wl_width: 0
    property int wl_height: 0

    width: wl_width
    height: wl_height

    Rectangle {
        width: parent.width
        height: parent.height
        border.width: 2
        border.color: Qt.darker(color, 1.5)
        radius: 3
        color: wl_color
    }
}


