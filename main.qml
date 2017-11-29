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
    //visibility: Window.FullScreen
    title: "CMATHS"

    onClosing: {
        close.accepted = true
    }

    // *** BLOCK FOR LEVELS ***
    property int wl_current_level: 1
    property int wl_current_point: 0
    property int wl_current_max: 10
    property int wl_current_point_cumul: 0
    property int wl_current_activity: 0

    // *** APPLICATION FONTS ***
    FontLoader { id: local_school; source: "Fonts/GrandHotel-Regular.ttf" }

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

    SoundEffect {
        id: oui2bruitage
        source: "Sounds/oui2.wav"
        volume: 1.0
    }

    SoundEffect {
        id: oui3bruitage
        source: "Sounds/oui3.wav"
        volume: 1.0
    }

    SoundEffect {
        id: oui4bruitage
        source: "Sounds/oui4.wav"
        volume: 1.0
    }

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

    SoundEffect {
        id: exosymetrie
        source: "Sounds/exo_symetrie.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exosuivant
        source: "Sounds/exo_suivant.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exobalance
        source: "Sounds/exo_balance.wav"
        volume: 1.0
    }

    SoundEffect {
        id: exogridcount
        source: "Sounds/exo_grid_count.wav"
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
                x: 20
                y: 10
                font.family: local_school.name
                minimumPixelSize: 8
                font.pixelSize: 128
                fontSizeMode: Text.Fit
                width: parent.width - 40
                height: parent.height - 150
                id: consignes_txt
                wrapMode: Text.WordWrap
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
            }

            WID_Button {
                width: parent.width-40
                x: 20
                y: parent.height-130
                z: 2
                button_title: "Démarrer"
                onClicked: {
                    gc()

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
                      case 18:
                          exo11.visible = true
                          break;
                      case 19:
                          exo12.visible = true
                          break;
                      case 20:
                          exo13.wl_interval = 0
                          exo13.init_work()
                          exo13.visible = true
                          break;
                      case 21:
                          exo14.visible = true
                          break;
                      case 22:
                          exo15.visible = true
                          break;
                      case 23:
                          exo15.visible = true
                          break;
                      case 24:
                          exo16.visible = true
                          break;
                      case 25:
                          exo17.visible = true
                          break;
                    }

                    support_jeu.visible = true
                    consignes.y = Screen.height*-1
                }
            }

            WID_Button{
                width: parent.width-40
                x: 20
                y: parent.height-60
                button_title: "Relire la consigne"
                onClicked: {
                    fn_start_activty(wl_current_activity)
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

                WKS_Symetrie{
                    id: exo12
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Suivant{
                    id: exo13
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Balance{
                    id: exo14
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Grid_Calc{
                    id: exo15
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Tetri_Chiffres{
                    id: exo16
                    x: 0
                    y: 10
                    width: parent.width
                    height: parent.height - 20
                    anchors.fill: parent
                    visible: false
                    z: 2
                }

                WKS_Memory{
                    id: exo17
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
        wl_current_max = 10
        wl_current_point_cumul = 0
        wl_current_activity = wl_id_activity
        victory_screen.congra_current_acitivity = wl_id_activity

        support_game.visible = true
        progress_bar_value.width = 0

        timer_hide_choice.start()

        switch(wl_id_activity){
          case 1:
              consignes_txt.text = "Comparez les chiffres et utilisez le signe qui convient\n> pour plus grand que\n< pour plus petit que\nou = si les nombres sont les mêmes."
              consignes.y = 0
              exo1bruitage.play()
              exo1.init_work()
              break;
          case 2:
              consignes_txt.text = "Remettez les chiffres et nombre dans l'ordre croissant 'du plus petit au plus grand'."
              consignes.y = 0
              exo2bruitage.play()
              exo2.sens_count = 0
              exo2.init_work()
              break;
          case 3:
              consignes_txt.text = "Comptez l'ensemble des objets comme vous l'indique la consigne."
              consignes.y = 0
              exocompte.play()
              exo3.init_work()
              break;
          case 4:
              consignes_txt.text = "Remettez les chiffres et nombre dans l'ordre décroissant 'du plus grand au plus petit'."
              consignes.y = 0
              exo2bruitage2.play()
              exo2.sens_count = 1
              exo2.init_work()
              break;
          case 5:
              consignes_txt.text = "Trouvez le résultat des additions."
              consignes.y = 0
              wl_current_max = 5
              exoadd.play()
              exo4.sens_count = 0
              exo4.init_work()
              break;
          case 6:
              consignes_txt.text = "Trouvez le résultat des soustractions."
              consignes.y = 0
              wl_current_max = 5
              exosous.play()
              exo4.sens_count = 1
              exo4.init_work()
              break;
          case 7:
              consignes_txt.text = "Composez les nombres avec les éléments carré (10) et rond (1)."
              consignes.y = 0
              wl_current_max = 20
              exo5.wl_diff = 0
              exoadix.play()
              exo5.init_work()
              break;
          case 8:
              consignes_txt.text = "Résolvez les algorithmes suivants en complétant la grille avec le motif proposé."
              consignes.y = 0
              wl_current_max = 20
              exoalgo.play()
              exo6.init_work()
              break;
          case 9:
              consignes_txt.text = "Complètez les opérations suivantes."
              consignes.y = 0
              wl_current_max = 20
              exo7.sens_count = 0
              exocomplete.play()
              exo7.init_work()
              break;
          case 10:
              consignes_txt.text = "Complètez les opérations suivantes."
              consignes.y = 0
              wl_current_max = 20
              exo7.sens_count = 1
              exocomplete.play()
              exo7.init_work()
              break;
          case 11:
              consignes_txt.text = "Apprends tes tables de multiplications."
              consignes.y = 0
              wl_current_max = 20
              exo8.wl_sens = 0
              exo8.wl_calc_val_1 = 0
              exo8.wl_calc_val_2 = 1
              exotmul.play()
              exo8.init_work()
              break;
          case 12:
              consignes_txt.text = "Apprends tes tables d'additions."
              consignes.y = 0
              wl_current_max = 20
              exo8.wl_sens = 1
              exo8.wl_calc_val_1 = 0
              exo8.wl_calc_val_2 = 1
              exotadd.play()
              exo8.init_work()
              break;
          case 13:
              consignes_txt.text = "Achète ton jouet avec les pièces dont tu disposes."
              consignes.y = 0
              exopieces.play()
              exo9.wg_sens = 0
              exo9.init_work()
              break;
          case 14:
              consignes_txt.text = "Coche la case qui correspond à la consigne."
              consignes.y = 0
              exogrid.play()
              exo10.init_work()
              break;
          case 15:
              consignes_txt.text = "Composez les nombres avec les éléments carré (10) et rond (1) et le super rond rose qui compte 5."
              consignes.y = 0
              exoadix.play()
              wl_current_max = 20
              exo5.wl_diff = 1
              exo5.init_work()
              break;
          case 16:
              consignes_txt.text = "Lis l'heure sur la pendule et donne le bon résultat."
              consignes.y = 0
              exoheures.play()
              exo11.wl_sens = 0
              exo11.init_work()
              break;
          case 17:
              consignes_txt.text = "Achète ton jouet avec les billets dont tu disposes."
              consignes.y = 0
              exopieces.play()
              exo9.wg_sens = 1
              exo9.init_work()
              break;
          case 18:
              consignes_txt.text = "Lis l'heure sur la pendule et donne le bon résultat."
              consignes.y = 0
              exoheures.play()
              exo11.wl_sens = 1
              exo11.init_work()
              break;
          case 19:
              consignes_txt.text = "Reproduis le modèle de gauche à droite."
              consignes.y = 0
              exosymetrie.play()
              exo12.init_work()
              break;
          case 20:
              consignes_txt.text = "Trouvez le chiffre qui manque pour aider l'enfant a traverser la rivière."
              consignes.y = 0
              exosuivant.play()
              exo13.init_work()
              break;
          case 21:
              consignes_txt.text = "Trouve l'objet qui est le plus lourd."
              consignes.y = 0
              exobalance.play()
              exo14.init_work()
              break;
          case 22:
              consignes_txt.text = "Clique sur les cases dont le résultat corresponds à la consigne."
              consignes.y = 0
              exogridcount.play()
              exo15.wl_sens = 0
              exo15.init_work()
              break;
          case 23:
              consignes_txt.text = "Clique sur les cases dont le résultat corresponds à la consigne."
              consignes.y = 0
              exogridcount.play()
              exo15.wl_sens = 1
              exo15.init_work()
              break;
          case 24:
              consignes_txt.text = "Cliques sur les chiffres pour les aditionner et faire le bon résultat."
              consignes.y = 0
              //exogridcount.play()
              exo16.init_work()
              break;
          case 25:
              consignes_txt.text = "Retrouve les paires."
              consignes.y = 0
              //exogridcount.play()
              exo17.init_work()
              break;
        }
    }

    function fn_close_activity()
    {
        start_screen.x = 0
        choice_menu.x = 0
        choice_menu.visible = true
        support_game.visible = false
        support_jeu.visible = false
        switch(wl_current_activity){
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
                exo2.visible = false
                break;
            case 5:
                exo4.visible = false
                break;
            case 6:
                exo4.visible = false
                break;
            case 7:
                exo5.visible = false
                break;
            case 8:
                exo6.visible = false
                break;
            case 9:
                exo7.visible = false
                break;
            case 10:
                exo7.visible = false
                break;
            case 11:
                exo8.visible = false
                break;
            case 12:
                exo8.visible = false
                break;
            case 13:
                exo9.visible = false
                break;
            case 14:
                exo10.visible = false
                break;
            case 15:
                exo5.visible = false
                break;
            case 16:
                exo11.visible = false
                break;
            case 17:
                exo9.visible = false
                break;
            case 18:
                exo11.visible = false
                break;
            case 19:
                exo12.visible = false
                break;
            case 20:
                exo13.visible = false
                break;
            case 21:
                exo14.visible = false
                break;
            case 22:
                exo15.visible = false
                break;
            case 23:
                exo15.visible = false
                break;
            case 24:
                exo16.visible = false
                break;
            case 25:
                exo17.visible = false
                break;
        }
    }

    function fn_show_victory()
    {
        timer_victory.start()
    }

    function fn_return_home()
    {
        choice_menu.visible = false
    }

    Timer {
        id: timer_victory
        interval: 2800
        running: false
        repeat: false
        onTriggered: {
            victory_screen.x = 0
            victory_screen.congra_current_acitivity = wl_current_activity
            victory_screen.start_boom()
            victory_screen.visible = true
            youwin.play()
            start_screen.x = 0
            choice_menu.x = 0
        }
    }

    Timer {
        id: timer_hide_choice
        interval: 500
        running: false
        repeat: false
        onTriggered: {
            choice_menu.x = 10000
        }
    }
}
