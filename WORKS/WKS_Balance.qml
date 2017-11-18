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
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100

        Image{
            anchors.fill: parent
            source: "../Images/balance1.png"
            fillMode: Image.PreserveAspectFit

            Rectangle{
                x: 50
                y: 50
                width: 100
                height: 100
                color: "red"
            }

            Rectangle{
                x: 50
                y: 50
                width: 100
                height: 100
                color: "red"
            }

            transform: Rotation {
                id: rot_aig_bal
                origin.x: parent.width/2
                origin.y: parent.height/2
                axis { x: 0; y: 0; z: 1 }
                angle: 0

                Behavior on angle {
                    NumberAnimation {
                        easing.overshoot: 0
                        duration: 1500
                        easing.type: Easing.OutBack
                    }
                }
            }
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
