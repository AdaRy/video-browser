import QtQuick 2.0
import QtMultimedia 5.0

Item {
    id: videoPlayerItem
    property bool isVideoPlaying: (mediaplayer.playbackState == MediaPlayer.PlayingState) ? true : false; // property to know if videoPlaying id ongoing or not
    property int time: mediaplayer.position
    property int length: mediaplayer.duration
    property bool ended: (mediaplayer.position == mediaplayer.duration && mediaplayer.duration != 0) ? true : false
    property url scr: "Video/2.avi"


    function setSource(newSource)
    {
        mediaplayer.source = newSource
    }

    /*
      Functions Which starts Video Playing
      */
    function playVideo(){
        mediaplayer.play()
    }
    /*
      Function Which Stops Video Playing
      */
    function stopVideo(){
        mediaplayer.stop()
    }

    function setPosition(seekPosition)
    {
        //console.log(mediaplayer.seekable)
        //mediaplayer.position = 2000
        mediaplayer.seek(seekPosition)
    }

    /*
      Function Which Stops Video Playing
      */
    function pauseVideo(){
        mediaplayer.pause()
        //console.log("Video Stopped"+videoPlayer.duration)
    }
    /*
      Actual QML based Video Component
      */

    MediaPlayer
    {
      id: mediaplayer
      source: videoPlayerItem.scr
    }

    VideoOutput
    {
      anchors.fill: parent
      source: mediaplayer
      focus: true
    }

}
