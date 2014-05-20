import QtQuick 2.0

Rectangle {
    width: parent.width
    height: marqueeText.height + padding
    clip: true

    property string text
    property int padding : 10
    property int fontSize : 20
    property int interval : 110
    property color textColor: "black"

    Text {
    anchors.verticalCenter: parent.verticalCenter
    id: marqueeText
    font.pointSize: fontSize
    color: textColor
    text: parent.text
    x: parent.width
    }

    Timer {
    interval: parent.interval
    onTriggered: moveMarquee()
    running: true
    repeat: true
    }

    function moveMarquee()
    {
    if(marqueeText.x + marqueeText.width < 0)
    {
        marqueeText.x = marqueeText.parent.width;
    }
    marqueeText.x -= 6;
    }

}
