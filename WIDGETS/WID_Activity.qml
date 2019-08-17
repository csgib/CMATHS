import QtQuick 2.12

Item {
    property string wg_txt_activity
    property int wg_id_activity
    property real wg_niv_1: 0.3
    property real wg_niv_2: 0.3
    property real wg_niv_3: 0.3
    property string wg_text_expl: ""

    width: 350
    height: 200

    Rectangle{
        color: "#aaffffff"
        anchors.fill: parent
        border.width: 1
        border.color: "#5c0638"
        z: 0
    }

    Image{
        anchors.fill: parent
        fillMode: Image.Tile
        cache: false
        smooth: false
        source: "../Images/grid.png"
    }

    Rectangle {
        x: parent.width-41
        y: 1
        width: 40
        height: 40
        color: "#CE93D8"
        border.color: "#ab47bc"
        border.width: 1
        opacity: wg_niv_3

        Text{
            anchors.fill: parent
            text: "CE2"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#FFFFFF"
        }
    }

    Rectangle {
        x: parent.width-81
        y: 1
        width: 40
        height: 40
        color: "#F48FB1"
        border.color: "#EC407A"
        border.width: 1
        opacity: wg_niv_2

        Text{
            anchors.fill: parent
            text: "CE1"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#FFFFFF"
        }
    }

    Rectangle {
        x: parent.width-121
        y: 1
        width: 40
        height: 40
        color: "#B39DDB"
        border.color: "#7E57C2"
        border.width: 1
        opacity: wg_niv_1

        Text{
            anchors.fill: parent
            text: "CP"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#FFFFFF"
        }
    }

    Text {
        x: 260
        height: 62
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 130
        font.pixelSize: 12
        text: wg_text_expl
        anchors.top: parent.top
        anchors.topMargin: 48
    }

    Text{
        anchors.bottom: parent.bottom
        anchors.margins: 10
        height: 80
        minimumPixelSize: 4
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        text: wg_txt_activity
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 130
        font.family: local_school.name
        color: "#000000"
        z: 2
    }

    MouseArea{
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        onClicked: {
            fn_start_activty(wg_id_activity)
        }
    }

    Image {
        x: 1
        y: 1
        width: 250
        height: 198
        fillMode: Image.PreserveAspectCrop
        source: "../Images/fd_activity.png"
        asynchronous: true
    }
}
