import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0

    /*WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            fn_close_activity()
        }
    }*/

    Item{
        id: support_balance
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100

        Rectangle{
            x: 320
            y: 220
            width: 100
            height: 100
            color: "red"
            anchors.right: bal_plato.right
            anchors.rightMargin: 0
            anchors.bottom: bal_plato.top
            anchors.bottomMargin: 4
        }

        Rectangle{
            id: bal_pd_1
            y: 220
            width: 100
            height: 100
            color: "red"
            anchors.left: bal_plato.left
            anchors.leftMargin: 0
            anchors.bottom: bal_plato.top
            anchors.bottomMargin: 4
        }

        Rectangle{
            id: bal_plato
            width: 300
            height: 20
            color: "#FF0000"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            /*transform: Rotation {
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
            }*/
        }


    }

    function init_work()
    {
        /*if ( frm_application.width < frm_application.height )
        {
            support_balance.width = frm_application.width - 50
            support_balance.x = 25
            support_balance.height = frm_application.height - 60
            support_balance.y = 40
        }
        else
        {
            support_flow_exo_3.width = item2.y - 120
            support_flow_exo_3.height = support_flow_exo_3.width
            support_flow_exo_3.x = (frm_application.width - support_flow_exo_3.width)/2
        }

        change_values()*/
    }

    function change_values()
    {

    }
}
