import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.0

Item {
    property int congra_current_acitivity: 0

    Rectangle{
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#000000"
    }

    Text{
        x: 10
        y: 20
        width: parent.width - 20
        height: parent.height - 40
        minimumPixelSize: 6
        font.pixelSize: 128
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        text: "Félicitations ! Tu as terminé cet exercice, mais n'hésite pas à le recommencer plus tard"
        font.family: local_school.name
        color: "#FFFFFF"
    }

    ParticleSystem {
        id: particleSystem_victory
        running: false
    }

    Emitter {
        id: emitter
        anchors.fill: parent
        system: particleSystem_victory
        emitRate: 100
        lifeSpan: 700
        lifeSpanVariation: 0
        size: 40
        velocity: AngleDirection {
            angle: 80
            angleVariation: 50
            magnitude: 200
            magnitudeVariation: 50
        }
    }

    ImageParticle {
        source: "Images/star.png"
        color: "#31d1fe"
        alphaVariation: 0.2
        colorVariation: 1.0
        rotation: 90
        rotationVelocity: 90
        system: particleSystem_victory
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            fn_close_activity()
            victory_screen.x = frm_application.width*2
            particleSystem_victory.stop()
            youwin.stop()
        }
    }

    function start_boom()
    {
        particleSystem_victory.start()
    }
}
