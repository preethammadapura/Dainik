
import QtQuick 2.0

Rectangle {
    id: key
    width: 30
    height: 30
    color: "#1ba1e2"
    border.color: "white"
    border.width: 2
    property string label;
    signal clicked(string msg)

    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pointSize: 16
        font.family: "Helvetica"
        color: "white"
        text: parent.label
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(shiftLabel.font.bold === false)
                password1.text = password1.text + label.charAt(0)
            else
                password1.text = password1.text + label.charAt(0).toUpperCase()
        }
    }
}
