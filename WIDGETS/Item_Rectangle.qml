import QtQuick 2.12

Item{
    property string wl_color: ""   
    property int wl_number: 0

    width: (parent.width-wl_number)/wl_number
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        border.width: 2
        border.color: Qt.darker(color, 1.5)
        radius: 3
        color: wl_color
    }
}


