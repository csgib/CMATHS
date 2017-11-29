import QtQuick 2.0
import "../WIDGETS/"

Item {
    property var wl_nbre_click
    property var wl_current_result
    property var wl_good_result

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

    Flow{
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        id: flow_card
        spacing: 4

        Repeater{
            model : 8

            Flipable {
                id: flipable
                width: (parent.width-12)/4
                height: (parent.height-4)/2
                property string txt_card: ""
                property bool flipped: false
                property bool locked: false

                front: Rectangle{
                    color: "#AAFFFFFF"
                    border.width: 1
                    border.color: "#EAEAEA"
                    anchors.fill: parent
                    Image{
                        anchors.fill: parent
                        fillMode: Image.Tile
                        source: "../Images/grid.png"
                    }
                    Image{
                        anchors.fill: parent
                        source: "../Images/fd_activity.png"
                        fillMode: Image.PreserveAspectCrop
                        verticalAlignment: Image.AlignBottom
                    }
                }
                back: Rectangle{
                    color: "#AAFFFFFF"
                    border.width: 1
                    border.color: "#EAEAEA"
                    anchors.fill: parent
                    Text{
                        anchors.fill: parent
                        minimumPixelSize: 4
                        font.pixelSize: 128
                        fontSizeMode: Text.Fit
                        color: "#FFFFFF"
                        style: Text.Outline
                        styleColor: "#000000"
                        text: txt_card
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                transform: Rotation {
                    id: rotation
                    origin.x: flipable.width/2
                    origin.y: flipable.height/2
                    axis.x: 0; axis.y: 1; axis.z: 0
                    angle: 0
                }

                states: State {
                    name: "back"
                    PropertyChanges { target: rotation; angle: 180 }
                    when: flipable.flipped
                }

                transitions: Transition {
                    NumberAnimation { target: rotation; property: "angle"; easing.type: Easing.InOutSine; duration: 400; }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if ( locked == false )
                        {
                            flipable.flipped = !flipable.flipped
                            fn_has_click_memory(txt_card, flipable.flipped)
                        }
                    }
                }
            }

        }
    }

    function init_work()
    {
        wl_nbre_click = 0
        wl_current_result = 0
        wl_current_max = 20
        change_values()
    }

    function change_values()
    {
        var wl_calc_val_1
        wl_good_result = 0

        var wl_cpt = 0
        var wl_cpt_max = 0

        for (var i = 0; i < flow_card.children.length-1; i++)
        {
            flow_card.children[i].txt_card = ""
            flow_card.children[i].flipped = false
            flow_card.children[i].locked = false
        }

        var array_numbers_memo = [0,0,0,0]
        array_numbers_memo[0] = Math.ceil(Math.random() * wl_current_max)
        while ( array_numbers_memo[0] < 6 )
        {
            array_numbers_memo[0] = Math.ceil(Math.random() * wl_current_max)
        }

        array_numbers_memo[1] = array_numbers_memo[0] + Math.ceil(Math.random() * 5)
        array_numbers_memo[2] = array_numbers_memo[1] + Math.ceil(Math.random() * 3)
        array_numbers_memo[3] = array_numbers_memo[2] + Math.ceil(Math.random() * 3)

        while ( wl_cpt_max < 4 )
        {
            wl_cpt = Math.ceil(Math.random() * 6)
            if ( wl_cpt > 7 )
            {
                wl_cpt = 0
            }

            if ( flow_card.children[wl_cpt].txt_card == "" )
            {
                flow_card.children[wl_cpt].txt_card = array_numbers_memo[wl_cpt_max]
                wl_cpt_max++
            }
        }

        wl_cpt = 0
        for (i = 0; i < flow_card.children.length-1; i++)
        {
            if ( flow_card.children[i].txt_card == "" )
            {
                wl_calc_val_1 = array_numbers_memo[wl_cpt]
                wl_cpt_max = Math.ceil(Math.random() * wl_calc_val_1)

                flow_card.children[i].txt_card = wl_cpt_max + "+" + (wl_calc_val_1-wl_cpt_max)
                wl_cpt++
            }
        }
    }

    function fn_has_click_memory(result, statecard)
    {
        if ( statecard == true )
        {
            wl_nbre_click++

            if ( result.indexOf('+') > -1)
            {
                var wl_somme = result.split("+")
                result = parseInt(wl_somme[0]) + parseInt(wl_somme[1])
            }

            if ( wl_nbre_click% 2 == 0 )
            {
                if (result == wl_current_result)
                {
                    for (var i = 0; i < flow_card.children.length-1; i++)
                    {
                        if ( flow_card.children[i].flipped == true )
                        {
                            flow_card.children[i].locked = true
                        }
                    }
                    wl_good_result++

                    if ( wl_good_result >= 4 )
                    {
                        result_question.fn_show_hit("OK")
                        progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/25

                        if ( wl_current_point_cumul >= 25 )
                        {
                            fn_show_victory()
                        }
                        else
                        {
                            change_values()
                        }
                    }
                }
                else
                {
                    timer_turn_card.start()
                }
            }
            else
            {
                wl_current_result = parseInt(result)
            }
        }
        else
        {
            wl_nbre_click = 0
        }
    }

    Timer {
        id: timer_turn_card
        interval: 400
        running: false
        repeat: false
        onTriggered: {
            wl_nbre_click = 0
            for (var i = 0; i < flow_card.children.length-1; i++)
            {
                if ( flow_card.children[i].flipped == true && flow_card.children[i].locked == false )
                {
                    flow_card.children[i].flipped = false
                }
            }
        }
    }
}
