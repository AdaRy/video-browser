import QtQuick 2.0

Rectangle {
    id: mainRect
    width: 500
    height: 500
    color: "black"

    property string nextView : (viewLoader.item == null) ? "" : viewLoader.item.nextView;

    VideoView
    {
        id:videoView
        visible: false;

        onStoreButtonClicked:
        {
            storeView.visible = true;
            videoView.visible = false;
        }
    }

    StoreView
    {
        id:storeView
        onBackButtonClicked:
        {
            storeView.visible = false;
            videoView.visible = true;
        }

        onButtonPlay:
        {
            storeView.visible = false;
            videoView.visible = true;
            videoView.changeAndPlay(video)
        }
    }

    Component.onCompleted:
    {
        storeView.visible = false;
        videoView.visible = true;
    }


}
