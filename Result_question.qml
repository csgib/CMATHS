import QtQuick 2.0
import QtMultimedia 5.9

Item {
    id: id_scr_ans
    anchors.centerIn: parent
    opacity: 0

    Rectangle{
        anchors.fill: parent
        color: "#FFFFFF"
        z: 10

        AnimatedImage {
            anchors.fill: parent
            id: animation_nan
            cache: false
            smooth: false
            source: "Images/nan.gif"
            playing: false
            asynchronous: true
            fillMode: Image.PreserveAspectFit
        }

        AnimatedImage {
            anchors.fill: parent
            id: animation_yes
            cache: false
            smooth: false
            source: "Images/yes.gif"
            playing: false
            asynchronous: true
            fillMode: Image.PreserveAspectFit
        }
    }

    function fn_show_hit(result)
    {       
        //if ( opacity == 0 )
        //{
            id_scr_ans.opacity = 1
            timer_hide.start()
        //}

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
        animation_nan.playing = false
        animation_yes.playing = false

        support_game.x = 0
        id_scr_ans.opacity = 0
    }

    Timer {
        id: timer_hide
        interval: 3000
        running: false
        repeat: false
        onTriggered: fn_hide_hit()
    }
}
