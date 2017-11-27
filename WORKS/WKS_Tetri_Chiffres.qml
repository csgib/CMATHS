import QtQuick 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_reste_tetri: 0
    property int wl_cumul_eleve: 0
    property int wl_good_teri: 0

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

    Flow {
        id: tetri_grid
        anchors.top: txtconstetri.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 1

        Repeater {
            id: repeat_tetri_grid
            model: 36
            delegate: Rectangle {
                width: (parent.width-6) / 6
                height: (parent.height-6) / 6
                color: "#AAAAAAAA"

                Text{
                    color: "#FFFFFF"
                    anchors.fill: parent
                    anchors.margins: 6
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    style: Text.Outline
                    styleColor: "#000000"
                    text: ""
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick(index)
                    }
                }
            }
        }
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
        change_values()
    }

    function change_values()
    {
        wl_reste_tetri = 36
        wl_cumul_eleve = 0
        var idx_val = 0
        var max_idx_val = 0

        for (var i = 0; i < tetri_grid.children.length-1; i++)
        {
            idx_val = 0
            wl_calc_val_1 = Math.ceil(Math.random() * wl_current_max)
            repeat_tetri_grid.itemAt(i).children[0].text = wl_calc_val_1
            repeat_tetri_grid.itemAt(i).color = "#AAAAAAAA"
        }

        wl_calc_val_1 = Math.ceil(Math.random() * 35)
        fn_cal_val_tetris()
    }

    function fn_cal_val_tetris()
    {
        for (var i = 0; i < tetri_grid.children.length-1; i++)
        {
            if ( repeat_tetri_grid.itemAt(i).color != "#aaaaaaaa" )
            {
                repeat_tetri_grid.itemAt(i).children[0].text = ""
                repeat_tetri_grid.itemAt(i).color = "#AAAAAAAA"
            }
        }

        var wl_haz_tetri = Math.ceil(Math.random() * 4)
        while ( wl_haz_tetri < 2 )
        {
            wl_haz_tetri = Math.ceil(Math.random() * 4)
        }

        var wl_idx_tetri = 0
        var wl_cumul = 0

        var array_numbers_tetri = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

        while ( wl_idx_tetri < wl_haz_tetri && wl_reste_tetri-wl_idx_tetri > 0 )
        {
            wl_calc_val_1 = Math.ceil(Math.random() * 35)
            while ( wl_calc_val_1[wl_calc_val_1] == 1 || repeat_tetri_grid.itemAt(wl_calc_val_1).children[0].text == "" )
            {
                wl_calc_val_1 = Math.ceil(Math.random() * 35)
            }

            array_numbers_tetri[wl_calc_val_1] = 1
            wl_cumul = wl_cumul + parseInt(repeat_tetri_grid.itemAt(wl_calc_val_1).children[0].text)
            wl_idx_tetri++
        }

        wl_good_teri = wl_cumul

        txtconstetri.text = "A trouver : " + wl_cumul
    }

    function fn_yaclick(wl_coord)
    {
        if ( repeat_tetri_grid.itemAt(wl_coord).color == "#aaaaaaaa" )
        {
            wl_reste_tetri--
            repeat_tetri_grid.itemAt(wl_coord).color = "#AAEEFF41"
            wl_cumul_eleve = wl_cumul_eleve + parseInt(repeat_tetri_grid.itemAt(wl_coord).children[0].text)
        }
        else
        {
            wl_reste_tetri++
            repeat_tetri_grid.itemAt(wl_coord).color = "#aaaaaaaa"
            wl_cumul_eleve = wl_cumul_eleve - parseInt(repeat_tetri_grid.itemAt(wl_coord).children[0].text)
        }

        if ( wl_cumul_eleve == wl_good_teri)
        {
            result_question.fn_show_hit("OK")
            wl_cumul_eleve = 0
            if ( wl_reste_tetri < 1 )
            {
                if ( wl_current_point_cumul > 5 )
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
                fn_cal_val_tetris()
            }
        }
    }
}
