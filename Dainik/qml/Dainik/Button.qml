
import QtQuick 2.0

Item {
    id: container

    signal clicked
    property string text
    width: buttonText.width + 28
    height: buttonText.height + 14

    BorderImage {
        id: buttonImage
        source: "images/toolbutton.sci"
        width: container.width - 10
        height: container.height
    }
    BorderImage {
        id: pressed
        opacity: 0
        source: "images/toolbutton.sci"
        width: container.width - 10
        height: container.height
    }
    MouseArea {
        id: mouseRegion
        anchors.fill: buttonImage
        onClicked: { container.clicked(); }
    }
    Text {
        id: buttonText
        color: "white"
        anchors.centerIn: buttonImage
        font.bold: true
        font.family:"Segoe UI Symbol"
        font.pointSize: 25
        text: container.text
        style: Text.Raised
        styleColor: "black"
    }
    states: [
        State {
            name: "Pressed"
            when: mouseRegion.pressed == true
            PropertyChanges { target: buttonText; color: "gray" }
        }
    ]
}
