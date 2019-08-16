import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_max_algo_difficulty: 0
    WID_Button{
        id: bt_close_lgt
        x: parent.width - 35
        width: 30
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        button_title: "X"
        onClicked: {
            fn_close_activity()
        }
    }

    Flow{
        x: 10
        width: parent.width-20
        anchors.bottom: bts_answer_lgt.top
        anchors.bottomMargin: 10
        anchors.top: bt_close_lgt.bottom
        anchors.topMargin: 10
        Text{
            id: val1
            anchors.fill: parent
            style: Text.Outline
            styleColor: "#000000"
            color: "#ffffff"
            minimumPixelSize: 8
            font.pixelSize: 1024
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }


    Item {
        id: bts_answer_lgt
        x: 40
        y: parent.height - 70
        width: parent.width - 80
        height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        WID_Button{
            x: 0
            width: (parent.width-10)/2
            button_title: "Impair"
            onClicked: {
                fn_valide_result(0)
            }
        }

        WID_Button{
            x: ((parent.width-10)/2)+10
            width: (parent.width-10)/2
            button_title: "Pair"
            onClicked: {
                fn_valide_result(1)
            }
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        change_values()
    }

    // *** FONCTIONS DU MODULE ETUDIE ***
    function change_values()
    {
        switch (wl_level_of_difficulty)
        {
            case 5:
                wl_max_algo_difficulty = 10
                break;
            case 30:
                wl_max_algo_difficulty = 100
                break;
            case 70:
                wl_max_algo_difficulty = 999
                break;
        }
        var wl_val_1 = Math.ceil(Math.random() * wl_max_algo_difficulty)
        val1.text = wl_val_1
    }

    function fn_valide_result(wl_answer)
    {
        var wl_success = 1
        if ( parseInt(val1.text%2) == 0 && wl_answer == 1 )
        {
            result_question.fn_show_hit("OK")
        }
        else
        {
            if ( parseInt(val1.text%2) != 0 && wl_answer == 0 )
            {
                result_question.fn_show_hit("OK")
            }
            else
            {
                result_question.fn_show_hit("NOK")
                wl_success = 0
            }
        }

        if ( wl_current_point > 10 )
        {
            wl_current_max = wl_current_max+(10*wl_current_level)
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
            if ( wl_success == 1 )
            {
                change_values()
            }
        }
    }
}
