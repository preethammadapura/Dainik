import QtQuick 2.0

Flickable {
    width: 1920
    height: 1080
    contentWidth: 1920
    contentHeight: 1080

    Rectangle{
        id:toppanel
        width: 1920
        height: 72
        color: "#1BA1E2"

      Image {
        id: logo
        source: "pictures/abc.jpg"
        x: 22.5; y: 30
        width: 150
        height: 174
        fillMode: Image.PreserveAspectFit
      }
     }

    Text{
        id:welcome
        x:240; y:150
        text: "Welcome"
        font.family: "Seigo WP"
        font.pointSize: 60
        color: "grey"
    }

    Column{
        id:userlist
        spacing: 30
        x: 150; y: 330;

        Rectangle{
            id:user1
            height:240
            width:720
        }
    }

}
