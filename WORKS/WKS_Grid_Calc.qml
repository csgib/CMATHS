import QtQuick 2.0
import "../WIDGETS/"

Item {

    property int wl_calc_val_1: 0
    property int wl_calc_val_2: 0
    property int wl_good_value : 0
    property int wl_sens: 0

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
        id: add_grid
        anchors.top: txtconsgrid.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 1

        Repeater {
            id: repeat_add_grid
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
        id: txtconsgrid
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

    function init_work()
    {
        if ( wl_current_max == 5 )
        {
            wl_current_max = 6
        }
        if ( wl_current_max == 15 )
        {
            wl_current_max = 10
        }
        if ( wl_current_max == 30 )
        {
            wl_current_max = 20
        }
        change_values()
    }

    function change_values()
    {
        var idx_val = 0
        var max_idx_val = 0

        for (var i = 0; i < add_grid.children.length-1; i++)
        {
            idx_val = 0
            wl_calc_val_1 = Math.ceil(Math.random() * wl_current_max)
            wl_calc_val_2 = Math.ceil(Math.random() * wl_current_max)

            if ( wl_sens == 0 )
            {
                repeat_add_grid.itemAt(i).children[0].text = wl_calc_val_1 + "+" + wl_calc_val_2
            }
            else
            {
                if ( wl_calc_val_1 > wl_calc_val_2 )
                {
                    repeat_add_grid.itemAt(i).children[0].text = wl_calc_val_1 + "-" + wl_calc_val_2
                }
                else
                {
                    repeat_add_grid.itemAt(i).children[0].text = wl_calc_val_2 + "-" + wl_calc_val_1
                }
            }

            repeat_add_grid.itemAt(i).color = "#AAAAAAAA"
        }

        wl_calc_val_1 = Math.ceil(Math.random() * 35)

        if ( wl_sens == 0 )
        {
            var wl_somme = repeat_add_grid.itemAt(wl_calc_val_1).children[0].text.split("+")
            wl_good_value = parseInt((wl_somme[0]*1)+(wl_somme[1]*1))
        }
        else
        {
            var wl_somme = repeat_add_grid.itemAt(wl_calc_val_1).children[0].text.split("-")
            wl_good_value = parseInt((wl_somme[0]*1)-(wl_somme[1]*1))
        }

        txtconsgrid.text = "A trouver : " + wl_good_value
    }


    function fn_yaclick(wl_coord)
    {
        if ( repeat_add_grid.itemAt(wl_coord).children[0].text != "" )
        {
            if ( wl_sens == 0 )
            {
                var wl_somme = repeat_add_grid.itemAt(wl_coord).children[0].text.split("+")
                var wl_select_value = parseInt((wl_somme[0]*1)+(wl_somme[1]*1))
            }
            else
            {
                var wl_somme = repeat_add_grid.itemAt(wl_coord).children[0].text.split("-")
                var wl_select_value = parseInt((wl_somme[0]*1)-(wl_somme[1]*1))
            }

            if ( wl_select_value == wl_good_value )
            {
                repeat_add_grid.itemAt(wl_coord).children[0].text = ""
                repeat_add_grid.itemAt(wl_coord).color = "#AAEEFF41"

                var wl_reste = 0

                for (var i = 0; i < add_grid.children.length-1; i++)
                {
                    if ( wl_sens == 0 )
                    {
                        wl_somme = repeat_add_grid.itemAt(i).children[0].text.split("+")
                        wl_select_value = parseInt((wl_somme[0]*1)+(wl_somme[1]*1))
                    }
                    else
                    {
                        wl_somme = repeat_add_grid.itemAt(i).children[0].text.split("-")
                        wl_select_value = parseInt((wl_somme[0]*1)-(wl_somme[1]*1))
                    }

                    if ( wl_select_value == wl_good_value )
                    {
                        wl_reste++
                    }
                }

                if ( wl_reste == 0 )
                {
                    result_question.fn_show_hit("OK")
                    if ( wl_current_point > 10 )
                    {
                        wl_current_max = wl_current_max+4
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
                    change_values()
                }
            }
            else
            {
                result_question.fn_show_hit("NOK")
            }
        }
    }
}
