import QtQuick 2.0
import "../WIDGETS/"

Item {
    property var array_Color: ["af7ac5", "85c1e9", "82e0aa", "f5b041", "e74c3c"]
    property int wl_current_algo_case: 0
    property int wl_max_algo: 0
    property int wl_max_algo_difficulty: 0

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

    WID_Button{
        id: restart_algo_bt
        x: 10
        width: parent.width-20
        anchors.bottom: supportflowalgo.top
        anchors.bottomMargin: 10
        y: 5
        button_title: "Recommencer l'éxercice"
        onClicked: {
            fn_restart_exo()
        }
    }

    Item{
        id: model_algo
        x: 10
        width: parent.width - 20
        anchors.bottom: restart_algo_bt.top
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 40

        Flow{
            id: flow_algo
            spacing: 1
            height: parent.height/3
            width: parent.width
        }

        Flow{
            id: flow_algo_answer
            anchors.top: flow_algo.bottom
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            spacing: 1
        }
    }

    Item{
        id: supportflowalgo
        x: 10
        width: parent.width - 20
        height: 140
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Flow{
            anchors.fill: parent
            spacing: 10

            Rectangle{
                width: (parent.width-40)/5
                height: (parent.height-10)
                color: "#" + array_Color[0]
                border.color: Qt.darker(color, 1.5)
                border.width: 2
                radius: 3
                MouseArea{
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: {
                        put_val_calc(parent.color)
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/5
                height: (parent.height-10)
                color: "#" + array_Color[1]
                border.color: Qt.darker(color, 1.5)
                border.width: 2
                radius: 3
                MouseArea{
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: {
                        put_val_calc(parent.color)
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/5
                height: (parent.height-10)
                color: "#" + array_Color[2]
                border.color: Qt.darker(color, 1.5)
                border.width: 2
                radius: 3
                MouseArea{
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: {
                        put_val_calc(parent.color)
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/5
                height: (parent.height-10)
                color: "#" + array_Color[3]
                border.color: Qt.darker(color, 1.5)
                border.width: 2
                radius: 3
                MouseArea{
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: {
                        put_val_calc(parent.color)
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/5
                height: (parent.height-10)
                color: "#" + array_Color[4]
                border.color: Qt.darker(color, 1.5)
                border.width: 2
                radius: 3
                MouseArea{
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: {
                        put_val_calc(parent.color)
                    }
                }
            }
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        switch (wl_level_of_difficulty)
        {
            case 5:
                wl_max_algo_difficulty = 5
                break;
            case 30:
                wl_max_algo_difficulty = 8
                break;
            case 70:
                wl_max_algo_difficulty = 12
                break;
        }
        change_values()
    }

    function change_values()
    {
        for (var i = 0; i < flow_algo.children.length; i++)
        {
            flow_algo.children[i].destroy()
        }

        for (var i = 0; i < flow_algo_answer.children.length; i++)
        {
            flow_algo_answer.children[i].destroy()
        }

        var wl_max = Math.ceil(Math.random() * wl_max_algo_difficulty)
        while ( wl_max < 3 )
        {
            wl_max = Math.ceil(Math.random() * wl_max_algo_difficulty)
        }

        wl_max_algo = wl_max*2

        var wl_idx = 0

        var component
        var sprite
        var wl_color_choose

        while ( wl_idx < wl_max )
        {
            wl_color_choose = Math.ceil(Math.random() * 4)
            component = Qt.createComponent("../WIDGETS/Item_Rectangle.qml")

            if ( ((frm_application.width-20) / (wl_max+2)) > supportflowalgo.height )
            {
                sprite = component.createObject(flow_algo, {"wl_number": wl_max, "wl_color": "#" + array_Color[wl_color_choose], "wl_width": (frm_application.width-20) / (wl_max+2), "wl_height": supportflowalgo.height})
            }
            else
            {
                sprite = component.createObject(flow_algo, {"wl_number": wl_max, "wl_color": "#" + array_Color[wl_color_choose], "wl_width": (frm_application.width-20) / (wl_max+2), "wl_height": supportflowalgo.height})
            }

            wl_idx++
        }

        wl_idx = 0
        while ( wl_idx < wl_max*2 )
        {
            component = Qt.createComponent("../WIDGETS/Item_Rectangle.qml");
            sprite = component.createObject(flow_algo_answer, {"wl_number": wl_max*2, "wl_color": "#44FFFFFF"})

            wl_idx++
        }
        wl_current_algo_case = 0
    }

    function put_val_calc(wl_saisie)
    {
        flow_algo_answer.children[wl_current_algo_case].wl_color = wl_saisie
        wl_current_algo_case++

        if ( wl_current_algo_case == wl_max_algo )
        {
            fn_valide_result()
        }
    }

    function fn_valide_result()
    {
        var wl_idx = 0
        var wl_idx_algo = 0
        var wl_errors = 0
        while ( wl_idx < wl_max_algo )
        {
            if ( flow_algo_answer.children[wl_idx].wl_color != flow_algo.children[wl_idx_algo].wl_color )
            {
                wl_errors++
            }

            wl_idx_algo++
            if ( wl_idx_algo == (wl_max_algo/2) )
            {
                wl_idx_algo = 0
            }

            wl_idx++
        }

        if ( wl_errors == 0 )
        {
            result_question.fn_show_hit("OK")
            if ( wl_current_point > 50 )
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
            result_question.fn_show_hit("NOK")
            fn_restart_exo()
        }
    }

    function fn_restart_exo()
    {
        wl_current_algo_case = 0
        for (var i = 0; i < flow_algo_answer.children.length; i++)
        {
            flow_algo_answer.children[i].wl_color = "#44FFFFFF"
        }
    }
}
