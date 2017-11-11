import QtQuick 2.0

Item {
    id: root
    visible: true
    height: 50

    signal clicked()

    property string button_title: ""

    property color gradcolor_1: "#ffa343"
    property color gradcolor_2: "#e66d14"
    property color textcolor: "#FFFFFF"

    property color save_gradcolor_1
    property color save_gradcolor_2

    Rectangle{
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: gradcolor_1 }
            GradientStop { position: 1.0; color: gradcolor_2 }
        }

        border.color: Qt.darker(gradcolor_2,1.2)
        border.width: 2
        radius: 6

        Text{
            text: button_title
            x: 10
            y: 10
            width: parent.width - 20
            height: parent.height - 20
            color: textcolor
            minimumPixelSize: 8
            font.pixelSize: 128
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                save_gradcolor_1 = gradcolor_1
                save_gradcolor_2 = gradcolor_2
                gradcolor_1 = Qt.darker(save_gradcolor_1,1.1)
                gradcolor_2 = Qt.darker(save_gradcolor_2,1.1)
            }
            onExited: {
                gradcolor_1 = save_gradcolor_1
                gradcolor_2 = save_gradcolor_2
            }
            onClicked:  {
                root.clicked()
            }
        }
    }
}
