import QtQuick 2.0

Rectangle {
    anchors.fill: parent

    property string nextView: "";
    property string nextViewMessage: "";

    signal backButtonClicked()
    signal buttonPlay(string video)

    FileChooser
    {
        id:fileChooser
    }

    Item{
        width: parent.width; height: 50
        ToolBarButton
        {
            x:parent.height/10; y: parent.height/10
            width: (parent.width)/4; height: parent.height/10*8
            buttonText: "Back"
            onButtonClicked:
            backButtonClicked()
        }

        ToolBarButton
        {
            x:parent.width - (parent.width)/4 - parent.height/10; y: parent.height/10
            width: (parent.width)/4; height: parent.height/10*8
            buttonText: "Add"
            onButtonClicked:
            fileChooser.open();
        }
    }
    Item
    {
        y:50
        width: parent.width; height: parent.height-50
        PictureGrid
        {

            onButtonGo:
            {

                buttonPlay(video);
            }
        }
    }

    Component.onCompleted:
    {
        nextView = "";
        nextViewMessage = "";
    }
}
