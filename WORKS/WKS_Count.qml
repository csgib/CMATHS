import QtQuick 2.0
import "../WIDGETS/"

Item {
    property var array_fruits: ["../Images/candy0.png", "../Images/candy1.png", "../Images/candy2.png", "../Images/candy3.png"]
    property int wl_good_result: 0

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
        id: textcsg
        height: 91
        minimumPixelSize: 8
        width: parent.width - 180
        font.pixelSize: 512
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        text: "Comptez le nombre de : "
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    Image{
        id: textfruit
        height: 91
        fillMode: Image.PreserveAspectFit
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.left: textcsg.right
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    Item{
        id: support_flow_exo_3
        anchors.top: textcsg.bottom
        anchors.topMargin: 10
        x: (parent.width-height)/2

        Flow{
            id: flow_exo_3
            anchors.fill: parent
            spacing: 10
        }
    }

    Item{
        id: item2
        x: 10
        y: parent.height - 200
        width: parent.width - 20
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Flow{
            id: flow_exo_3_answers
            anchors.fill: parent
            spacing: 10

            Rectangle{
                width: (parent.width-40)/4
                height: 100
                color: "#ffa343"
                border.color: "#e66d14"
                border.width: 3
                radius: 10
                Text{
                    id: rval_3_1
                    color: "#FFFFFF"
                    anchors.fill: parent
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            fn_valide_result(parent.text)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/4
                height: 100
                color: "#ffa343"
                border.color: "#e66d14"
                border.width: 3
                radius: 10
                Text{
                    id: rval_3_2
                    color: "#FFFFFF"
                    anchors.fill: parent
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            fn_valide_result(parent.text)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/4
                height: 100
                color: "#ffa343"
                border.color: "#e66d14"
                border.width: 3
                radius: 10
                Text{
                    id: rval_3_3
                    color: "#FFFFFF"
                    anchors.fill: parent
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            fn_valide_result(parent.text)
                        }
                    }
                }
            }

            Rectangle{
                width: (parent.width-40)/4
                height: 100
                color: "#ffa343"
                border.color: "#e66d14"
                border.width: 3
                radius: 10
                Text{
                    id: rval_3_4
                    color: "#FFFFFF"
                    anchors.fill: parent
                    minimumPixelSize: 4
                    font.pixelSize: 128
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            fn_valide_result(parent.text)
                        }
                    }
                }
            }
        }
    }

    // *** MUST ALWAYS HAVE THIS ENTRY POINT IN WORK FOR INITIALIZE ***
    function init_work()
    {
        if ( frm_application.width < frm_application.height )
        {
            support_flow_exo_3.width = frm_application.width - 20
            support_flow_exo_3.height = support_flow_exo_3.width
            support_flow_exo_3.x = 10
        }
        else
        {
            support_flow_exo_3.width = item2.y - 120
            support_flow_exo_3.height = support_flow_exo_3.width
            support_flow_exo_3.x = (frm_application.width - support_flow_exo_3.width)/2
        }

        change_values()
    }

    function change_values()
    {
        for (var i = 0; i < flow_exo_3.children.length; i++)
        {
            flow_exo_3.children[i].destroy()
        }

        var component
        var sprite

        var wl_idx = 0
        var wl_max = Math.ceil(Math.random() * wl_current_max)
        if ( wl_max%2 != 0 )
        {
            wl_max++
        }

        if ( wl_max < 1 )
        {
            wl_max = 9
        }

        var wl_candy = 0
        var wl_candy_cpt = Math.ceil(Math.random() * 4)
        if ( wl_candy_cpt > 3 )
        {
            wl_candy_cpt = 0
        }

        textfruit.source = array_fruits[wl_candy_cpt]

        wl_good_result = 0

        while ( wl_idx < wl_max )
        {
            wl_candy = Math.ceil(Math.random() * 4)

            if ( wl_candy > 3 )
            {
                wl_candy = 0
            }

            if ( wl_candy == wl_candy_cpt )
            {
                wl_good_result++
            }

            component = Qt.createComponent("../WIDGETS/Item_Image.qml");
            sprite = component.createObject(flow_exo_3, {"wg_max_item": wl_max, "wl_id_candy": wl_candy})
            wl_idx++
        }

        var wl_variance = Math.ceil(Math.random() * 3)
        var wl_min_val = 0
        if ( wl_good_result == 0 )
        {
            wl_min_val = wl_good_result + 3
        }
        else
        {
            wl_min_val = wl_good_result - 1
        }

        if ( wl_variance <= 1 )
        {


            rval_3_1.text = wl_min_val
            rval_3_2.text = wl_good_result
            rval_3_3.text = wl_good_result+1
            rval_3_4.text = wl_good_result+2
        }
        else
        {
            if ( wl_variance == 2 )
            {
                rval_3_1.text = wl_good_result+1
                rval_3_2.text = wl_min_val
                rval_3_3.text = wl_good_result
                rval_3_4.text = wl_good_result+2
            }
            else
            {
                rval_3_1.text = wl_good_result
                rval_3_2.text = wl_good_result+1
                rval_3_3.text = wl_min_val
                rval_3_4.text = wl_good_result+2
            }
        }
    }

    function fn_valide_result(wl_result)
    {
        if ( wl_result*1 == wl_good_result )
        {
            result_question.fn_show_hit("OK")

            if ( wl_current_point > 10 )
            {
                wl_current_max = 20+(2*wl_current_level)
                wl_current_level++
                wl_current_point = 0

                if ( wl_current_point_cumul > 100 )
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
        }
    }
}
