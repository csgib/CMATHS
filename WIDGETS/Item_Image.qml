import QtQuick 2.12

Item {
    property int wg_max_item: 0
    property int wl_id_candy: 0

    height: ((flow_exo_3.width-(10*(Math.ceil(Math.sqrt(wg_max_item))))) / Math.ceil(Math.sqrt(wg_max_item)))
    width: height
    Image{
        anchors.fill: parent
        source: "../Images/candy" + wl_id_candy + ".png"
        fillMode: Image.PreserveAspectFit
    }
}
