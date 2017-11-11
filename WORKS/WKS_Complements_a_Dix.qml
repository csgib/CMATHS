import QtQuick 2.0
import QtQuick.Particles 2.0
import "../WIDGETS/"

Item {
    property int wl_calc_val_1: 0
    property int wl_cumul_comp: 0
    property int wl_diff: 0

    WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            particles_cad.stop()
            fn_close_activity(5)
        }
    }

    Text{
        id: exo_compadix_operation
        x: 10
        y: 10
        width: parent.width - 50
        height: 100
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
        minimumPixelSize: 8
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: ""
    }

    Flow{
        id: repeat_carre
        anchors.top: parent.top
        anchors.topMargin: 120
        anchors.bottom: bt_valide_cad.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        spacing: 10

        Repeater {
            model: 10
            delegate: Rectangle {
                width: (repeat_carre.width-40) / 5
                height: (repeat_carre.height-40) / 4
                color: "#9575CD"
                opacity: 0.5
                border.width: 1
                border.color: "#65459D"

                Text{
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    color: "#FFFFFF"
                    style: Text.Outline
                    styleColor: "#000000"
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "10"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fire_cad.x = parent.x + (parent.width / 2)
                        fire_cad.y = parent.y + repeat_carre.y + (parent.height / 2)
                        if ( parent.opacity < 1 )
                        {
                            parent.opacity = 1
                            wl_cumul_comp = wl_cumul_comp + 10
                        }
                        else
                        {
                            parent.opacity = 0.5
                            wl_cumul_comp = wl_cumul_comp - 10
                        }
                    }
                }
            }
        }

        Repeater {
            model: 9
            delegate: Rectangle {
                width: (repeat_carre.height / 2)/3
                height: width
                radius: width
                color: "#7986CB"
                opacity: 0.5
                border.width: 1
                border.color: "#49569B"

                Text{
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    color: "#FFFFFF"
                    style: Text.Outline
                    styleColor: "#000000"
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "1"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fire_cad.x = parent.x + (parent.width / 2)
                        fire_cad.y = parent.y + repeat_carre.y + (parent.height / 2)

                        if ( parent.opacity < 1 )
                        {
                            parent.opacity = 1
                            wl_cumul_comp = wl_cumul_comp + 1
                        }
                        else
                        {
                            parent.opacity = 0.5
                            wl_cumul_comp = wl_cumul_comp - 1
                        }
                    }
                }
            }
        }

        Rectangle {
            id: super_cad
            width: (repeat_carre.height / 2)/3
            height: width
            radius: width
            color: "#FF75CD"
            opacity: 0.5
            border.width: 1
            border.color: "#EF459D"

            Text{
                anchors.fill: parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
                text: "5"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fire_cad.x = parent.x + (parent.width / 2)
                    fire_cad.y = parent.y + repeat_carre.y + (parent.height / 2)

                    if ( parent.opacity < 1 )
                    {
                        parent.opacity = 1
                        wl_cumul_comp = wl_cumul_comp + 5
                    }
                    else
                    {
                        parent.opacity = 0.5
                        wl_cumul_comp = wl_cumul_comp - 5
                    }
                }
            }
        }
    }

    Item{
        id: bt_valide_cad
        width: (parent.width/2)
        height: 60
        x: (parent.width/2)-10
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

    ParticleSystem {
        id: particles_cad
        anchors.fill: parent
        z: 999

        ImageParticle {
            source: "../Images/star.png"
            rotationVariation: 90
        }

        Emitter {
            id: fire_cad
            system: particles_cad
            x: -70
            y: 70

            emitRate: 100
            lifeSpan: 1000

            acceleration: PointDirection { yVariation: 5; xVariation: 3 }
            velocity: PointDirection {xVariation: 3; yVariation: 5}

            size: 64
            sizeVariation: 8
            endSize: 0

            Behavior on y {
                NumberAnimation {
                    easing.amplitude: 0.5
                    duration: 2000
                    easing.type: Easing.OutBounce
                }
            }

            Behavior on x {
                NumberAnimation {
                    easing.amplitude: 0.5
                    duration: 2000
                    easing.type: Easing.OutBounce
                }
             }
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        change_values()
        particles_cad.start()
    }

    function change_values()
    {
        fire_cad.x = -400
        fire_cad.y = -400

        if ( wl_diff == 0 )
        {
            super_cad.visible = false
            repeat_carre.children[14].visible = true
            repeat_carre.children[15].visible = true
            repeat_carre.children[16].visible = true
            repeat_carre.children[17].visible = true
            repeat_carre.children[18].visible = true
        }
        else
        {
            super_cad.visible = true
            repeat_carre.children[14].visible = false
            repeat_carre.children[15].visible = false
            repeat_carre.children[16].visible = false
            repeat_carre.children[17].visible = false
            repeat_carre.children[18].visible = false
        }

        for (var i = 0; i < repeat_carre.children.length; i++)
        {
            repeat_carre.children[i].opacity = 0.5
        }

        wl_cumul_comp = 0
        wl_calc_val_1 = Math.ceil(Math.random() * wl_current_max)
        exo_compadix_operation.text = "Ecrire : " + wl_calc_val_1
    }

    function fn_valide_exocalc()
    {
        if ( wl_cumul_comp == wl_calc_val_1 )
        {
            result_question.fn_show_hit("OK")

            wl_cumul_comp = 0

            if ( wl_current_point > 10 )
            {
                wl_current_max = wl_current_max+8
                wl_current_level++
                wl_current_point = 0

                if ( wl_current_point_cumul > 100 )
                {
                    particles_cad.stop()
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

            for (var i = 0; i < repeat_carre.children.length; i++)
            {
                repeat_carre.children[i].opacity = 0.5
            }

            wl_cumul_comp = 0
        }
    }
}

