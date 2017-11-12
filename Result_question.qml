import QtQuick 2.0
import QtMultimedia 5.9

Item {
    anchors.centerIn: parent
    opacity: 0

    SoundEffect {
        id: nanbruitage
        source: "Sounds/nan.wav"
        volume: 1.0
    }

    SoundEffect {
        id: ouibruitage
        source: "Sounds/oui.wav"
        volume: 1.0
    }

    Rectangle{
        anchors.fill: parent
        color: "#FFFFFF"
        z: 10

        AnimatedImage {
            anchors.fill: parent
            id: animation_nan
            cache: true
            smooth: false
            source: "Images/nan.gif"
            playing: false
            fillMode: Image.PreserveAspectFit
        }

        AnimatedImage {
            anchors.fill: parent
            id: animation_yes
            cache: true
            smooth: false
            source: "Images/yes.gif"
            playing: false
            fillMode: Image.PreserveAspectFit
        }
    }

    SequentialAnimation on opacity{
        id: show
        running: false
        loops: 1
        NumberAnimation {
            from: 0
            to: 1
            duration: 20
            easing.type: Easing.Linear
        }
    }

    SequentialAnimation on opacity{
        id: hide
        running: false
        loops: 1
        NumberAnimation {
            from: 1
            to: 0
            duration: 300
            easing.type: Easing.InOutBack
        }
    }

    function fn_show_hit(result)
    {       
        if ( opacity == 0 )
        {
            show.start()
            timer_hide.start()
        }
        else
        {
            timer_hide.restart()
        }

        if ( result == "OK" )
        {
            animation_nan.visible = false

            animation_yes.currentFrame = 0
            animation_yes.visible = true
            animation_yes.playing = true
            ouibruitage.play()

            wl_current_point++
            wl_current_point_cumul++
            progress_bar_value.width = (wl_current_point_cumul*progress_bar.width)/100

            support_game.x = frm_application.width
        }
        else
        {
            animation_yes.visible = false

            animation_nan.currentFrame = 0
            animation_nan.visible = true
            animation_nan.playing = true
            nanbruitage.play()

            support_game.x = frm_application.width
        }
    }

    function fn_hide_hit()
    {
        if ( animation_nan.playing == true )
        {
            animation_nan.playing = false
        }

        if ( animation_yes.playing == true )
        {
            animation_yes.playing = false
        }
        support_game.x = 0
        hide.start()
    }

    Timer {
        id: timer_hide
        interval: 3000
        running: false
        repeat: false
        onTriggered: fn_hide_hit()
    }
}
