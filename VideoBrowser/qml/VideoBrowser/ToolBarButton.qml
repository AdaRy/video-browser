import QtQuick 2.0

Item{
    id:toolbarButtonItem
    property alias buttonColor:button.color
    property string buttonText: buttonText.text

    signal buttonClicked()

    Rectangle{
        id:button
        anchors.fill: toolbarButtonItem
        color: "#a0404040"
        radius: 6
        border.width: 2
        border.color: "#80000000"

        Text{
            id:buttonText
            color: "#ffffff"
            font.pointSize: 6
            font.bold: true
            text: toolbarButtonItem.buttonText
            anchors.centerIn: button
        }

        MouseArea{
            id:buttonMouseArea
            anchors.fill: button
            onClicked: toolbarButtonItem.buttonClicked()

            onPressed: button.opacity = 0.5
            onReleased: button.opacity = 1
        }
    }
}
