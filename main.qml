import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.3
import QtMultimedia 5.9
import "WORKS/"
import "WIDGETS/"

ApplicationWindow {
    id: frm_application
    visible: true
    width: 480
    height: 800
    visibility: Window.Maximized
    title: "CMATHS"

    // *** BLOCK FOR LEVELS ***
    property int wl_current_level: 1
    property int wl_current_point: 0
    property int wl_current_max: 20
    property int wl_current_point_cumul: 0
    property int wl_current_activity: 0

    // *** APPLICATION FONTS ***
    FontLoader { id: local_school; source: "Fonts/GrandHotel-Regular.ttf" }

    SoundEffect {
        id: exo1bruitage
        source: "Sounds/exo_compare.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exo2bruitage
        source: "Sounds/exo_pppg.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exo2bruitage2
        source: "Sounds/exo_pgpp.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exoadd
        source: "Sounds/exo_additions.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exosous
        source: "Sounds/exo_soustractions.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exoadix
        source: "Sounds/exo_adix.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exoalgo
        source: "Sounds/exo_alogo.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exocompte
        source: "Sounds/exo_compte.wav"
        volume: 1.0
    }

    SoundEffect {
        id: youwin
        source: "Sounds/youwin.wav"
        volume: 1.0
        loops: 2
    }

    SoundEffect {
        id: exotadd
        source: "Sounds/exo_table_add.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exotmul
        source: "Sounds/exo_table_mul.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exocomplete
        source: "Sounds/exo_complete.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exopieces
        source: "Sounds/exo_pieces.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exogrid
        source: "Sounds/exo_grid.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exoheures
        source: "Sounds/exo_heures.wav"
        volume: 1.0
    }

    Start_screen{
        id: start_screen
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        visible: true
        z: 0
    }

    Choice_menu{
        id: choice_menu
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        visible: false
        z: 2
    }

    Item{
        id: support_game
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        visible: false
        z: 3

        Item{
            id: consignes
            x: 0
            y: -parent.height
            z: 5
            width: parent.width
            height: parent.height
            visible: true

            Behavior on y {
                NumberAnimation {
                    easing.overshoot: 0
                    duration: 500
                    easing.type: Easing.OutBack
                }
            }

            Rectangle{
                color: "#365E4B"
                x: 0
                y: 0
                z: 0
                anchors.fill: parent
            }

            Text{
                z: 2
                x: 100
                y: 100
                font.family: local_school.name
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                width: parent.width - 200
                height: parent.height - 250
                id: consignes_txt
                wrapMode: Text.WordWrap
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
            }

            WID_Button {
                width: parent.width-100
                x: 50
                y: parent.height-100
                z: 2
                button_title: "Démarrer"
                onClicked: {
                    gc()

                    choice_menu.x = frm_application.width*2
                    start_screen.x = frm_application.width*2

                    switch(wl_current_activity){
                      case 1:
                          exo1.visible = true
                          break;
                      case 2:
                          exo2.visible = true
                          break;
                      case 3:
                          exo3.visible = true
                          break;
                      case 4:
                          exo2.visible = true
                          break;
                      case 5:
                          exo4.visible = true
                          break;
                      case 6:
                          exo4.visible = true
                          break;
                      case 7:
                          exo5.visible = true
                          break;
                      case 8:
                          exo6.visible = true
                          break;
                      case 9:
                          exo7.visible = true
                          break;
                      case 10:
                          exo7.visible = true
                          break;
                      case 11:
                          exo8.visible = true
                          break;
                      case 12:
                          exo8.visible = true
                          break;
                      case 13:
                          exo9.visible = true
                          break;
                      case 14:
                          exo10.visible = true
                          break;
                      case 15:
                          exo5.visible = true
                          break;
                      case 16:
                          exo11.visible = true
                          break;
                      case 17:
                          exo9.visible = true
                          break;
                    }

                    consignes.y = Screen.height*-1
                    support_jeu.visible = true
                    choice_menu.visible = false
                }
            }
        }

        Item{
            id: support_jeu
            x: 0
            y: 0
            z: 2
            width: parent.width
            height: parent.height
            visible: false

            Item{
                id: progress_bar
                x: 0
                y: 0
                height: 10
                width: parent.width

                Rectangle{
                    x: 0
                    y: 0
                    width: parent.width
                    height: 10
                    color: "#FFFFFF"
                }
                Rectangle{
                    id: progress_bar_value
                    x: 0
                    y: 0
                    width: 0
                    height: 10
                    color: "#e66d14"
                }

                Rectangle{
                    x: 0
                    y: 9
                    width: parent.width
                    height: 1
                    color: "#bbbbbb"
                }
            }

            Item{
                x: 0
                y: 10
                width: parent.width
                height: parent.height - 10

                Rectangle{
                    z: 0
                    anchors.fill: parent
                    color: "#a780a0"
                    Image{
                        anchors.fill: parent
                        source: "Images/Background/fd1.png"
                        fillMode: Image.TileHorizontally
                    }
                    Image{
                        id: stars_back
                        anchors.top: parent.top
                        anchors.topMargin: 40
                        width: parent.width
                        opacity: 1
                        source: "Images/Background/fd2.png"
                        fillMode: Image.TileHorizontally
                    }

                    SequentialAnimation {
                        running: true
                        loops: Animation.Infinite
                        NumberAnimation {
                            target: stars_back
                            property: "opacity"
                            from: 1.0
                            to: 0.6
                            duration: 1000
                        }
                        NumberAnimation {
                            target: stars_back
                            property: "opacity"
                            from: 0.6
                            to: 1.0
                            duration: 1000
                        }
                    }

                    Image{
                        id: img_nua_1
                        anchors.top: parent.top
                        anchors.topMargin: 180
                        opacity: 0.2
                        NumberAnimation on x {
                            running: true
                            loops: Animation.Infinite
                            from: -img_nua_1.width
                            to: Screen.width
                            duration: 66000
                        }
                        source: "Images/Background/fd3.png"
                    }

                    Image{
                        id: img_nua_2
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 80
                        opacity: 0.5
                        NumberAnimation on x {
                            running: true
                            loops: Animation.Infinite
                            from: -img_nua_2.width
                            to: Screen.width
                            duration: 25000
                        }
                        source: "Images/Background/fd3.png"
                    }
                }

                WKS_Smaller_Or_Bigger{
                    id: exo1
                    x: 0
                    y: 0
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Organize{
                    id: exo2
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Count{
                    id: exo3
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Calculate{
                    id: exo4
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Complements_a_Dix{
                    id: exo5
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Algorithmes{
                    id: exo6
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Calcul_trou{
                    id: exo7
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Multiplications{
                    id: exo8
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Monnaie{
                    id: exo9
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Grid{
                    id: exo10
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Heures{
                    id: exo11
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }
            }
        }
    }

    Result_question{
        id: result_question
        x: 0
        y: 0
        anchors.fill: parent
        z: 9
        opacity: 0
    }

    Victory_screen{
        id: victory_screen
        x: frm_application.width
        y: 0
        width: parent.width
        height: parent.height
        z: 9
        visible: false

        Behavior on x {
            NumberAnimation {
                easing.overshoot: 0
                duration: 800
                easing.type: Easing.OutBack
            }
        }
    }

    // *****************************************
    // *** GLOBAL FUNCTIONS TO INIT DATABASE ***
    // *****************************************

    function fn_start_game()
    {
        choice_menu.visible = true
    }

    function fn_start_activty(wl_id_activity)
    {
        wl_current_level = 1
        wl_current_point = 0
        wl_current_max = 20
        wl_current_point_cumul = 0
        wl_current_activity = wl_id_activity
        victory_screen.congra_current_acitivity = wl_id_activity

        support_game.visible = true
        progress_bar_value.width = 0

        switch(wl_id_activity){
          case 1:
              consignes_txt.text = "Comparez les chiffres et utilisez le signe qui convient > pour plus grand que < pour plus petit que ou = si les nombres sont les mêmes"
              consignes.y = 0
              exo1bruitage.play()
              exo1.init_work()
              break;
          case 2:
              consignes_txt.text = "Remettez les chiffres et nombre dans l'ordre croissant 'du plus petit au plus grands'"
              consignes.y = 0
              exo2bruitage.play()
              exo2.sens_count = 0
              exo2.init_work()
              break;
          case 3:
              consignes_txt.text = "Comptez l'ensemble des objets comme vous l'indique la consigne"
              consignes.y = 0
              exocompte.play()
              exo3.init_work()
              break;
          case 4:
              consignes_txt.text = "Remettez les chiffres et nombre dans l'ordre décroissant 'du plus grand au plus petit'"
              consignes.y = 0
              exo2bruitage2.play()
              exo2.sens_count = 1
              exo2.init_work()
              break;
          case 5:
              consignes_txt.text = "Trouvez le résultat des additions"
              consignes.y = 0
              wl_current_max = 9
              exoadd.play()
              exo4.sens_count = 0
              exo4.init_work()
              break;
          case 6:
              consignes_txt.text = "Trouvez le résultat des soustractions"
              consignes.y = 0
              wl_current_max = 9
              exosous.play()
              exo4.sens_count = 1
              exo4.init_work()
              break;
          case 7:
              consignes_txt.text = "Composez les nombres avec les éléments carré (10) et rond (1)"
              consignes.y = 0
              wl_current_max = 20
              exo5.wl_diff = 0
              exoadix.play()
              exo5.init_work()
              break;
          case 8:
              consignes_txt.text = "Résolvez les algorithmes suivants en complétant la grille avec le motif proposé"
              consignes.y = 0
              wl_current_max = 20
              exoalgo.play()
              exo6.init_work()
              break;
          case 9:
              consignes_txt.text = "Résolvez les opérations suivantes en complétant la formule"
              consignes.y = 0
              wl_current_max = 20
              exo7.sens_count = 0
              exocomplete.play()
              exo7.init_work()
              break;
          case 10:
              consignes_txt.text = "Résolvez les opérations suivantes en complétant la formule"
              consignes.y = 0
              wl_current_max = 20
              exo7.sens_count = 1
              exocomplete.play()
              exo7.init_work()
              break;
          case 11:
              consignes_txt.text = "Apprends tes tables de multiplications"
              consignes.y = 0
              wl_current_max = 20
              exo8.wl_sens = 0
              exo8.wl_calc_val_1 = 1
              exo8.wl_calc_val_2 = 1
              exotmul.play()
              exo8.init_work()
              break;
          case 12:
              consignes_txt.text = "Apprends tes tables d'additions"
              consignes.y = 0
              wl_current_max = 20
              exo8.wl_sens = 1
              exo8.wl_calc_val_1 = 1
              exo8.wl_calc_val_2 = 1
              exotadd.play()
              exo8.init_work()
              break;
          case 13:
              consignes_txt.text = "Achètes ton jouet avec les pièces dont tu disposes"
              consignes.y = 0
              exopieces.play()
              exo9.wg_sens = 0
              exo9.init_work()
              break;
          case 14:
              consignes_txt.text = "Coches la case qui corresponds a la consigne"
              consignes.y = 0
              exogrid.play()
              exo10.init_work()
              break;
          case 15:
              consignes_txt.text = "Composez les nombres avec les éléments carré (10) et rond (1) et le super rond rose qui compte 5"
              consignes.y = 0
              exoadix.play()
              wl_current_max = 20
              exo5.wl_diff = 1
              exo5.init_work()
              break;
          case 16:
              consignes_txt.text = "Lis l'heure sur la pendule et donne le bon résultat"
              consignes.y = 0
              exoheures.play()
              exo11.init_work()
              break;
          case 17:
              consignes_txt.text = "Achètes ton jouet avec les billets dont tu disposes"
              consignes.y = 0
              exopieces.play()
              exo9.wg_sens = 1
              exo9.init_work()
              break;
        }
    }

    function fn_close_activity(wl_id_activity)
    {
        start_screen.x = 0
        choice_menu.x = 0
        choice_menu.visible = true
        support_game.visible = false
        support_jeu.visible = false
        switch(wl_id_activity){
          case 1:
              exo1.visible = false
              break;
          case 2:
              exo2.visible = false
              break;
          case 3:
              exo3.visible = false
              break;
          case 4:
              exo4.visible = false
              break;
          case 5:
              exo5.visible = false
              break;
          case 6:
              exo6.visible = false
              break;
          case 9:
              exo7.visible = false
              break;
          case 10:
              exo8.visible = false
              break;
          case 11:
              exo9.visible = false
              break;
          case 12:
              exo10.visible = false
              break;
          case 13:
              exo11.visible = false
              break;
        }
    }

    function fn_show_victory()
    {
        victory_screen.x = 0
        victory_screen.congra_current_acitivity = wl_current_activity
        victory_screen.start_boom()
        victory_screen.visible = true
        youwin.play()
        start_screen.x = 0
        choice_menu.x = 0
    }
}
