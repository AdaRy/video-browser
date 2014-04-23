import QtQuick 2.0

Rectangle {
    width: 100
    height: 100

    signal buttonClicked()

    property color subcolor: "#ffffff"
    property string subtext: "N/A"
    property string icon:"none";
    border.color: "#dddddd"
    border.width:2

    Rectangle {
        id:rect
        height: parent.height*4/5
        width: parent.width
        color: parent.subcolor
        border.color: "#dddddd"
        border.width:2
        Image { source: parent.parent.icon; anchors.horizontalCenter: parent.horizontalCenter }

    }
    Rectangle {
        y:parent.height*4/5
        width: parent.width -2
        height: parent.height/5
        Text {
            x:2
            width: parent.width -2
            height: parent.height
            text: parent.parent.subtext
            verticalAlignment: Text.AlignVCenter
            clip:true
        }
    }

    MouseArea{
        id:buttonMouseArea
        anchors.fill: parent
        onClicked: parent.buttonClicked()

        onPressed: rect.opacity = 0.5
        onReleased: rect.opacity = 1
    }
}
