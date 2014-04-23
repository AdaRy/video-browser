import QtQuick 2.0

Rectangle {
    width:parent.width
    height: 100
    x:0

    //ENNEK A HÁROMNAK (TEXT, FILE, ICON) KELL ÉRTÉKET ADDNI #&@
    property variant framesColor: ["#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54","#5454ff","#ff5454","#54ff54"]
    property variant framesText: [1134532153214,2,3,4,5,6,"7ewqrwqrtweq saDSADsADSAd",8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
    property variant framesFile: ["Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv","Video/2.avi","Video/Bear.wmv"]
    property variant frameIcon: ["none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none","none"]
    property int lengthOf: 40;
    property int slicelength:10
    property int perview:4

    property double position: 0
    property url nextVideo: ""

    signal nextVideoS()

    Rectangle {
        PictureFrame{
            x:0 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview]
            subtext:  framesText[Math.floor(position/slicelength)*perview]
            icon: framesText[Math.floor(position/slicelength)*perview];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*1 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+1]
            subtext:  framesText[Math.floor(position/slicelength)*perview+1]
            icon: framesText[Math.floor(position/slicelength)*perview+1];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+1]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*2 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+2]
            subtext:  framesText[Math.floor(position/slicelength)*perview+2]
            icon: framesText[Math.floor(position/slicelength)*perview]+2;
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+2]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*3 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+3]
            subtext:  framesText[Math.floor(position/slicelength)*perview+3]
            icon: framesText[Math.floor(position/slicelength)*perview+3];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+3]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*4 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+4]
            subtext:  framesText[Math.floor(position/slicelength)*perview+4]
            icon: framesText[Math.floor(position/slicelength)*perview+4];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+4]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*5 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+5]
            subtext:  framesText[Math.floor(position/slicelength)*perview+5]
            icon: framesText[Math.floor(position/slicelength)*perview+5];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+5]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*6 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+6]
            subtext:  framesText[Math.floor(position/slicelength)*perview+6]
            icon: framesText[Math.floor(position/slicelength)*perview+6];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+6]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*7 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+7]
            subtext:  framesText[Math.floor(position/slicelength)*perview+7]
            icon: framesText[Math.floor(position/slicelength)*perview+7];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+7]
                nextVideoS()
            }

        }
        PictureFrame{
            x:height*8 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+8]
            subtext:  framesText[Math.floor(position/slicelength)*perview+8]
            icon: framesText[Math.floor(position/slicelength)*perview+8];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+8]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*9 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+9]
            subtext:  framesText[Math.floor(position/slicelength)*perview+9]
            icon: framesText[Math.floor(position/slicelength)*perview+9];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+9]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*10 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+10]
            subtext:  framesText[Math.floor(position/slicelength)*perview+10]
            icon: framesText[Math.floor(position/slicelength)*perview+10];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+10]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*11 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+11]
            subtext:  framesText[Math.floor(position/slicelength)*perview+11]
            icon: framesText[Math.floor(position/slicelength)*perview+11];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+11]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*12 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+12]
            subtext:  framesText[Math.floor(position/slicelength)*perview+12]
            icon: framesText[Math.floor(position/slicelength)*perview+12];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+12]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*13 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+13]
            subtext:  framesText[Math.floor(position/slicelength)*perview+13]
            icon: framesText[Math.floor(position/slicelength)*perview+13];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+13]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*14 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+14]
            subtext:  framesText[Math.floor(position/slicelength)*perview+14]
            icon: framesText[Math.floor(position/slicelength)*perview+14];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+14]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*15 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+15]
            subtext:  framesText[Math.floor(position/slicelength)*perview+15]
            icon: framesText[Math.floor(position/slicelength)*perview+15];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+15]
                nextVideoS()
            }

        }
        PictureFrame{
            x:height*16 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+16]
            subtext:  framesText[Math.floor(position/slicelength)*perview+16]
            icon: framesText[Math.floor(position/slicelength)*perview+16];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+16]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*17 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+17]
            subtext:  framesText[Math.floor(position/slicelength)*perview+17]
            icon: framesText[Math.floor(position/slicelength)*perview+17];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+17]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*18 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+18]
            subtext:  framesText[Math.floor(position/slicelength)*perview+18]
            icon: framesText[Math.floor(position/slicelength)*perview+18];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+18]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*19 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+19]
            subtext:  framesText[Math.floor(position/slicelength)*perview+19]
            icon: framesText[Math.floor(position/slicelength)*perview+19];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+19]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*20 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+20]
            subtext:  framesText[Math.floor(position/slicelength)*perview+20]
            icon: framesText[Math.floor(position/slicelength)*perview+20];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+20]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*21 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+21]
            subtext:  framesText[Math.floor(position/slicelength)*perview+21]
            icon: framesText[Math.floor(position/slicelength)*perview+21];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+21]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*22 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+22]
            subtext:  framesText[Math.floor(position/slicelength)*perview+22]
            icon: framesText[Math.floor(position/slicelength)*perview+22];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+22]
                nextVideoS()
            }
        }
        PictureFrame{
            x:height*23 - (position - Math.floor(position/slicelength)*slicelength)/slicelength*100*4
            subcolor: framesColor[Math.floor(position/slicelength)*perview+23]
            subtext:  framesText[Math.floor(position/slicelength)*perview+23]
            icon: framesText[Math.floor(position/slicelength)*perview+23];
            onButtonClicked:
            {
                parent.parent.nextVideo = framesFile[Math.floor(position/slicelength)*perview+23]
                nextVideoS()
            }

        }

    }

}
