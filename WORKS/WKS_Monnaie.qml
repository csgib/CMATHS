import QtQuick 2.0
import "../WIDGETS/"

Item {
    property real wg_cumul_monnaie: 0
    property int wg_sens: 0

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
        height: 60
        minimumPixelSize: 8
        font.pixelSize: 512
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        text: "Clique sur les pièces pour obtenir le prix du jouet"
        anchors.right: parent.right
        anchors.rightMargin: 41
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "#FFFFFF"
        style: Text.Outline
        styleColor: "#000000"
    }

    Flow{
        id: flowmonnaie
        x: 10
        width: parent.width - 20
        height: 150
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        spacing: 10
        Image {
            id: p0
            width: (parent.width-30)/3
            height: (parent.height-10)/2
            cache: false
            fillMode: Image.PreserveAspectFit
            source: ""
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            asynchronous: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_put_monnaie(0)
                }
            }
        }
        Image {
            id: p1
            width: (parent.width-30)/3
            height: (parent.height-10)/2
            cache: false
            fillMode: Image.PreserveAspectFit
            source: ""
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            asynchronous: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_put_monnaie(1)
                }
            }
        }
        Image {
            id: p2
            width: (parent.width-30)/3
            height: (parent.height-10)/2
            cache: false
            fillMode: Image.PreserveAspectFit
            source: ""
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            asynchronous: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_put_monnaie(2)
                }
            }
        }
        Image {
            id: p3
            width: (parent.width-30)/3
            height: (parent.height-10)/2
            cache: false
            fillMode: Image.PreserveAspectFit
            source: ""
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            asynchronous: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_put_monnaie(3)
                }
            }
        }
        Image {
            id: p4
            width: (parent.width-30)/3
            height: (parent.height-10)/2
            cache: false
            fillMode: Image.PreserveAspectFit
            source: ""
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            asynchronous: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fn_put_monnaie(4)
                }
            }
        }
    }


    Flow{
        id: action_monnaie
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: flowmonnaie.top
        anchors.bottomMargin: 10
        spacing: 10
        WID_Button{
            button_title: "Annuler"
            width: (parent.width/2)-10
            height: parent.height
            onClicked: {
                fn_cancel_exomonnaie()
            }
        }
        WID_Button{
            button_title: "Valider"
            width: (parent.width/2)-10
            height: parent.height
            gradcolor_2: "#DCE775"
            gradcolor_1: "#D4E157"
            textcolor: "#222222"
            onClicked: {
                fn_valide_exomonnaie()
            }
        }
    }

    Flow {
        id: flow1
        anchors.top: parent.top
        anchors.topMargin: 80
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: action_monnaie.top
        anchors.bottomMargin: 10

        Item{
            width: parent.width / 2
            height: parent.height
            Image{
                id: imgnounours
                smooth: false
                cache: false
                asynchronous: true
                anchors.fill: parent
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: "../Images/toy3.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Item{
            width: (parent.width-10)/2
            height: parent.height
            Text{
                id: price_monnaie
                y: 0
                x: 0
                width: parent.width
                height: parent.height / 2

                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: "0"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }

            Text{
                id: cumul_enfant
                x: 0
                y: parent.height/2
                height: parent.height / 2
                width: parent.width
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: "0"
                color: "#FFFFFF"
                style: Text.Outline
                styleColor: "#000000"
            }
        }
    }

    function init_work()
    {
        if ( wg_sens == 0 )
        {
            p0.source = "../Images/10cent.png"
            p1.source = "../Images/20cent.png"
            p2.source = "../Images/50cent.png"
            p3.source = "../Images/1euro.png"
            p4.source = "../Images/2euro.png"
        }
        else
        {
            p0.source = "../Images/b5.png"
            p1.source = "../Images/b10.png"
            p2.source = "../Images/b20.png"
            p3.source = "../Images/b50.png"
            p4.source = "../Images/b100.png"
        }

        change_values()
    }

    function change_values()
    {
        var wl_prix = 0

        cumul_enfant.text = "Dejà payé 0.00"
        wg_cumul_monnaie = 0

        if ( wg_sens == 0 )
        {
            wl_prix = 0.1 * Math.round((Math.random() * 100))

            while ( wl_prix == 0 )
            {
                wl_prix = 0.1 * Math.round((Math.random() * 100))
            }
        }
        else
        {
            wl_prix = 5 * Math.round((Math.random() * wl_current_max))

            while ( wl_prix == 0 )
            {
                wl_prix = 5 * Math.round((Math.random() * wl_current_max))
            }
        }

        price_monnaie.text = wl_prix.toFixed(2) + " €"
    }

    function fn_put_monnaie(id_piece)
    {
        if ( wg_sens == 0 )
        {
            switch(id_piece){
            case 0:
                wg_cumul_monnaie += 0.10
                break;
            case 1:
                wg_cumul_monnaie += 0.20
                break;
            case 2:
                wg_cumul_monnaie += 0.50
                break;
            case 3:
                wg_cumul_monnaie += 1
                break;
            case 4:
                wg_cumul_monnaie += 2
                break;
            }
        }
        else
        {
            switch(id_piece){
            case 0:
                wg_cumul_monnaie += 5
                break;
            case 1:
                wg_cumul_monnaie += 10
                break;
            case 2:
                wg_cumul_monnaie += 20
                break;
            case 3:
                wg_cumul_monnaie += 50
                break;
            case 4:
                wg_cumul_monnaie += 100
                break;
            }
        }

        cumul_enfant.text = "Déjà payé " + wg_cumul_monnaie.toFixed(2) + "€"
    }

    function fn_cancel_exomonnaie()
    {
        cumul_enfant.text = "Déjà payé 0.00 €"
        wg_cumul_monnaie = 0
    }

    function fn_valide_exomonnaie()
    {
        if ( price_monnaie.text.substr(0,price_monnaie.text.length-2) == wg_cumul_monnaie.toFixed(2) )
        {
            result_question.fn_show_hit("OK")

            if ( wl_current_point > 10 )
            {
                wl_current_max = 20+(10*wl_current_level)
                wl_current_level++
                wl_current_point = 0

                if ( wl_current_point_cumul >= 50 )
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
            fn_cancel_exomonnaie()
        }
    }
}
