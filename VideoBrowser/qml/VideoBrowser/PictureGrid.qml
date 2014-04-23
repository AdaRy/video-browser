import QtQuick 2.0

 Rectangle {
     width: parent.width; height: parent.height
     color: "white"
     id:picGrid
     signal buttonGo(string video)

     ListModel {
         id: appModel
         //EZEKET A LISTA ELEMEKET KELL VÁLTOZTATNI, HOGY MÁS LEGYEN A LISTA #&@
         ListElement { name: "Bear"; video: "Video/Bear.wmv"; icon:"none"}
         ListElement { name: "RocketPower";  video:"Video/2.avi"; icon:"none"}
         ListElement { name: "Camera"; video: "Video/Bear.wmv";  icon:"none"}
         ListElement { name: "Calendar"; video: "Video/Bear.wmv";  icon:"none"}
         ListElement { name: "Messaging"; video: "Video/Bear.wmv";  icon:"none"}
         ListElement { name: "Todo List"; video: "Video/Bear.wmv";  icon:"none"}
         ListElement { name: "Contacts"; video: "Video/Bear.wmv";  icon:"none"}
     }

     Component {
         id: appDelegate

         Item {
             width: 100; height: 100

             Image {
                 id: myIcon
                 y: 20; anchors.horizontalCenter: parent.horizontalCenter
                 source: icon
             }
             Text {
                 anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                 text: name
             }
             MouseArea{
                 id:buttonMouseArea
                 anchors.fill: parent
                 onClicked: picGrid.buttonGo(video)

                 /*onPressed: parent.opacity = 0.5
                 onReleased: parent.opacity = 1*/
             }
         }
     }
     GridView {
         anchors.fill: parent
         cellWidth: 100; cellHeight: 100

         focus: true
         model: appModel
         delegate: appDelegate
         id:grid
     }

     ScrollBar{
              flickable: grid
          }
 }
