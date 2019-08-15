import QtQuick 2.0

Item {
    id: root_number
    property int wl_col_number: 0
    property int wl_row_number: 0
    property string wl_str_txt: ""
    property string wl_color: "#aa222222"

    property int wl_angle: 0

    width: (parent.width-6) / 6
    height: (parent.height-6) / 6

    Behavior on y {
        NumberAnimation {
            easing.amplitude: 1.8
            easing.overshoot: 0
            duration: 800
            easing.type: Easing.OutBounce
        }
    }

    function fn_destroy()
    {
        rect_number.angle = 40
        timer_destroy_number.start()
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: wl_color
        border.width: 1
        border.color: Qt.darker(color, 1.5)
        radius: 3

        transform: Rotation {
            id: rect_number
            origin.x: parent.width/2
            origin.y: parent.height/2
            axis { x: 0; y: 1; z: 0 }
            angle: wl_angle

            Behavior on angle {
                NumberAnimation {
                    easing.overshoot: 0
                    duration: 200
                    easing.type: Easing.Linear
                }
            }
        }

        Text{
            anchors.fill: parent
            anchors.margins: 6
            minimumPixelSize: 4
            font.pixelSize: 128
            fontSizeMode: Text.Fit
            color: "#FFFFFF"
            style: Text.Outline
            styleColor: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: wl_str_txt
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                fn_yaclick(wl_str_txt, wl_row_number, wl_col_number)
            }
        }
    }

    Timer {
        id: timer_destroy_number
        interval: 180
        running: false
        repeat: false
        onTriggered: {
            root_number.destroy()
        }
    }
}
