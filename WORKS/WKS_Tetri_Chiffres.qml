import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_cumul_eleve: 0
    property int wl_good_tetri: 0
    property var field: []
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

    Item {
        id: tetri_grid
        anchors.top: txtconstetri.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    Text {
        id: txtconstetri
        height: 70
        text: ""
        anchors.top: parent.top
        anchors.topMargin: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.italic: true
        font.bold: true
        minimumPixelSize: 8
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        wl_current_max = 9
        change_values()
    }

    function change_values()
    {
        for (var i = 0; i < tetri_grid.children.length; i++)
        {
            tetri_grid.children[i].destroy()
        }

        var wl_idx = 0
        var component
        var sprite

        field.length = 0

        var wl_item_object
        for(i = 0; i < 6; i++)
        {
            field[i] = new Array(6);
            for(var j = 0; j < 6; j++)
            {
                wl_calc_val_1 = Math.ceil(Math.random() * wl_current_max)

                wl_item_object = wg_item.createObject(tetri_grid, {"wl_x": ((tetri_grid.width-6)/6)*j, "wl_y": ((tetri_grid.height-6)/6)*i, "wl_width": (tetri_grid.width-12)/6, "wl_height": (tetri_grid.height-12)/6, "wl_str_txt": wl_calc_val_1, "wl_col_number": j, "wl_row_number": i})
                field[i][j] = wl_item_object

            }
        }
        fn_cal_val_tetris()
    }

    function fn_cal_val_tetris()
    {
        wl_cumul_eleve = 0

        var wl_max_chiffre = 4
        if ( wl_current_point_cumul / 5 > 1 )
        {
            wl_max_chiffre = wl_current_point_cumul/5
        }


        var wl_haz_tetri = Math.ceil(Math.random() * wl_max_chiffre)
        while ( wl_haz_tetri < wl_max_chiffre/2 )
        {
            wl_haz_tetri = Math.ceil(Math.random() * wl_max_chiffre)
        }

        var wl_idx_tetri = 0
        var wl_cumul = 0

        var array_numbers_tetri = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

        while ( wl_idx_tetri < wl_haz_tetri )
        {
            wl_calc_val_1 = Math.ceil(Math.random() * 35)
            while ( array_numbers_tetri[wl_calc_val_1] == 1 )
            {
                wl_calc_val_1 = Math.ceil(Math.random() * 35)
            }

            array_numbers_tetri[wl_calc_val_1] = 1

            wl_cumul = wl_cumul + parseInt(tetri_grid.children[wl_calc_val_1].wl_str_txt)
            wl_idx_tetri++
        }

        wl_good_tetri = wl_cumul

        txtconstetri.text = "A trouver : " + wl_cumul
    }

    function fn_yaclick(wl_coord, wl_row, wl_col)
    {
        if ( field[wl_row][wl_col].wl_color == "#aa222222" )
        {
            field[wl_row][wl_col].wl_color = "#AAEEFF41"
            wl_cumul_eleve = wl_cumul_eleve + parseInt(field[wl_row][wl_col].wl_str_txt)
        }
        else
        {
            field[wl_row][wl_col].wl_color = "#aa222222"
            wl_cumul_eleve = wl_cumul_eleve - parseInt(field[wl_row][wl_col].wl_str_txt)
        }

        if ( wl_cumul_eleve == wl_good_tetri)
        {
            for(var i = 0; i < 6; i++)
            {
                for(var j = 0; j < 6; j++)
                {
                    if ( field[i][j].wl_color != "#aa222222" && field[i][j] != "" )
                    {
                        field[i][j].fn_destroy()
                        field[i][j] = ""

                        wl_current_point_cumul++

                        progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/50

                    }
                }
            }

            if ( wl_current_point_cumul > 50 )
            {
                result_question.fn_show_hit("OK")
                fn_show_victory()
            }

            var wl_id_search = 0

            for(i = 5; i > 0; i--)
            {
                for(j = 0; j < 6; j++)
                {
                    if ( field[i][j] == "" )
                    {
                        wl_id_search = 0
                        while ( i-wl_id_search >= 0 )
                        {
                            if ( field[i-wl_id_search][j] != "" )
                            {
                                break
                            }
                            else
                            {
                                wl_id_search++
                            }
                        }

                        if ( i-wl_id_search >= 0 )
                        {
                            field[i-wl_id_search][j].y = ((tetri_grid.height-6)/6)*i
                            field[i][j] = field[i-wl_id_search][j]
                            field[i][j].wl_row_number = i
                            field[i-wl_id_search][j] = ""
                        }
                    }
                }
            }

            var wl_item_object

            for(i = 5; i >= 0; i--)
            {
                for(j = 0; j < 6; j++)
                {
                    if ( field[i][j] == "" )
                    {
                        wl_calc_val_1 = Math.ceil(Math.random() * wl_current_max)
                        wl_item_object = wg_item.createObject(tetri_grid, {"wl_x": ((tetri_grid.width-6)/6)*j, "wl_y": -200, "wl_width": (tetri_grid.width-12)/6, "wl_height": (tetri_grid.height-12)/6, "wl_str_txt": wl_calc_val_1, "wl_col_number": j, "wl_row_number": i})
                        field[i][j] = wl_item_object
                        field[i][j].y = ((tetri_grid.height-6)/6)*i
                    }
                }
            }

            fn_cal_val_tetris()
        }
    }
}
