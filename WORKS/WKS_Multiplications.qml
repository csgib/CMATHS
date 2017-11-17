import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0
    property int wl_sens: 0
    property var array_numbers_mult: [1,2,3,4,5,6,7,8,9,10]

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
        id: exo_calc_operation_multi
        x: 10
        width: parent.width - 150

        minimumPixelSize: 8
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: ""
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: itemcalcvalide.top
        anchors.bottomMargin: 10
    }

    Text{
        id: exo_calc_result_multi
        x: parent.width - 140
        width: 130

        minimumPixelSize: 8
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: "..."
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: itemcalcvalide.top
        anchors.bottomMargin: 10
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
    }

    Item{
        id: itemcalcvalide
        x: 10
        y: parent.height - ((((parent.width-50)/5)*2)+70)
        width: parent.width - 20
        height: 60
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
        y: parent.height - (((parent.width-50)/5)*2)
        width: parent.width - 20
        height: (((parent.height-50)/5)*2)
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

        array_numbers_mult = shuffle(array_numbers_mult)
        change_values()
    }

    function shuffle(a)
    {
       var j = 0;
       var valI = '';
       var valJ = valI;
       var l = a.length - 1;
       while(l > -1)
       {
            j = Math.floor(Math.random() * l);
            valI = a[l];
            valJ = a[j];
            a[l] = valJ;
            a[j] = valI;
            l = l - 1;
        }
        return a;
     }

    function change_values()
    {
        exo_calc_result_multi.text = "..."
        if ( wl_sens == 0 )
        {
            exo_calc_operation_multi.text = wl_calc_val_2 + " x " + array_numbers_mult[wl_calc_val_1] + " = "
        }
        else
        {
            exo_calc_operation_multi.text = wl_calc_val_2 + " + " + array_numbers_mult[wl_calc_val_1] + " = "
        }
    }

    function put_val_calc(wl_saisie)
    {
        if ( exo_calc_result_multi.text == "..." )
        {
            exo_calc_result_multi.text = wl_saisie
        }
        else
        {
            exo_calc_result_multi.text = exo_calc_result_multi.text + wl_saisie
        }
    }

    function fn_cancel_exocalc()
    {
        exo_calc_result_multi.text = "..."
    }

    function fn_valide_exocalc()
    {
        if ( wl_sens == 0 )
        {
            if ( parseInt(exo_calc_result_multi.text) == array_numbers_mult[wl_calc_val_1]*wl_calc_val_2 )
            {
                result_question.fn_show_hit("OK")
                wl_calc_val_1++
                if ( wl_calc_val_1 >= 10 )
                {
                    wl_calc_val_1 = 0
                    wl_calc_val_2++
                    array_numbers_mult = shuffle(array_numbers_mult)
                }

                wl_current_level++
                wl_current_point = 0

                if ( wl_calc_val_2 > 10 )
                {
                    fn_show_victory()
                }
                else
                {
                    progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/100
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
            if ( parseInt(exo_calc_result_multi.text) == array_numbers_mult[wl_calc_val_1]+wl_calc_val_2 )
            {
                result_question.fn_show_hit("OK")
                wl_calc_val_1++
                if ( wl_calc_val_1 >= 10 )
                {
                    wl_calc_val_1 = 0
                    wl_calc_val_2++
                }

                wl_current_level++
                wl_current_point = 0

                if ( wl_calc_val_2 > 10 )
                {
                    fn_show_victory()
                }
                else
                {
                    progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/100
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
