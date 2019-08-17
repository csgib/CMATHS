import QtQuick 2.12
import QtQuick.Particles 2.0
import QtGraphicalEffects 1.0
import "../WIDGETS/"

Item {
    property int wl_current_motif: 0
    property int wl_current_motif_item: 0
    property var array_Column: ["A", "B", "C", "D", "E","F"]
    property var array_motif: [
        ["A2", "A5", "B1", "B3", "B4", "B6", "C1", "C6", "D2", "D5", "E3", "E4"],
        ["A1", "A6", "B2", "B5", "C3", "C4", "D3", "D4", "E2", "E5", "F1", "F6"],
        ["A1", "A2", "A3", "B1", "B3", "C1", "C2", "C3", "D4", "D5", "D6", "E4", "E6", "F4", "F5", "F6"],
        ["A2", "A5", "B1", "B3", "B4", "B6", "C1", "C6", "D2", "D5", "E3", "E4"],
        ["A2", "A4", "A6", "B1", "B3", "B5", "C2", "C4", "C6", "D1", "D3", "D5", "E2", "E4", "E6", "F1", "F3", "F5"],
        ["A2", "A5", "B1", "B2", "B5", "B6", "E1", "E3", "E4", "E6", "F2", "F3", "F4", "F5"],
        ["A1", "A6", "B1", "B2", "B5", "B6", "C1", "C3", "C4", "C6", "D1", "D3", "D4", "D6", "E1", "E2", "E5", "E6", "F1", "F6"],
        ["B2", "B3", "B4", "B5", "C2", "C5", "D2", "D5", "E2", "E5", "F1", "F2", "F3", "F4", "F5", "F6"]
    ]

    WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            particles_grid.stop()
            fn_close_activity()
        }
    }

    Flow {
        id: flow_grid
        anchors.top: txtconsgrid.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 1

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"
        }

        Repeater {
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "transparent"

                Text{
                    anchors.fill:  parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: index+1
                    color: "#FFFFFF"
                    style: Text.Outline
                    styleColor: "#000000"
                }
            }
        }

        //

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"
            Text{
                anchors.fill:  parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "A"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            id: r1g
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "#AAAAAAAA"
                border.width: 1
                border.color: "transparent"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick("A" + (index+1))
                    }
                }
            }
        }

        //

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"

            Text{
                anchors.fill:  parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "B"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            id: r2g
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "#77FFFFFF"
                border.width: 1
                border.color: "transparent"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick("B" + (index+1))
                    }
                }
            }
        }

        //

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"

            Text{
                anchors.fill:  parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "C"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            id: r3g
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "#AAAAAAAA"
                border.width: 1
                border.color: "transparent"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick("C" + (index+1))
                    }
                }
            }
        }

        //

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"

            Text{
                anchors.fill:  parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "D"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            id: r4g
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "#77FFFFFF"
                border.width: 1
                border.color: "transparent"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick("D" + (index+1))
                    }
                }
            }
        }

        //

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"

            Text{
                anchors.fill:  parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "E"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            id: r5g
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "#AAAAAAAA"
                border.width: 1
                border.color: "transparent"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick("E" + (index+1))
                    }
                }
            }
        }

        //

        Rectangle {
            width: (parent.width-8) / 7
            height: (parent.height-8) / 9
            color: "transparent"

            Text{
                anchors.fill:  parent
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "F"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }

        Repeater {
            id: r6g
            model: 6
            delegate: Rectangle {
                width: (parent.width-8) / 7
                height: (parent.height-8) / 9
                color: "#77FFFFFF"
                border.width: 1
                border.color: "transparent"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fn_yaclick("F" + (index+1))
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

    DropShadow {
        anchors.fill: txtconsgrid
        horizontalOffset: 0
        verticalOffset: 0
        radius: 20.0
        samples: 20
        color: "#AAFFFFFF"
        source: txtconsgrid
    }

    ParticleSystem {
        id: particles_grid
        anchors.fill: parent
        z: 999

        ImageParticle {
            source: "../Images/star.png"
            rotationVariation: 90
        }

        Emitter {
            id: fire_grid
            system: particles_grid
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

    function init_work()
    {
        wl_current_motif = 0
        wl_current_motif_item = 0
        particles_grid.start()
        change_level()
    }

    function change_values()
    {
        txtconsgrid.text = array_motif[wl_current_motif][wl_current_motif_item]
    }

    function change_level()
    {
        for (var i = 0; i < 6; i++)
        {
            r1g.itemAt(i).color = "#55FFFFFF"
        }

        for (i = 0; i < 6; i++)
        {
            r2g.itemAt(i).color = "#55FFFFFF"
        }

        for (i = 0; i < 6; i++)
        {
            r3g.itemAt(i).color = "#55FFFFFF"
        }

        for (i = 0; i < 6; i++)
        {
            r4g.itemAt(i).color = "#55FFFFFF"
        }

        for (i = 0; i < 6; i++)
        {
            r5g.itemAt(i).color = "#55FFFFFF"
        }

        for (i = 0; i < 6; i++)
        {
            r6g.itemAt(i).color = "#55FFFFFF"
        }

        wl_current_motif = Math.ceil(Math.random() * 8)-1
        array_motif[wl_current_motif].sort(function(a, b){return a-b})

        change_values()
    }

    function fn_yaclick(wl_coord)
    {
        if ( wl_coord == txtconsgrid.text)
        {
            var wl_row = wl_coord.substr(0,1)
            var wl_col = (wl_coord.substr(1,1)-1)
            var wl_x = 0
            var wl_y = 0

            switch(wl_row){
              case "A":
                  wl_x = r1g.itemAt(wl_col).x
                  wl_y = r1g.itemAt(wl_col).y
                  r1g.itemAt(wl_col).color = "#AA9575CD"
                  break;
              case "B":
                  wl_x = r2g.itemAt(wl_col).x
                  wl_y = r2g.itemAt(wl_col).y
                  r2g.itemAt(wl_col).color = "#AA9575CD"
                  break;
              case "C":
                  wl_x = r3g.itemAt(wl_col).x
                  wl_y = r3g.itemAt(wl_col).y
                  r3g.itemAt(wl_col).color = "#AA9575CD"
                  break;
              case "D":
                  wl_x = r4g.itemAt(wl_col).x
                  wl_y = r4g.itemAt(wl_col).y
                  r4g.itemAt(wl_col).color = "#AA9575CD"
                  break;
              case "E":
                  wl_x = r5g.itemAt(wl_col).x
                  wl_y = r5g.itemAt(wl_col).y
                  r5g.itemAt(wl_col).color = "#AA9575CD"
                  break;
              case "F":
                  wl_x = r6g.itemAt(wl_col).x
                  wl_y = r6g.itemAt(wl_col).y
                  r6g.itemAt(wl_col).color = "#AA9575CD"
                  break;
            }

            fire_grid.x = wl_x + (r1g.itemAt(0).width/2)
            fire_grid.y = wl_y + flow_grid.y + (r1g.itemAt(0).height/2)

            wl_current_motif_item++

            if ( wl_current_motif_item >= array_motif[wl_current_motif].length )
            {
                wl_current_motif_item = 0
                wl_current_point_cumul++
                result_question.fn_show_hit("OK")
                if ( wl_current_point_cumul == 11 )
                {
                    particles_grid.stop()
                    fn_show_victory()
                }
                else
                {
                    progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/10
                    fire_grid.x = -400
                    fire_grid.y = -400
                    change_level()
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
        }
    }
}
