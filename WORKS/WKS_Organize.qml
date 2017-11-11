import QtQuick 2.0
import QtQuick.Controls 2.2
import "../WIDGETS/"

Item {
    property int sens_count: 0
    property int wg_current_answer: 0
    property string wg_result: ""
    property string wg_result_user: ""

    WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            fn_close_activity(2)
        }
    }

    WID_Button{
        id: bt_restart_organize
        x: 10
        width: parent.width-20
        y: parent.height - 60
        button_title: "Recommencer l'éxercice"
        onClicked: {
            fn_restart_exo()
        }
    }

    Item{
        x: 10
        width: parent.width - 20
        anchors.top: parent.top
        anchors.topMargin: 100
        clip: false
        anchors.bottom: bt_restart_organize.top
        anchors.bottomMargin: 10

        Flow{
            id: flow_exo_orga_1
            width: parent.width
            height: (parent.height-20) / 2

            spacing: 10

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAFFFFFF"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10

                Text{
                    id: val1
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                               fn_put_value(parent)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAFFFFFF"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10

                Text{
                    id: val2
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                               fn_put_value(parent)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAFFFFFF"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10

                Text{
                    id: val3
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                               fn_put_value(parent)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAFFFFFF"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10

                Text{
                    id: val4
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                               fn_put_value(parent)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAFFFFFF"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10

                Text{
                    id: val5
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                               fn_put_value(parent)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAFFFFFF"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10

                Text{
                    id: val6
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                               fn_put_value(parent)
                        }
                    }
                }
            }
        }

        Flow{
            width: parent.width
            height: (parent.height-20) / 2
            anchors.top: flow_exo_orga_1.bottom
            anchors.topMargin: 10
            spacing: 10

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAffcffe"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10
                Text{
                    id: rval1
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAffcffe"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10
                Text{
                    id: rval2
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAffcffe"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10
                Text{
                    id: rval3
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAffcffe"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10
                Text{
                    id: rval4
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAffcffe"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10
                Text{
                    id: rval5
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle{
                width: (parent.width - 50)/6
                height: parent.height
                color: "#AAffcffe"
                border.color: Qt.darker(color, 1.5)
                border.width: 3
                radius: 10
                Text{
                    id: rval6
                    anchors.fill: parent
                    minimumPixelSize: 8
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        change_values()
    }

    function change_values()
    {
        var wl_idx = 0
        var wl_values = []
        var wl_value = 0

        rval1.text = ""
        rval2.text = ""
        rval3.text = ""
        rval4.text = ""
        rval5.text = ""
        rval6.text = ""

        while ( wl_idx < 6 )
        {
            wl_value = Math.ceil(Math.random() * wl_current_max)
            while ( wl_values.indexOf(wl_value, 0) >= 0 )
            {
                wl_value = Math.ceil(Math.random() * wl_current_max)
            }

            wl_values[wl_idx] = wl_value * 1
            wl_idx++
        }

        val1.text = wl_values[0]
        val2.text = wl_values[1]
        val3.text = wl_values[2]
        val4.text = wl_values[3]
        val5.text = wl_values[4]
        val6.text = wl_values[5]

        if ( sens_count == 0 )
        {
            wl_values.sort(function(a, b){return a-b})
        }
        else
        {
            wl_values.sort(function(a, b){return a-b})
            wl_values.reverse()
        }

        wg_result = wl_values.toString()

        val1.visible = true
        val2.visible = true
        val3.visible = true
        val4.visible = true
        val5.visible = true
        val6.visible = true

        wg_current_answer = 0
    }

    function fn_put_value(wl_obj)
    {
        switch(wg_current_answer){
          case 0:
               rval1.text = wl_obj.text
               break;
          case 1:
               rval2.text = wl_obj.text
               break;
          case 2:
               rval3.text = wl_obj.text
               break;
          case 3:
               rval4.text = wl_obj.text
               break;
          case 4:
               rval5.text = wl_obj.text
               break;
          case 5:
               rval6.text = wl_obj.text
               break;
        }


        wl_obj.visible = false
        wg_current_answer++

        if ( wg_current_answer > 5 )
        {
            fn_valide_result()
            wg_current_answer = 0
        }

    }

    function fn_restart_exo()
    {
        rval1.text = ""
        rval2.text = ""
        rval3.text = ""
        rval4.text = ""
        rval5.text = ""
        rval6.text = ""

        val1.visible = true
        val2.visible = true
        val3.visible = true
        val4.visible = true
        val5.visible = true
        val6.visible = true

        wg_current_answer = 0
    }

    function fn_valide_result()
    {
        wg_result_user = rval1.text + "," + rval2.text + "," + rval3.text + "," + rval4.text + "," + rval5.text + "," + rval6.text

        if (wg_result != wg_result_user)
        {
            result_question.fn_show_hit("NOK")

            fn_restart_exo()
        }
        else
        {
            result_question.fn_show_hit("OK")

            if ( wl_current_point_cumul%10 == 10 )
            {
                wl_current_max = 20+(10*wl_current_level)
                wl_current_level++
                wl_current_point = 0


                if ( wl_current_point_cumul >= 100 )
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
    }
}
