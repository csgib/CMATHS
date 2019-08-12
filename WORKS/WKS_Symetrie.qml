import QtQuick 2.9
import QtQuick.Particles 2.0
import "../WIDGETS/"

Item {

    property int wl_current_motif: 0
    property var array_motif_sym: [
        ["7", "8", "9", "14", "19", "24"],
        ["2", "3", "8", "14", "19", "25", "30", "34", "39", "43", "47", "48"],
        ["7", "8", "12", "13", "16", "17", "18", "19", "20", "23", "24", "28", "29", "33", "34", "38", "39", "40", "42"],
        ["10", "14", "15", "18", "19", "20", "22", "23", "24", "25", "28", "29", "30", "34", "35", "40", "43", "44", "45"],
        ["7", "8", "9", "10", "13", "14", "15", "19", "20", "23", "24", "25", "29", "30", "33", "34", "35", "37", "38", "39", "40", "45"],
        ["9", "10", "18", "19", "20", "23", "24", "25", "32", "33", "34", "35", "38", "39", "40", "44", "45"],
        ["6", "7", "8", "9", "10", "11", "16", "21", "22", "23", "24", "25", "28", "31", "32", "33", "34", "35", "36", "41", "42", "43", "44", "45"],
        ["3", "8", "9", "10", "13", "18", "19", "20", "23", "28", "29", "30", "33", "38", "39", "40", "43", "48", "49", "50"],
        ["10", "15", "18", "19", "20", "22", "23", "27", "28", "32", "33", "38", "39", "40", "45"],
        ["7", "12", "13", "17", "18", "22", "23", "24", "27", "28", "29", "32", "33", "37", "38", "42"],
        ["7", "8", "9", "12", "13", "14", "22", "23", "24", "27", "28", "29", "37", "38", "39", "42", "43", "44"],
        ["7", "9", "12", "14", "17", "18", "19", "27", "28", "29", "32", "37", "42", "43", "44"],
        ["8", "12", "13", "14", "18", "33", "37", "38", "39", "43"],
        ["6", "7", "8", "12", "16", "17", "18", "32", "34", "37", "38", "39", "42", "44"],
        ["5", "7", "8", "12", "15", "17", "20", "22", "23", "24", "25", "27", "28", "29", "30", "32", "35", "37", "40", "42", "43", "50"]
    ]

    WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            fn_close_activity(18)
        }
    }

    Item{
        id: bt_valide_sym
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 60
        y: parent.height - 70
        WID_Button{
            anchors.fill: parent
            button_title: "Valider"
            gradcolor_2: "#DCE775"
            gradcolor_1: "#D4E157"
            textcolor: "#222222"
            onClicked: {
                fn_valide_exocalc()
            }
        }
    }

    Flow {
        id: flow_grid_model
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: bt_valide_sym.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        width: (parent.width-30)/2
        spacing: 0

        Repeater {
            id: rp_model_sym
            model: 50
            delegate: Rectangle {
                width: (parent.width) / 5
                height: (parent.height) / 10
                color: "transparent"
                border.width: 1
                border.color: "#AAFFFFFF"
            }
        }
    }

    Flow {
        id: flow_grid_result
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: bt_valide_sym.top
        anchors.bottomMargin: 10
        anchors.left: flow_grid_model.right
        anchors.leftMargin: 10
        width: (parent.width-30)/2
        spacing: 0

        transform: Rotation {
            id: symres_number
            origin.x: -5
            origin.y: parent.height/2
            axis { x: 0; y: 1; z: 0 }
            angle: 0

            Behavior on angle {
                NumberAnimation {
                    easing.overshoot: 0
                    duration: 1350
                    easing.type: Easing.OutElastic
                }
            }
        }

        Repeater {
            id: rp_result_sym
            model: 50
            delegate: Rectangle {
                width: (parent.width) / 5
                height: (parent.height) / 10
                color: "transparent"
                border.width: 1
                border.color: "#AAFFFFFF"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fire_sym.x = parent.x + flow_grid_result.x + 10 + (parent.width/2)
                        fire_sym.y = parent.y + 40 + (parent.height/2)
                        if ( parent.color == "#00000000" )
                        {
                            parent.color = "#ddffffff"
                        }
                        else
                        {
                            parent.color = "#00000000"
                        }
                    }
                }
            }
        }
    }

    ParticleSystem {
        id: particles_sym
        anchors.fill: parent
        z: 999

        ImageParticle {
            source: "../Images/star.png"
            rotationVariation: 90
        }

        Emitter {
            id: fire_sym
            system: particles_sym
            x: -70
            y: 70

            emitRate: 5
            lifeSpan: 10000

            acceleration: PointDirection { yVariation: 5; xVariation: 3 }
            velocity: PointDirection {xVariation: 3; yVariation: 5}

            size: 64
            sizeVariation: 8
            endSize: 0

            Behavior on y {
                NumberAnimation {
                    easing.amplitude: 0.5
                    duration: 200
                    easing.type: Easing.OutBounce
                }
            }

            Behavior on x {
                NumberAnimation {
                    easing.amplitude: 0.5
                    duration: 200
                    easing.type: Easing.OutBounce
                }
             }
        }
    }


    function init_work()
    {
        wl_current_motif = 0
        change_level()
        particles_sym.start()
    }

    function change_level()
    {
        fire_sym.x = -70
        fire_sym.y = -70

        for (var i = 0; i < 50; i++)
        {
            rp_model_sym.itemAt(i).color = "#00000000"
            rp_result_sym.itemAt(i).color = "#00000000"
        }

        var wl_idx = 0

        for (var j = 0; j < array_motif_sym[wl_current_motif].length; j++)
        {
            wl_idx = array_motif_sym[wl_current_motif][j]*1
            wl_idx -= 1
            rp_model_sym.itemAt(wl_idx).color = "#ddffffff"
        }
    }

    function fn_valide_exocalc()
    {
        var wl_errors = 0
        var wl_str_01 = ""
        var wl_str_02 = ""

        for (var j = 0; j < 50; j++)
        {
            if ( j%5 == 0 && j != 0 )
            {
                if ( wl_str_01 != wl_str_02 )
                {
                    wl_errors++
                }
                wl_str_01 = ""
                wl_str_02 = ""
            }

            wl_str_01 += rp_model_sym.itemAt(j).color
            wl_str_02 = rp_result_sym.itemAt(j).color + wl_str_02
        }

        if ( wl_str_01 != wl_str_02 )
        {
            wl_errors++
        }

        if ( wl_errors == 0 )
        {
            result_question.fn_show_hit("OK")
            wl_current_motif++

            progress_bar_value.width = (wl_current_motif*progress_bar.width)/array_motif_sym.length

            if ( wl_current_point_cumul >= array_motif_sym.length )
            {
                particles_sym.stop()
                fn_show_victory()
            }
            else
            {
                change_level()
            }
        }
        else
        {
            for (var j = 0; j < 50; j++)
            {
                if ( rp_model_sym.itemAt(j).color != "#00000000" )
                {
                    rp_model_sym.itemAt(j).color = "#33ff0000"
                }
            }
            symres_number.angle = -180
            timer_error_symv.start()
        }
    }

    Timer {
        id: timer_error_symv
        interval: 2800
        running: false
        repeat: false
        onTriggered: {
            result_question.fn_show_hit("NOK")
            symres_number.angle = 0
            for (var j = 0; j < 50; j++)
            {
                if ( rp_model_sym.itemAt(j).color != "#00000000" )
                {
                    rp_model_sym.itemAt(j).color = "#ddffffff"
                }
            }
        }
    }
}
