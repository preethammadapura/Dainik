import QtQuick 2.0
import QtMultimedia 5.0

Item {
    width: 1200;
    height: 660;
    property int flag: 0;
    property bool playing: false;
    property string vidName : "";
    MediaPlayer {
        id: mediaplayer
        source: vidName
    }
    VideoOutput {
        id: vidop
        anchors.fill: parent.fill;
        source: mediaplayer
    }
    Image {
        id: stopIcon
        source: "./gallery/stop-icon.gif"
       // anchors.top: vidop.bottom
        //anchors.topMargin: 10
        x: 600
        y: 600
        MouseArea {
            id: stopPlayer1
            anchors.fill: parent
            onClicked: {
                mediaplayer.stop();
                playIcon.visible = false;
                pauseIcon.visible = false;
                stopIcon.visible = false;
                blankVid.visible = false;
            }
        }
    }
    Image {
        id: playIcon
        source: "./gallery/play-icon.gif"
        x: 400
        y: 600
        MouseArea {
            id: playPlayer1
            anchors.fill: parent
            onClicked: {
                mediaplayer.play();
                playIcon.visible = false;
                pauseIcon.visible = true;
            }
        }
    }

    Image {
        id: pauseIcon
        source: "./gallery/pause-icon.gif"
        x: 400
        y: 600
        visible: false

        MouseArea {
            id: pausePlayer1
            anchors.fill: parent
            onClicked: {
                mediaplayer.pause();
                playIcon.visible = true;
                pauseIcon.visible = false;
            }
        }
    }

  /*  MouseArea {
        id: playArea;
        anchors.fill: parent
        onPressed: {
            console.log("isplaying:", playing)
            if (playing) {
                mediaplayer.pause();
                playing = false;
                console.log("STOPPED");
            }
            else {
                if(flag!=1){
                    mediaplayer.play();
                    playing = true;
                    console.log("PLAYING NOW");
                }
                else if(flag == 1) {console.log("STOPPED");mediaplayer.stop();}
        }
}
}*/
}
