import QtQuick 2.0
import "../WIDGETS/"

Item {
    WID_Button{
        x: parent.width - 35
        y: 5
        width: 30
        height: 30
        button_title: "X"
        onClicked: {
            fn_close_activity()
        }
    }

    function init_work()
    {

    }
}
