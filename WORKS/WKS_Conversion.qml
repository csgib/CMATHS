import QtQuick 2.0
import "../WIDGETS/"

Item {
    property var array_unites: [
        ["kg", "hg", "dag", "g", "dg", "cg", "mg"],
        ["km", "hm", "dam", "m", "dm", "cm", "mm"],
        ["kl", "hl", "dal", "l", "dl", "cl", "ml"]
    ]

    property var field: []
    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0
    property int wl_calc_val_3: 0
    property int wl_calc_val_4: 0
    property real wl_calc_val_5: 0
    property var wg_item: Qt.createComponent('../WIDGETS/WID_Number.qml')

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
        height: parent.height / 2.5

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
    }

    Item{
        id: itemcalcvalide
        x: 10
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: exo_calc_operation.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60

        Flow{
            id: itemcalcvalide_flow
            spacing: 1
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }

    WID_Button{
        button_title: "Valider"
        x: 10
        width: parent.width-20
        height: 40
        gradcolor_2: "#DCE775"
        gradcolor_1: "#D4E157"
        textcolor: "#222222"
        anchors.top: itemcalcvalide.bottom
        anchors.topMargin: 10
        onClicked: {
            fn_valide_exocalc()
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        change_values()
    }

    function change_values()
    {
        wl_calc_val_1 = Math.ceil(Math.random() * 3)
        wl_calc_val_2 = Math.ceil(Math.random() * 7)
        wl_calc_val_3 = Math.ceil(Math.random() * 20)

        while (wl_calc_val_3 < 1)
        {
            wl_calc_val_3 = Math.ceil(Math.random() * 20)
        }

        if ( wl_calc_val_1 == 3 )
        {
            wl_calc_val_1--
        }

        if ( wl_calc_val_2 == 7 )
        {
            wl_calc_val_2--
        }

        exo_calc_operation.text = wl_calc_val_3 + " " + array_unites[wl_calc_val_1][wl_calc_val_2] + " = ..."

        var wl_item_object
        var wl_str_res = ""
        var wl_good = 0
        for(var i = 0; i < 4; i++)
        {
            wl_calc_val_4 = Math.ceil(Math.random() * 7)
            while (wl_calc_val_4 == wl_calc_val_2)
            {
                wl_calc_val_4 = Math.ceil(Math.random() * 7)
            }
            if ( wl_calc_val_4 == 7 )
            {
                wl_calc_val_4--
            }

            wl_good= Math.ceil(Math.random() * 10)

            if ( wl_good < 5 )
            {
                if ( wl_calc_val_4 < wl_calc_val_2 )
                {
                    wl_calc_val_5 = wl_calc_val_3 / Math.pow(10, wl_calc_val_2-wl_calc_val_4)
                }
                else
                {
                    wl_calc_val_5 = wl_calc_val_3 * Math.pow(10, wl_calc_val_2-wl_calc_val_4)
                }
            }
            else
            {
                if ( wl_calc_val_4 < wl_calc_val_2 )
                {
                    wl_calc_val_5 = wl_calc_val_3 * Math.pow(10, wl_calc_val_2-wl_calc_val_4)
                }
                else
                {
                    wl_calc_val_5 = wl_calc_val_3 / Math.pow(10, wl_calc_val_2-wl_calc_val_4)
                }
            }

            wl_str_res = wl_calc_val_5 + " " + array_unites[wl_calc_val_1][wl_calc_val_4]
            wl_item_object = wg_item.createObject(itemcalcvalide_flow, {"wl_number_x": 1, "wl_number_y": 5, "wl_str_txt": wl_str_res, "wl_col_number": 0, "wl_row_number": i})
            field[i] = wl_item_object
        }
        wl_item_object = wg_item.createObject(itemcalcvalide_flow, {"wl_number_x": 1, "wl_number_y": 5, "wl_str_txt": "Aucune bonne réponse", "wl_col_number": 0, "wl_row_number": i})
        field[i] = wl_item_object
    }

    function fn_yaclick(wl_coord, wl_row, wl_col)
    {
        if ( field[wl_row].wl_color == "#aa222222" )
        {
            field[wl_row].wl_color = "#AAEEFF41"
        }
        else
        {
            field[wl_row].wl_color = "#aa222222"
        }
    }

    function fn_valide_exocalc()
    {
        /*if ( sens_count == 0 )
        {
            if ( parseInt(exo_calc_result.text) == wl_calc_val_1+wl_calc_val_2 )
            {
                result_question.fn_show_hit("OK")

                if ( wl_current_point > 10 )
                {
                    wl_current_max = wl_current_max+5
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
                    wl_current_max = wl_current_max+5
                    wl_current_level++
                    wl_current_point = 0

                    if ( wl_current_point_cumul > 50 )
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
        }*/
    }
}
