import QtQuick 2.0
import "javascript.js" as JavaScript

Rectangle {
    width: 500
    height: 250
    radius: 2
    color: "#c1dcff"
    border.width: 2
    border.color: "black"
    // Keep track if the user clicked capitalize
    property bool capital: false

    Column {
        id: alphaNumKeys
        spacing: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        width: parent.width

        Row {
            id: row0
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Key {
                label: "1"
            }
            Key {
                label: "2"
            }
            Key {
                label: "3"
            }
            Key {
                label: "4"
            }
            Key {
                label: "5"
            }
            Key {
                label: "6"
            }
            Key {
                label: "7"
            }
            Key {
                label: "8"
            }
            Key {
                label: "9"
            }
            Key {
                label: "0"
            }
            // Backspace Button
            Rectangle {
                id:back
                width: 80
                height: 30
                color: "blue"
                border.color: "black"
                border.width: 2
                anchors.bottom: alphaNumKeys.top
                anchors.bottomMargin: 20
                x: 875
                Text {
                    anchors.centerIn: parent
                    font.bold: true
                    font.pointSize: 10
                    color: "white"
                    text: "Backspace"
                }
                // Simulate a "backspace"
                MouseArea {
                    anchors.fill: parent
                    onPressed: { password1.text = password1.text.substring(0, password1.text.length - 1);
                        backspaceHoldTimer.running = true; }
                    onReleased: backspaceHoldTimer.running = false;
                    Timer {
                        id: backspaceHoldTimer
                        interval: 150; running: false; repeat: true
                        onTriggered: password1.text = password1.text.substring(0, password1.text.length - 1)
                    }
                }
            }

        }

        Row {
            id: row1
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Key {
                label: "q"
            }
            Key {
                label: "w"
            }
            Key {
                label: "e"
            }
            Key {
                label: "r"
            }
            Key {
                label: "t"
            }
            Key {
                label: "y"
            }
            Key {
                label: "u"
            }
            Key {
                label: "i"
            }
            Key {
                label: "o"
            }
            Key {
                label: "p"
            }
        }
        Row {
            id: row2
            x:10
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5
            // capslk Key
            Rectangle {
                width: 80
                height: 30
                color: "blue"
                border.color: "black"
                border.width: 1
                anchors.bottom: alphaNumKeys.bottom

                Text {
                    id: shiftLabel
                    anchors.centerIn: parent
                    font.bold: true
                    font.pointSize: 10
                    color: "white"
                    text: "CapsLk "
                }
                // Simulate a "backspace"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(shiftLabel.font.bold === false) {
                            shiftLabel.font.bold = true
                            shiftLabel.font.pointSize = 10;
                        }
                        else {
                            shiftLabel.font.bold = false;
                            shiftLabel.font.pointSize = 10;
                        }
                    }
                }
            }

            Key {
                label: "a"
            }
            Key {
                label: "s"
            }
            Key {
                label: "d"
            }
            Key {
                label: "f"
            }
            Key {
                label: "g"
            }
            Key {
                label: "h"
            }
            Key {
                label: "j"
            }
            Key {
                label: "k"
            }
            Key {
                label: "l"
            }
            // Enter key
            Rectangle {
                width: 80
                height: 30
                color: "blue"
                border.color: "black"
                border.width: 1
                anchors.bottom: alphaNumKeys.bottom
                Text {
                    anchors.centerIn: parent
                    //    font.family: fontFam: fontFam
                    font.bold: true
                    font.pointSize: 10
                    color: "white"
                    text: "Enter"
                }
                // Simulate enter key
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        password1.focus = false;
                     //   keyboard.visible = false;
                        JavaScript.search(password1.text);
                    }
                }
            }
        }
        Row {
            id: row3
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Key {
                label: "z"
            }
            Key {
                label: "x"
            }
            Key {
                label: "c"
            }
            Key {
                label: "v"
            }
            Key {
                label: "b"
            }
            Key {
                label: "n"
            }
            Key {
                label: "m"
            }
            Key {
                label: "."
            }
            Key {
                label: ","
            }
            Key {
                label: "_"
            }


        }
    }
}
