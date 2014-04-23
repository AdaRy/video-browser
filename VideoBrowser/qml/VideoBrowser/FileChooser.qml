import QtQuick 2.0
import QtQuick.Dialogs 1.0




    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        selectExisting: true;
        selectMultiple: false;
        modality: "ApplicationModal"
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            //ITT VAN A HOZZÁADÁS MEGHÍVÁSA #&@
        }
        onRejected: {
            console.log("Canceled")
        }
        //Component.onCompleted: visible = true





}
