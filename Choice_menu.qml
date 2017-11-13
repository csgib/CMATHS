import QtQuick 2.0
import "WIDGETS/"
import QtGraphicalEffects 1.0

Item {
    property real activity_number: 9

    Rectangle{
        anchors.fill: parent
        z: 0

        FastBlur {
            anchors.fill: parent
            source: start_screen
            radius: 32
        }

        Rectangle{
            anchors.fill: parent
            color: "#AA740846"
        }

        Text{
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            height: (parent.height*0.2)-10
            minimumPixelSize: 6
            font.pixelSize: 128
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Sélectionne une activité\nFais glisser pour voir d'autres activités"
            font.family: local_school.name
            color: "#FFFFFF"
            style: Text.Outline
            styleColor: "#000000"
        }

        Flickable {
            anchors.fill: parent
            flickableDirection: Flickable.HorizontalFlick
            contentWidth: (350 * activity_number) + (20 * activity_number)
            contentHeight: parent.height

            Grid {
                x: 0
                y: parent.height*0.2
                width: parent.width
                height: parent.height
                columns: activity_number
                spacing: 20

                WID_Activity{
                    wg_txt_activity: "Plus petit / Plus grand"
                    wg_id_activity: 1
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "< ? >"
                }

                WID_Activity{
                    wg_txt_activity: "Ordre croissant"
                    wg_id_activity: 2
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "1 2 3 ..."
                }

                WID_Activity{
                    wg_txt_activity: "Ordre décroissant"
                    wg_id_activity: 4
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "3 2 1 ..."
                }

                WID_Activity{
                    wg_txt_activity: "Compter les objets"
                    wg_id_activity: 3
                    wg_niv_1: 1
                    wg_niv_2: 0.3
                    wg_niv_3: 0.3
                    wg_text_expl: "?"
                }

                WID_Activity{
                    wg_txt_activity: "Faire des additions"
                    wg_id_activity: 5
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "5 + 8 = ?"
                }

                WID_Activity{
                    wg_txt_activity: "Additions à trou"
                    wg_id_activity: 9
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 1
                    wg_text_expl: "5 + ? = 13"
                }

                WID_Activity{
                    wg_txt_activity: "Faire des soustractions"
                    wg_id_activity: 6
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "4 - 2 = ?"
                }

                WID_Activity{
                    wg_txt_activity: "Soustractions à trou"
                    wg_id_activity: 10
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 1
                    wg_text_expl: "4 - ? = 2"
                }

                WID_Activity{
                    wg_txt_activity: "Les compléments à 10"
                    wg_id_activity: 7
                    wg_niv_1: 1
                    wg_niv_2: 0.3
                    wg_niv_3: 0.3
                    wg_text_expl: "10 + 1"
                }

                WID_Activity{
                    wg_txt_activity: "Les compléments à 10 niveau 2"
                    wg_id_activity: 15
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "10 + 5 + 1"
                }

                WID_Activity{
                    wg_txt_activity: "Algorithmes"
                    wg_id_activity: 8
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "rouge, vert, rouge, ..."
                }

                WID_Activity{
                    wg_txt_activity: "Tables de multiplications"
                    wg_id_activity: 11
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 1
                    wg_text_expl: "4 * 2 = 8"
                }

                WID_Activity{
                    wg_txt_activity: "Tables d'additions"
                    wg_id_activity: 12
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "1 + 1 = 2"
                }

                WID_Activity{
                    wg_txt_activity: "La monnaie - billets"
                    wg_id_activity: 17
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 1
                    wg_text_expl: "50 Euro"
                }

                WID_Activity{
                    wg_txt_activity: "La monnaie - pièces"
                    wg_id_activity: 13
                    wg_niv_1: 0.3
                    wg_niv_2: 1
                    wg_niv_3: 1
                    wg_text_expl: "1.20 Euro"
                }

                WID_Activity{
                    wg_txt_activity: "Repérage"
                    wg_id_activity: 14
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "A4 B6 C1"
                }

                WID_Activity{
                    wg_txt_activity: "L'heure"
                    wg_id_activity: 16
                    wg_niv_1: 1
                    wg_niv_2: 1
                    wg_niv_3: 0.3
                    wg_text_expl: "16h30"
                }
            }
        }
    }

    function show_blur()
    {
        animateRadius.start()
    }
}
