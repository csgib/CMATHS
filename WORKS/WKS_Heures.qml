import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0
    property int wl_sens: 0

    property string wl_true_hre: ""

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
        id: horl_num
        height: 400
        width: 400
        x: (parent.width-width) / 2
        y: 40
        fillMode: Image.PreserveAspectFit
        source: "../Images/horloge.png"
        z: 0
    }

    Image{
        id: horl_aig_hr
        x: (horl_num.x + (horl_num.width/2))-(width/2)
        y: horl_num.y + (horl_num.height/2)-height
        height: horl_num.height/4
        width: height/8.745
        source: "../Images/aiguille.png"
        transform: Rotation {
            id: rot_aig_hr
            origin.x: horl_aig_hr.width/2
            origin.y: horl_aig_hr.height
            axis { x: 0; y: 0; z: 1 }
            angle: 50

            Behavior on angle {
                NumberAnimation {
                    easing.overshoot: 0
                    duration: 1500
                    easing.type: Easing.OutBack
                }
            }
        }
        z: 2
    }

    Image{
        id: horl_aig_mn
        x: (horl_num.x + (horl_num.width/2))-(width/2)
        y: horl_num.y + (horl_num.height/2)-height
        height: horl_num.height/3
        width: height/8.745
        source: "../Images/aiguille_m.png"
        transform: Rotation {
            id: rot_aig_mn
            origin.x: horl_aig_mn.width/2
            origin.y: horl_aig_mn.height
            axis { x: 0; y: 0; z: 1 }
            angle: 50

            Behavior on angle {
                NumberAnimation {
                    easing.overshoot: 0
                    duration: 1500
                    easing.type: Easing.OutBack
                }
            }
        }
        z: 1
    }

    Item {
        id: item_prop_horlo
        y: 280
        height: 150
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        Flow{
            anchors.fill: parent
            spacing: 10

            Rectangle{
                width: (parent.width-10)/2
                height: 100
                color: "#ffa343"
                border.color: "#e66d14"
                border.width: 3
                radius: 10
                Text{
                    id: rval_hr_1
                    color: "#FFFFFF"
                    anchors.fill: parent
                    anchors.margins: 10
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            fn_valide_result(parent.text)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width-10)/2
                height: 100
                color: "#ffa343"
                border.color: "#e66d14"
                border.width: 3
                radius: 10
                Text{
                    id: rval_hr_2
                    color: "#FFFFFF"
                    anchors.fill: parent
                    anchors.margins: 10
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            fn_valide_result(parent.text)
                        }
                    }
                }
            }
        }
    }

    function init_work()
    {
        if ( frm_application.width < frm_application.height-150 )
        {
            horl_num.width = (frm_application.width-20)
            horl_num.height = horl_num.width

            horl_aig_mn.height = horl_num.height/3
            horl_aig_mn.width = horl_aig_mn.height / 8.745

            horl_aig_hr.height = horl_num.height/4
            horl_aig_hr.width = horl_aig_hr.height / 8.745

        }
        else
        {
            horl_num.width = (frm_application.height-280)
            horl_num.height = horl_num.width

            horl_aig_mn.height = horl_num.height/3
            horl_aig_mn.width = horl_aig_mn.height / 8.745

            horl_aig_hr.height = horl_num.height/4
            horl_aig_hr.width = horl_aig_hr.height / 8.745
        }

        change_values()
    }

    function change_values()
    {
        if ( wl_sens == 1 )
        {
            wl_calc_val_1 = Math.ceil(Math.random() * 24)
            if ( wl_calc_val_1 == 24 )
            {
                wl_calc_val_1 = 0
            }

            wl_calc_val_2 = Math.ceil(Math.random() * 12)

            while ( wl_calc_val_2 == wl_calc_val_1 )
            {
                wl_calc_val_2 = Math.ceil(Math.random() * 12)
            }

            var wl_vari_hre = Math.ceil(Math.random() * 10)
            var wl_wk_hre = ""

            if ( wl_vari_hre < 5 )
            {
                if ( wl_calc_val_2*5 < 10 )
                {
                    wl_wk_hre = "0" + (wl_calc_val_2*5)
                }
                else
                {
                    if ( wl_calc_val_2*5 > 59 )
                    {
                        wl_wk_hre = "00"
                    }
                    else
                    {
                        wl_wk_hre = (wl_calc_val_2*5)
                    }
                }

                rval_hr_1.text = wl_calc_val_1 + ":" + wl_wk_hre
                wl_true_hre = rval_hr_1.text

                if ( wl_calc_val_1*5 < 10 )
                {
                    wl_wk_hre = "0" + (wl_calc_val_1*5)
                }
                else
                {
                    if ( wl_calc_val_1*5 > 59 )
                    {
                        wl_wk_hre = "00"
                    }
                    else
                    {
                        wl_wk_hre = (wl_calc_val_1*5)
                    }
                }

                rval_hr_2.text = wl_calc_val_2 + ":" + wl_wk_hre
            }
            else
            {
                if ( wl_calc_val_1*5 < 10 )
                {
                    wl_wk_hre = "0" + (wl_calc_val_1*5)
                }
                else
                {
                    if ( wl_calc_val_1*5 > 59 )
                    {
                        wl_wk_hre = "00"
                    }
                    else
                    {
                        wl_wk_hre = (wl_calc_val_1*5)
                    }
                }

                rval_hr_1.text = wl_calc_val_2 + ":" + wl_wk_hre

                if ( wl_calc_val_2*5 < 10 )
                {
                    wl_wk_hre = "0" + (wl_calc_val_2*5)
                }
                else
                {
                    if ( wl_calc_val_2*5 > 59 )
                    {
                        wl_wk_hre = "00"
                    }
                    else
                    {
                        wl_wk_hre = (wl_calc_val_2*5)
                    }
                }

                rval_hr_2.text = wl_calc_val_1 + ":" + wl_wk_hre
                wl_true_hre = rval_hr_2.text
            }
            rot_aig_hr.angle = ((wl_calc_val_1 * 360) / 12)
            rot_aig_mn.angle = ((wl_calc_val_2 * 360) / 12)
        }
        else
        {
            wl_calc_val_1 = Math.ceil(Math.random() * 12)

            wl_calc_val_2 = Math.ceil(Math.random() * 4)

            while ( wl_calc_val_2 == wl_calc_val_1 )
            {
                wl_calc_val_2 = Math.ceil(Math.random() * 4)
            }

            var wl_vari_hre = Math.ceil(Math.random() * 10)
            var wl_wk_hre = ""

            if ( wl_calc_val_2*15 == 60 )
            {
                wl_wk_hre = "00"
            }
            else
            {
                wl_wk_hre = (wl_calc_val_2*15)
            }

            if ( wl_vari_hre < 5 )
            {
                rval_hr_1.text = wl_calc_val_1 + ":" + wl_wk_hre
                wl_true_hre = rval_hr_1.text

                if ( wl_calc_val_1 + 1 > 12 )
                {
                    rval_hr_2.text = (wl_calc_val_1-1) + ":" + wl_wk_hre
                }
                else
                {
                    rval_hr_2.text = (wl_calc_val_1+1) + ":" + wl_wk_hre
                }
            }
            else
            {
                rval_hr_2.text = wl_calc_val_1 + ":" + wl_wk_hre
                wl_true_hre = rval_hr_2.text

                if ( wl_calc_val_1 + 1 > 12 )
                {
                    rval_hr_1.text = (wl_calc_val_1-1) + ":" + wl_wk_hre
                }
                else
                {
                    rval_hr_1.text = (wl_calc_val_1+1) + ":" + wl_wk_hre
                }
            }
            rot_aig_hr.angle = ((wl_calc_val_1 * 360) / 12)
            rot_aig_mn.angle = ((wl_calc_val_2 * 360) / 4)
        }
    }

    function fn_valide_result(wl_hre)
    {
        if ( wl_hre == wl_true_hre )
        {
            result_question.fn_show_hit("OK")

            if ( wl_current_point > 10 )
            {
                wl_current_max = 20+(10*wl_current_level)
                wl_current_level++
                wl_current_point = 0

                if ( wl_current_point_cumul > 100 )
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
        interval: 2800
        running: false
        repeat: false
        onTriggered: change_values()
    }
}
