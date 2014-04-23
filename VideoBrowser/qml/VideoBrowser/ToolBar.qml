import QtQuick 2.0

Item{
    id:toolBarItem

    signal playButtonClicked()
    signal pauseButtonClicked()

    property int videoTime: 0
    property int videoLength: 0

    property string playpause: "Play";



    Rectangle{
        id: buttonContainer
        anchors.fill: parent
        color: "#00ffffff"
        ToolBarButton{
                    id:playButton
                    x:buttonContainer.x+10; y:buttonContainer.y+10
                    width: (buttonContainer.width-40)/4; height: buttonContainer.height-20
                    buttonText: toolBarItem.playpause
                    onButtonClicked: toolBarItem.playButtonClicked()
                }

        ToolBarButton{
                     id:pauseButton
                     x:playButton.x+playButton.width+10; y:playButton.y
                     width: playButton.width; height: playButton.height
                     buttonText: "Store"
                     onButtonClicked: toolBarItem.pauseButtonClicked()
                 }
        Rectangle{
            id: timeTextRect
            color: "#a0404040"
            radius: 6
            border.width: 2
            border.color: "#80000000"
            height: playButton.height
            width: playButton.width*2;
            x:playButton.x+2*playButton.width+20;
            y:playButton.y

            Text{
                id:timeText
                property int timeSec: (Math.floor(videoTime/1000)-Math.floor(videoTime/1000/60)*60)
                property int timeMin: (Math.floor(videoTime/1000/60) - Math.floor(videoTime/1000/60/60)*60)
                property int lengthSec: (Math.floor(videoLength/1000)-Math.floor(videoLength/1000/60)*60)
                property int lengthMin: (Math.floor(videoLength/1000/60) - Math.floor(videoLength/1000/60/60)*60)
                text: "" + Math.floor(videoTime/1000/60/60)+ ":"+ ((timeMin < 10) ? "0"+timeMin : ""+timeMin) +":"+ ((timeSec < 10) ? "0"+timeSec : ""+timeSec) +"/"+Math.floor(videoLength/1000/60/60)+ ":"+ ((lengthMin < 10) ? "0"+lengthMin : ""+lengthMin) +":"+ ((lengthSec < 10) ? "0"+lengthSec : ""+lengthSec)
                color: "#ffffff"
                font.pointSize: 6
                font.bold: true
                anchors.centerIn: timeTextRect
            }
        }



    }

}
