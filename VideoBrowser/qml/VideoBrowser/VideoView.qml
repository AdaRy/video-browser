import QtQuick 2.0

Rectangle {
    id: mainRect
    width: 360
    height: 500
    color: "black"

    anchors.fill: parent

    property string nextView: "";
    property string nextViewMessage: "";

    signal storeButtonClicked()

    Rectangle{
        id:videoRect
        x:mainRect.x; y:mainRect.y
        width: mainRect.width; height: mainRect.height-100
        color: "yellow"

        /*
          Simple Loader is placed inside the Rect which will help to load the videoPlayer Component when
          user clicks the play button
          */
        Loader{
            id:videoLoader
            anchors.fill: videoRect
        }

        MouseArea {
         id: buttonMouseArea
         anchors.fill: parent
         hoverEnabled: true
         onEntered: {topTopTitleBar.visible = true; toolBar.visible = true; slider.visible = true;}
         onExited:  {topTopTitleBar.visible = false; toolBar.visible = false; slider.visible = false;}
        }
    }

    TopTitleBar{
        id:topTopTitleBar
        x:mainRect.x; y:mainRect.y-mainRect.height/20
        width: mainRect.width; height: mainRect.height/10+10
    }





    /*
      Simple Toolbar Item which has play, pause and stop button
      */
    ToolBar{
        id:toolBar
        x: videoRect.x; y:videoRect.y+videoRect.height-50
        width: videoRect.width; height: 50


        playpause: (videoLoader.item == null || videoLoader.item.isVideoPlaying == false) ? "Play" : "Pause";

        onPlayButtonClicked: {

            if (videoLoader.item == null || videoLoader.item.isVideoPlaying == false)
            {
                videoLoader.source = "VideoPlayer.qml"
                videoLoader.item.playVideo()
                console.log(videoLoader.item.playbackState)
                console.log(videoLoader.item.PlayingState)
            }
            else
            {
                videoLoader.item.pauseVideo()
            }



        }
        onPauseButtonClicked: storeButtonClicked()
        videoLength: videoLoader.item.length
        videoTime: videoLoader.item.time

        onVideoTimeChanged: slider.setRatio(videoTime/videoLength)

        property bool videoEnded: videoLoader.item.ended

        onVideoEndedChanged: {
            console.log("Ended: "+videoEnded)
            //(videoEnded == true) ? videoLoader.item.setSource("Video/Bear.wmv") : console.log()
            //timerVideoPlayer.start()
        }
     }

    Slider
    {
        id:slider
        x:mainRect.x
        y:toolBar.y - 16

        onDragRationChanged: {
            console.log("Drag:"+(slider.dragRation/ (slider.width - slider.swidth - 4))  )
            videoLoader.item.setPosition(toolBar.videoLength*(slider.dragRation/ (slider.width - slider.swidth - 4)))
        }

    }

    PictureSlide
    {
        id:pictureslide
        y: videoRect.y+videoRect.height
        height: 100
        position: slider.ration*(toolBar.videoLength/1000-pictureslide.slicelength)

        onNextVideoS:
        {
                //videoLoader.item.pauseVideo()
                console.log("GoTo: ")
                videoLoader.item.setSource(nextVideo);
                timerVideoPlayer.start()
        }
    }

    Item {
         Timer {
             id:timerVideoPlayer
             interval: 500; running: false; repeat: false
             onTriggered: videoLoader.item.playVideo()
         }

         Text { id: time }
     }

    Component.onCompleted:
    {
        nextView = "";
        nextViewMessage = "";
    }

    function changeAndPlay(ID)
    {
        if (videoLoader.item == null)
        {
            videoLoader.source = "VideoPlayer.qml"
        }
        videoLoader.item.setSource(ID)
        timerVideoPlayer.start()

        //ITT ÉRDEMES A pictureslide ÉRTÉKEIT ÁLLÍTANI

    }
}
