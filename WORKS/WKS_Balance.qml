import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0

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

    Item{
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        Image{
            anchors.fill: parent
            source: "../Images/balance1.png"
            fillMode: Image.PreserveAspectFit
        }

        Image{
            anchors.fill: parent
            source: "../Images/balance2.png"
        }
    }

    function init_work()
    {

    }
}
