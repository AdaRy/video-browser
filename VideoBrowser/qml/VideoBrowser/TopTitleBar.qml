import QtQuick 2.0

Item {
    id: toptitleBarItem

    property string titleText: "Sample Video Nagyon Nagyon Nagyon Nagyon Nagyon Nagyom Nagyon Nagyon Nagyon"

    Rectangle{
        id:titleRect
        radius:10
        color: "#a0404040"
        height: parent.height
        width: parent.width+20
        border.width: 2
        border.color: "#80000000"
        Text {
            id: titleText
            text: toptitleBarItem.titleText
            y:parent.parent.height*7/12
            x:10
            width: parent.width
            font.pointSize: 8
            font.bold: true
            color: "#ffffffff"
            clip:true
        }
    }
}
