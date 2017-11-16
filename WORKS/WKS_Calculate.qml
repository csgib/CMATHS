import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0
    property int sens_count: 0

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

    Text{
        id: exo_calc_operation
        x: 10
        width: parent.width - 20

        minimumPixelSize: 8
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
        text: ""
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: itemcalcvalide.top
        anchors.bottomMargin: 10
    }

    Text{
        id: exo_calc_result
        visible: false
        text: "..."
    }

    Item{
        id: itemcalcvalide
        x: 10
        y: parent.height - ((((parent.width-50)/5)*2)+70)
        width: parent.width - 20
        height: 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: calcnumbers.top
        anchors.bottomMargin: 10

        Flow{
            anchors.fill: parent
            spacing: 10
            WID_Button{
                button_title: "Annuler"
                width: (parent.width/2)-10
                height: parent.height
                onClicked: {
                    fn_cancel_exocalc()
                }
            }
            WID_Button{
                button_title: "Valider"
                width: (parent.width/2)-10
                height: parent.height
                gradcolor_2: "#DCE775"
                gradcolor_1: "#D4E157"
                textcolor: "#222222"
                onClicked: {
                    fn_valide_exocalc()
                }
            }
        }
    }

    Item{
        id: calcnumbers
        x: 10
        width: parent.width - 20
        height: 250
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Flow{
            anchors.fill: parent
            spacing: 10

            WID_Button{
                button_title: "0"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "1"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "2"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "3"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "4"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "5"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "6"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "7"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "8"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
            WID_Button{
                button_title: "9"
                width: (parent.width-50)/5
                height: (parent.height-20)/2
                onClicked: {
                    put_val_calc(this.button_title)
                }
            }
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        change_values()
    }

    function change_values()
    {
        exo_calc_result.text = "..."
        wl_calc_val_1 = Math.ceil(Math.random() * wl_current_max)
        wl_calc_val_2 = Math.ceil(Math.random() * wl_current_max)
        if ( sens_count == 0 )
        {
            exo_calc_operation.text = wl_calc_val_1 + " + " + wl_calc_val_2 + " = ..."
        }
        else
        {
            if ( sens_count == 1 )
            {
                if ( wl_calc_val_1 < wl_calc_val_2 )
                {
                    var wl_tmp = wl_calc_val_1
                    wl_calc_val_1 = wl_calc_val_2
                    wl_calc_val_2 = wl_tmp
                }

                exo_calc_operation.text = wl_calc_val_1 + " - " + wl_calc_val_2 + " = ..."
            }
        }
    }

    function put_val_calc(wl_saisie)
    {
        if ( exo_calc_result.text == "..." )
        {
            exo_calc_result.text = wl_saisie
            exo_calc_operation.text = exo_calc_operation.text.substr(0, exo_calc_operation.text.indexOf("=")+1) + " " + wl_saisie
        }
        else
        {
            exo_calc_result.text = exo_calc_result.text + wl_saisie
            exo_calc_operation.text += wl_saisie
        }
    }

    function fn_cancel_exocalc()
    {
        exo_calc_result.text = "..."
        exo_calc_operation.text = exo_calc_operation.text.substr(0, exo_calc_operation.text.indexOf("=")+1) + " ..."
    }

    function fn_valide_exocalc()
    {
        if ( sens_count == 0 )
        {
            if ( parseInt(exo_calc_result.text) == wl_calc_val_1+wl_calc_val_2 )
            {
                result_question.fn_show_hit("OK")

                if ( wl_current_point > 10 )
                {
                    wl_current_max = wl_current_max+(5*wl_current_level)
                    wl_current_level++
                    wl_current_point = 0

                    if ( wl_current_point_cumul >= 50 )
                    {
                        fn_show_victory()
                    }
                    else
                    {
                        change_values()
                    }
                }
                else
                {
                    change_values()
                }
            }
            else
            {
                result_question.fn_show_hit("NOK")
                fn_cancel_exocalc()
            }
        }
        else
        {
            if ( parseInt(exo_calc_result.text) == wl_calc_val_1-wl_calc_val_2 )
            {
                result_question.fn_show_hit("OK")

                if ( wl_current_point > 10 )
                {
                    wl_current_max = wl_current_max+(5*wl_current_level)
                    wl_current_level++
                    wl_current_point = 0

                    if ( wl_current_point_cumul > 100 )
                    {
                        fn_show_victory()
                    }
                    else
                    {
                        change_values()
                    }
                }
                else
                {
                    change_values()
                }
            }
            else
            {
                result_question.fn_show_hit("NOK")
                fn_cancel_exocalc()
            }
        }
    }
}
