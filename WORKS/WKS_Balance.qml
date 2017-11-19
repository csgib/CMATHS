import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0
    property int wl_good_answer: 0

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
        id: support_balance
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

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
                    easing.type: Easing.OutBounce
                }
            }
        }

        Rectangle{
            id: bal_pd_2
            x: 320
            y: 220
            width: 100
            height: 100
            color: "#00000000"
            anchors.right: bal_plato.right
            anchors.rightMargin: 0
            anchors.bottom: bal_plato.top
            anchors.bottomMargin: 4
            Image{
                id: bal_pd_2_img
                anchors.fill: parent
                source: ""
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_valide_result(1)
                }
            }
        }

        Rectangle{
            id: bal_pd_1
            y: 220
            width: 100
            height: 100
            color: "#00000000"
            anchors.left: bal_plato.left
            anchors.leftMargin: 0
            anchors.bottom: bal_plato.top
            anchors.bottomMargin: 4
            Image{
                id: bal_pd_1_img
                anchors.fill: parent
                source: ""
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_valide_result(2)
                }
            }
        }

        Rectangle{
            id: bal_plato
            width: parent.width - 60
            height: 10
            color: "#ae8859"
            border.color: "#886440"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Canvas {
        width: 200
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        y: (support_balance.height/2)+20

        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidth = 1
            ctx.strokeStyle = "#9b9595"
            ctx.fillStyle = "#bfbfc1"

            ctx.beginPath()
            ctx.moveTo(100,0)
            ctx.lineTo(200,100)
            ctx.lineTo(0,100)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }
    }

    function init_work()
    {
        change_values()
    }

    function change_values()
    {
        wl_calc_val_1 = Math.ceil(Math.random() * 3)
        wl_calc_val_2 = Math.ceil(Math.random() * 3)

        while ( wl_calc_val_1 == wl_calc_val_2 )
        {
            wl_calc_val_2 = Math.ceil(Math.random() * 3)
        }

        bal_pd_1_img.source = "../Images/candy" + wl_calc_val_1 + ".png"
        bal_pd_2_img.source = "../Images/candy" + wl_calc_val_2 + ".png"

        var wl_vari = Math.ceil(Math.random() * 10)
        if ( wl_vari < 5 )
        {
            rot_aig_bal.angle = -8
            wl_good_answer = 2
        }
        else
        {
            rot_aig_bal.angle = 8
            wl_good_answer = 1
        }
    }

    function fn_valide_result(wl_answer)
    {
        if ( wl_answer == wl_good_answer )
        {
            result_question.fn_show_hit("OK")

            progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/25
            rot_aig_bal.angle = 0
            if ( wl_current_point > 10 )
            {
                wl_current_max = wl_current_max+(5*wl_current_level)
                wl_current_level++
                wl_current_point = 0

                if ( wl_current_point_cumul >= 25 )
                {
                    fn_show_victory()
                }
                else
                {
                    timer_change.start()
                }
            }
            else
            {
                timer_change.start()
            }
        }
        else
        {
            result_question.fn_show_hit("NOK")
        }
    }

    Timer {
        id: timer_change
        interval: 3000
        running: false
        repeat: false
        onTriggered: change_values()
    }
}
