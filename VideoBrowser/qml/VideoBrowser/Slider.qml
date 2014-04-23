import QtQuick 2.0

Rectangle {
    anchors {leftMargin: 20; rightMargin: 20}
    height: 16
    width:parent.width

    radius: 8
    opacity: 0.7
    smooth: true



    property double ration: ((slider.x-2) / (width - slider.width - 4))
    property double dragRation: (mouseSlider.dragX-2)

    property double swidth: slider.width

    function setRatio(ratio){

        slider.x = (mouseSlider.drag.active == true) ? slider.x : 2 + ratio*(width-slider.width - 4)
    }



    gradient: Gradient {
        GradientStop { position: 0.0; color: "gray" }
        GradientStop { position: 1.0; color: "gray" }
    }

    Rectangle {
        id: slider
        x: 2; y: 1;
        width: ((parent.width/30) < 10) ? 10 : ((parent.width/30) > 30) ? 30 : (parent.width/30)
        height: 14
        radius: 6
        smooth: true

        property double pWidth:parent.width


        gradient: Gradient {
            GradientStop { position: 0.0; color: "#424242" }
            GradientStop { position: 1.0; color: "black" }
        }

        /*onXChanged:
        {mouseSlider.dragX = (mouseSlider.drag.active == true) ? x : mouseSlider.dragX }*/



        MouseArea {
            id:mouseSlider

            property double dragX : 0

            anchors.fill: parent
            drag.target: parent; drag.axis: Drag.XAxis
            drag.minimumX: 2; drag.maximumX: parent.pWidth-parent.width - 2

            onReleased: mouseSlider.dragX = parent.x

        }
    }
}
