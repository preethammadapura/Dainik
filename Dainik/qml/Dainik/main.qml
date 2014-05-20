import QtQuick 2.0
import QtWebKit 3.0
import QtMultimedia 5.0
import "Variables.js" as Variables
import "Weather.js" as WeatherFunctions


Flickable {

    width: 1920
    height: 1080
    contentWidth: 1920
    contentHeight: 1080
    visible: true
    property int picNo : 0
    property int degFlip : 0

    //Properties for Weather Predictions

    property int tempMinCToday
    property int tempMinFToday
    property int tempMaxCToday
    property int tempMaxFToday

    property int tempMinCTomo
    property int tempMinFTomo
    property int tempMaxCTomo
    property int tempMaxFTomo

    property int predWindMT
    property int predWindKT
    property string predWindDirT

    property int predWindMTomo
    property int predWindKTomo
    property string predWindDirTomo

    property int precipToday
    property int precipTomo

    property int wCodeToday
    property int wCodeTomo

    Rectangle{
        id: myViewManager
        anchors.fill: parent

        Rectangle{
            id: viewsContainer
            anchors.fill: parent

            Rectangle{
                id:loginscreen
                width:parent.width
                height:parent.height
                visible:true

                Rectangle{
                    id:logintoppanel
                    width: 1920
                    height: 72
                    color: "#1BA1E2"

                    Image {
                        id: loginlogo
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
                    font.family: "Segoe WP"
                    font.pointSize: 60
                    color: "grey"
                }

                Rectangle{
                    id: alertwindow
                    width:500; height:250
                    border.color: "black"
                    border.width: 3
                    x:700; y:300; z:1
                    color:"#1ba1e2"
                    visible: false

                    Text{
                        id:alertmsg
                        x:60; y: 80
                        text:"      Wrong Password.
 Please re enter password!"

                        font.family: "Segoe WP Semibold"
                        font.pointSize: 20
                        wrapMode: Text.WordWrap
                    }

                    Rectangle{
                        id: okbttn
                        width:100; height:40
                        x: 130; y: 200
                        anchors.horizontalCenter: parent.horizontalCenter
                        border.color: "black"
                        border.width: 2
                        color: "#1ba1e2"

                        Text{id:okay; text: "   OK"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                alertwindow.visible = false
                            }
                        }

                    }
                }

                Rectangle{
                    id:userlistbox
                    x: 180; y: 330;
                    height: 550; width: 700

                    Scrollable {
                        id: userFlickArea
                        anchors.fill: parent
                        contentWidth: userlistbox.width
                        contentHeight: userlistbox.height
                        flickableDirection: Flickable.VerticalFlick
                        clip: true

                        Column{
                            id:userlist
                            spacing: 40

                            Rectangle{
                                id:user1
                                height:200; width:700
                                color: "#C1DCFF"

                                Image{
                                    fillMode: Image.PreserveAspectFit
                                    source: "pictures/user.jpg"
                                    width: 160; height: 160
                                    x:20; y:20
                                }

                                Text{
                                    id:user1name
                                    text: "Diana"
                                    font.family: "Segoe WP SemiBold"
                                    font.pointSize: 40
                                    color: "#1ba1e2"
                                    x: 200; y:10
                                }

                                Rectangle{
                                    id:loginpromt1
                                    x: 200; y:80
                                    width: 360; height: 40
                                    visible: false

                                    TextInput{
                                        id:password1
                                        font.pointSize: 20
                                        anchors.fill: parent
                                        echoMode: TextInput.Password
                                        maximumLength: 12
                                        focus: true
                                        cursorVisible: true
                                        cursorPosition: 2
                                    }
                                }

                                Image{
                                    id:enterbutton1
                                    source: "pictures/arrow1.jpg"
                                    fillMode: Image.PreserveAspectFit
                                    width:40; height:40
                                    x:520; y:80; z:2
                                    visible: false

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            console.log(password1.text);
                                            if(password1.text=='PASSWORD1'){
                                                mainscreen.visible = true;
                                            }
                                            else{
                                                alertwindow.visible = true
                                            }
                                        }
                                    }
                                }

                                MouseArea{
                                    id: touchpromt1
                                    anchors.fill: parent
                                    onClicked: {
                                        vkbdlogin.visible = true
                                        user1.color = "#1ba1e2"
                                        user1name.color = "White"
                                        loginpromt1.visible = true
                                        enterbutton1.visible = true
                                        enterbutton2.visible = false
                                        enterbutton3.visible = false
                                        enterbutton4.visible = false
                                        loginpromt4.visible = false
                                        user4.color = "#C1DCFF"
                                        user4name.color = "#1ba1e2"
                                        loginpromt2.visible = false
                                        user2.color = "#C1DCFF"
                                        user2name.color = "#1ba1e2"
                                        loginpromt3.visible = false
                                        user3.color = "#C1DCFF"
                                        user3name.color = "#1ba1e2"

                                    }
                                }
                            }

                            Rectangle{
                                id:user2
                                height:200; width:700
                                color: "#C1DCFF"

                                Image{
                                    fillMode: Image.PreserveAspectFit
                                    source: "pictures/male_user_icon_clip_art_9200.jpg"
                                    width: 160; height: 160
                                    x:20; y:20
                                }

                                Text{
                                    id:user2name
                                    text: "Gayle"
                                    font.family: "Segoe WP SemiBold"
                                    font.pointSize: 40
                                    color: "#1ba1e2"
                                    x: 200; y:10
                                }

                                Rectangle{
                                    id:loginpromt2
                                    x: 200; y:80
                                    width: 360; height: 40
                                    visible: false

                                    TextInput{
                                        id:password2
                                        font.pointSize: 20
                                        anchors.fill: parent
                                        echoMode: TextInput.Password
                                        maximumLength: 12
                                        focus: true
                                        cursorVisible: true
                                        cursorPosition: 2
                                    }
                                }

                                Image{
                                    id:enterbutton2
                                    source: "pictures/arrow1.jpg"
                                    fillMode: Image.PreserveAspectFit
                                    width:40; height:40
                                    x:520; y:80; z:2
                                    visible: false

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            if(password1.text=='password2'){
                                                loginscreen.visible = false
                                            }
                                            else{
                                                alertwindow.visible = true
                                            }
                                        }
                                    }
                                }


                                MouseArea{
                                    id: touchpromt2
                                    anchors.fill: parent
                                    onClicked: {
                                        vkbdlogin.visible = true
                                        user2.color = "#1ba1e2"
                                        user2name.color = "White"
                                        loginpromt2.visible = true
                                        enterbutton2.visible = true
                                        loginpromt2.focus = true
                                        loginpromt1.focus = false
                                        loginpromt3.focus = false
                                        loginpromt4.focus = false
                                        enterbutton1.visible = false
                                        enterbutton3.visible = false
                                        enterbutton4.visible = false
                                        loginpromt3.visible = false
                                        loginpromt4.visible = false
                                        loginpromt1.visible = false
                                        user1.color = "#C1DCFF"
                                        user4.color = "#C1DCFF"
                                        user3.color = "#C1DCFF"
                                        user1name.color = "#1ba1e2"
                                        user4name.color = "#1ba1e2"
                                        user3name.color = "#1ba1e2"
                                    }
                                }

                            }

                            Rectangle{
                                id:user3
                                height:200; width:700
                                color: "#C1DCFF"

                                Image{
                                    fillMode: Image.PreserveAspectFit
                                    source: "pictures/female-user-icon-clip-art.jpg"
                                    width: 160; height: 160
                                    x:20; y:20
                                }

                                Text{
                                    id:user3name
                                    text: "Sarah"
                                    font.family: "Segoe WP SemiBold"
                                    font.pointSize: 40
                                    color: "#1ba1e2"
                                    x: 200; y:10
                                }

                                Rectangle{
                                    id:loginpromt3
                                    x: 200; y:80
                                    width: 360; height: 40
                                    visible: false

                                    TextInput{
                                        id:password3
                                        font.pointSize: 20
                                        anchors.fill: parent
                                        echoMode: TextInput.Password
                                        maximumLength: 12
                                        focus: true
                                        cursorVisible: true
                                        cursorPosition: 2
                                    }
                                }

                                Image{
                                    id:enterbutton3
                                    source: "pictures/arrow1.jpg"
                                    fillMode: Image.PreserveAspectFit
                                    width:40; height:40
                                    x:520; y:80; z:2
                                    visible: false

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            if(password1.text=='password3'){
                                                loginscreen.visible = false
                                            }
                                            else{
                                                alertwindow.visible = true
                                            }
                                        }
                                    }
                                }



                                MouseArea{
                                    id: touchpromt3
                                    anchors.fill: parent
                                    onClicked: {
                                        vkbdlogin.visible = true
                                        user3.color = "#1ba1e2"
                                        user3name.color = "White"
                                        loginpromt3.visible = true
                                        enterbutton3.visible = true
                                        loginpromt3.focus = true
                                        loginpromt2.focus = false
                                        loginpromt1.focus = false
                                        loginpromt4.focus = false
                                        enterbutton1.visible = false
                                        enterbutton2.visible = false
                                        enterbutton4.visible = false
                                        loginpromt1.visible = false
                                        loginpromt2.visible = false
                                        loginpromt4.visible = false
                                        user1.color = "#C1DCFF"
                                        user4.color = "#C1DCFF"
                                        user2.color = "#C1DCFF"
                                        user1name.color = "#1ba1e2"
                                        user4name.color = "#1ba1e2"
                                        user3name.color = "#1ba1e2"
                                    }
                                }

                            }

                            Rectangle{
                                id:user4
                                height:200; width:700
                                color: "#C1DCFF"

                                Image{
                                    fillMode: Image.PreserveAspectFit
                                    source: "pictures/user2.jpg"
                                    width: 160; height: 160
                                    x:20; y:20
                                }

                                Text{
                                    id:user4name
                                    text: "Amber"
                                    font.family: "Segoe WP SemiBold"
                                    font.pointSize: 40
                                    color: "#1ba1e2"
                                    x: 200; y:10
                                }

                                Rectangle{
                                    id:loginpromt4
                                    x: 200; y:80
                                    width: 360; height: 40
                                    visible: false

                                    TextInput{
                                        id:password4
                                        font.pointSize: 20
                                        anchors.fill: parent
                                        echoMode: TextInput.Password
                                        maximumLength: 12
                                        focus: true
                                        cursorVisible: true
                                        cursorPosition: 2
                                    }

                                }

                                Image{
                                    id:enterbutton4
                                    source: "pictures/arrow1.jpg"
                                    fillMode: Image.PreserveAspectFit
                                    width:40; height:40
                                    x:520; y:80; z:2
                                    visible: false

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            if(password1.text=='password4'){
                                                loginscreen.visible = false
                                            }
                                            else{
                                                alertwindow.visible = true
                                            }
                                        }
                                    }
                                }

                                MouseArea{
                                    id: touchpromt4
                                    anchors.fill: parent
                                    onClicked: {
                                        vkbdlogin.visible = true
                                        user4.color = "#1ba1e2"
                                        user4name.color = "White"
                                        loginpromt4.visible = true
                                        loginpromt4.focus = true
                                        loginpromt2.focus = false
                                        loginpromt3.focus = false
                                        loginpromt1.focus = false
                                        enterbutton4.visible = true
                                        enterbutton1.visible = false
                                        enterbutton3.visible = false
                                        enterbutton2.visible = false
                                        loginpromt1.visible = false
                                        loginpromt2.visible = false
                                        loginpromt3.visible = false
                                        user1.color = "#C1DCFF"
                                        user2.color = "#C1DCFF"
                                        user3.color = "#C1DCFF"
                                        user1name.color = "#1ba1e2"
                                        user2name.color = "#1ba1e2"
                                        user3name.color = "#1ba1e2"
                                    }
                                }

                            }
                        }


                        ScrollBar {
                            flickable: userFlickArea
                            vertical: true
                        }


                    }
                }

                Rectangle{
                    id: loginbttmpanel
                    width: 1560
                    height: 60
                    color: "#C1DCFF"
                    y: 1020
                }

                Column{
                    id: dtime
                    x:1100; y:600
                    spacing:0;
                    Row{
                        spacing: 15
                        Text {
                            id:maintimel;
                            text: "0:00";
                            anchors.top: sidepanel.Top
                            font.family: "Segoe WP SemiBold"
                            font.pointSize: 85;

                            Text {
                                id:ampml
                                y:25;
                                anchors.left: maintimel.right
                                text: "ap"
                                font.family: "Segoe UI SemiBold"
                                font.pointSize: 35;
                            }
                        }
                    }
                    Text {
                        id:maindatel;
                        text: "dddd";
                        font.family: "Segoe WP SemiBold"
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 44;
                        color: "#404040"
                    }
                    Timer {
                        id:gettimetimerl;
                        interval: 10;
                        running: true;
                        repeat: true;
                        triggeredOnStart: true
                        onTriggered: Variables.getTime();
                    }
                    Timer {
                        id:getdatetimerl;
                        interval: 10;
                        running: true;
                        repeat: true;
                        triggeredOnStart: true
                        onTriggered: Variables.getDate1();
                    }
                }

                VirtualKeyboard{
                    id:vkbdlogin
                    visible: false
                    x:600
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                }

            }

            Rectangle {
                id:mainscreen
                width: parent.width
                height: parent.height
                visible:false

                Image{
                    id:background
                    source: "pictures/White Backgrounds.jpg"
                    fillMode: Image.PreserveAspectCrop
                }

                Rectangle{
                    id: blacktrans
                    width: 1560
                    height: 1080
                    opacity: 0.6
                    color: "black"
                    visible: false

                    Rectangle {
                        id: clickToCloseSide
                        width: 180
                        height: 200
                        x: 1380
                        y: 200
                        color: "transparent"

                        MouseArea {
                            id: clickToClose
                            anchors.fill: parent
                            onClicked: {
                                maincircle.visible = true;
                                blacktrans.visible = false;
                                featurewindow.visible = false;
                                cookingfeaturewindow.visible = false;
                                listsfeaturewindow.visible = false;
                                weatherfeaturewindow.visible = false;
                                browserfeaturewindow.visible = false;
                                picturegallerywindow.visible = false;
                                trafficfeaturewindow.visible = false;
                                trialSlideShow.visible = false;
                                timer1.running = false;
                                kidssectionwindow.visible = false;
                                homesyncwindow.visible = false
                                musicfeaturewindow.visible = false;
                                organizerfeaturewindow.visible = false;
                                settingsfeaturewindow.visible = false;
                            }
                        }
                    }
                }

                Rectangle{
                    id:toppanel
                    width: 1920
                    height: 72
                    color: "#1BA1E2"

                    Image{
                        id:user
                        width: 72
                        height: 72
                        source: "pictures/user.jpg"
                        x: 1848

                        MouseArea{
                            id:clickToOpenOptions
                            anchors.fill: parent

                            onClicked: {
                                useroptions.visible = true;
                                settingstext.color = "black";
                                locktext.color="black";
                                signouttext.color="black";
                            }

                        }
                    }

                    Rectangle {
                        id: useroptions1
                        x: 1560; y: 6; width: 288; height: 60
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#DBEEF4" }
                            GradientStop { position: 0.5; color: "white" }
                            GradientStop { position: 1.0; color: "#DBEEF4" }
                        }

                    }

                    Image {
                        id: logo
                        source: "pictures/abc.jpg"
                        x: 22.5; y: 30
                        width: 150
                        height: 174
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Rectangle{
                    id:useroptions
                    width:300; height:250
                    x:1460; y:66; z:1
                    color: "#eeeeee"
                    border.width: 1
                    border.color: "black"
                    visible: false

                    Column{
                        x: 10; y: 10
                        spacing: 20
                        Text{
                            id:settingstext;
                            text: "Settings"
                            font.pointSize: 30
                            font.family: "Segoe WP Light"
                            anchors.horizontalCenter: parent
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    settingstext.color="blue";
                                    locktext.color="black";
                                    signouttext.color="black";
                                    //settingstext.font.bold:true;
                                    maincircle.visible = false;
                                    useroptions.visible = false;
                                    settingsfeaturewindow.visible = true;
                                    blacktrans.visible = true;
                                }
                            }


                        }
                        Text{
                            id:locktext;
                            text: "Lock"
                            font.pointSize: 30
                            font.family: "Segoe WP Light"
                            anchors.horizontalCenter: parent

                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    locktext.color="blue";
                                    signouttext.color="black"
                                    settingstext.color="black"
                                    //locktext.font.bold:true;
                                    //maincircle.visible = false;
                                    loginscreen.visible = true;
                                    mainscreen.visible= false;
                                    password1.text = "";
                                    useroptions.visible = false;
                                    //blacktrans.visible = true;
                                }
                            }
                        }

                        Text{
                            id:signouttext;
                            text: "Signout"
                            font.pointSize: 30
                            font.family: "Segoe WP Light"
                            anchors.horizontalCenter: parent

                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    locktext.color="black"
                                    settingstext.color="black"
                                    signouttext.color="blue"
                                    password1.text=""
                                    //signouttext.font.bold:true;
                                    //maincircle.visible = false;
                                    loginscreen.visible = true;
                                    mainscreen.visible=false;
                                    useroptions.visible = false;
                                    //blacktrans.visible = true;
                                }
                            }

                        }
                    }
                }

                Rectangle{
                    id:sidepanel
                    width: 360
                    height: 1008
                    x: 1560
                    y: 72
                    color: "#7CD0EB"

                    Column{
                        id: column1
                        x:10;
                        spacing:0;
                        Row{
                            spacing: 15
                            Text {
                                id:maintime;
                                text: "0:00";
                                anchors.top: sidepanel.top
                                font.family: "Segoe WP SemiBold"
                                font.pointSize: 85;

                                Text {
                                    id:ampm
                                    y:25;
                                    anchors.left: maintime.right
                                    text: "ap"
                                    font.family: "Segoe UI SemiBold"
                                    font.pointSize: 35;
                                }
                            }
                        }
                        Text {
                            id:maindate;
                            text: "dddd";
                            anchors.top: sidepanel.top
                            font.family: "Segoe WP SemiBold"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pointSize: 44;
                            color: "#404040"
                        }
                        Timer {
                            id:gettimetimer;
                            interval: 10;
                            running: true;
                            repeat: true;
                            triggeredOnStart: true
                            onTriggered: Variables.getTime();
                        }
                        Timer {
                            id:getdatetimer;
                            interval: 10;
                            running: true;
                            repeat: true;
                            triggeredOnStart: true
                            onTriggered: Variables.getDate1();
                        }
                    }

                    Column{
                        x:20; y:250
                        spacing: 20

                        Rectangle{
                            id: calender
                            width: 320; height: 300
                            color: "white"
                            Image {
                                id: calendar1
                                width: parent.width
                                height: parent.height
                                source: "./pictures/calender.jpg"
                                smooth: true
                            }
                        }

                        Row{
                            spacing: 20

                            Rectangle{
                                id:weathericon
                                width:150; height:150;
                                color: "#333333"

                                Text {
                                    id: displayWeatherMini
                                    anchors.centerIn: parent
                                    font.family: "Segoe WP Semibold"
                                    font.pointSize: 60
                                    color: "white"
                                    // text: "25"
                                }
                                Timer {
                                    id:getweathertimer;
                                    interval: 600000;
                                    running: true;
                                    repeat: true;
                                    triggeredOnStart: true
                                    onTriggered: WeatherFunctions.getWeather();
                                }

                                Text {
                                    id: degFMini
                                    x: 100
                                    y: 10
                                    font.family: "Segoe WP Semibold"
                                    font.pointSize: 30
                                    color: "white"
                                    text: "°F"
                                }

                                Text {
                                    id:chicagoText
                                    font.family: "Segoe WP Light"
                                    font.pointSize: 25
                                    x: 15
                                    y: 102
                                    color: "white"
                                    text: "Chicago"
                                }

                                MouseArea {
                                    id: clickForWeather
                                    anchors.fill: parent
                                    onClicked: {
                                        maincircle.visible = false;
                                        weatherfeaturewindow.visible=true;
                                        blacktrans.visible = true;
                                        var doc = new XMLHttpRequest();
                                        doc.onreadystatechange = function() {
                                            if (doc.readyState == XMLHttpRequest.DONE) {
                                                var jsonObject = eval('(' + doc.responseText + ')');
                                                WeatherFunctions.loadWeather(jsonObject);
                                            }
                                        }
                                        doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + "Chicago" + "&format=json&num_of_days=5&key=80b4744b8c193111130202&extra=localObsTime");
                                        doc.send();
                                    }
                                }
                            }

                            Rectangle{
                                id:trafficicon
                                width:150; height:150;

                                Image{
                                    id: trafficimg
                                    width:parent.width; height: parent.height
                                    source: "pictures/traffic.png"
                                    fillMode: Image.PreserveAspectFit
                                }

                                Text{
                                    id:minutesnum
                                    color: "#ffffff"
                                    anchors.topMargin: 0
                                    text: "18"
                                    font.family: "Segoe WP Semibold"
                                    x:80
                                    font.pointSize: 50
                                }
                                Text{
                                    id:minutestext
                                    color: "#ffffff"
                                    anchors.topMargin: 0
                                    text: "min"
                                    font.family: "Segoe WP Light"
                                    x:90; y:65
                                    font.pointSize: 20
                                }
                                Text{
                                    id:busnum
                                    color: "#ffffff"
                                    anchors.topMargin: 0
                                    text: "157"
                                    font.family: "Segoe WP Semibold"
                                    verticalAlignment: Text.AlignBottom
                                    x:15; y:80
                                    font.pointSize: 25
                                }
                                Text{
                                    id:traffpred
                                    color: "#ffffff"
                                    anchors.topMargin: 0
                                    text: "Light Traffic"
                                    font.family: "Segoe WP Light"
                                    verticalAlignment: Text.AlignBottom
                                    x:10; y:115
                                    font.pointSize: 18
                                }

                                MouseArea{
                                    id:trafficbutton
                                    anchors.fill: parent
                                    onClicked: {
                                        maincircle.visible = false;
                                        trafficfeaturewindow.visible = true;
                                        blacktrans.visible = true;
                                    }
                                }

                            }
                        }

                        Rectangle{
                            id: musicmini
                            width: 320; height: 120
                            color: "#333333"

                            Row {
                                id: musicminiicons
                                spacing: 50
                                anchors.centerIn: parent
                                Image {
                                    id: backMini
                                    source: "./Music/back.png"
                                    MouseArea{
                                        id:previousbutton1
                                        anchors.fill: parent
                                        onClicked: {
                                            console.log("Hi there music");
                                            playmusic.stop();
                                            playmusic1.play();
                                            songNameMini.text="Right Now na na"
                                            playmusic2.stop();
                                        }
                                    }
                                }

                                Image {
                                    id: playingMini
                                    source: "./Music/playing.png"
                                    MouseArea{

                                        id:playbutton1


                                        anchors.fill: parent


                                        onClicked: {



                                            songNameMini.text="Lightning"




                                            playmusic1.stop();playmusic2.stop();  playmusic.play();


                                        }

                                    }
                                }

                                Image {
                                    id: frontMini
                                    source: "./Music/front.png"
                                    MouseArea{

                                        id:nextbutton1


                                        anchors.fill: parent


                                        onClicked: {playmusic.stop();


                                            album.source="pictures/rihanna.jpg"


                                            songNameMini.text="Umbrella"


                                            playmusic2.play();


                                            playmusic1.stop();

                                        }

                                    }
                                }
                            }
                            Text {
                                id: songNameMini
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                width: parent.width
                                font.family: "Segoe WP Semibold"
                                color: "white"
                                font.pointSize: 15
                                //text: "Hi"
                            }

                            Image {
                                x:290;
                                y:90;
                                width:30;
                                height:30;
                                source:"./Music/More.png"

                                MouseArea{
                                    id:pressToOpenMusic
                                    anchors.fill: parent

                                    onPressed: {
                                        maincircle.visible = false;
                                        musicfeaturewindow.visible = true;
                                        blacktrans.visible = true;
                                    }
                                }
                            }
                        }

                        Rectangle{
                            id: galleryicon
                            width: 320; height: 100
                            Image {
                                id: galleryImage
                                anchors.fill: parent
                                smooth: true
                                source:"./gallery/grandpa/11.jpg"

                            MouseArea {
                                id:clickForGallery
                                anchors.fill: parent
                                onClicked: {
                                    picturegallerywindow.visible = true
                                    maincircle.visible = false
                                    blacktrans.visible = true
                                }
                            }
                            }


                        }
                    }

                }

                Rectangle{
                    id:bttmpanel
                    width: 1560
                    height: 60
                    color: "#C1DCFF"
                    y: 1020

                    Marquee {
                        id:mq
                        width: 1280
                        height:50
                        padding: 2
                        anchors.centerIn: parent
                        color:"#C1DDFF"
                        text: "Pick up Kids - Cook Pizza - Pay Comed Bill - Pay Rent - Eliza's Birthday Tomorrow - Pay Gas Bill - Dental Appointment 15th - Call Plumber"
                        textColor: "black"
                    }


                }

                Row{
                    id: feedrow
                    x: 30; z:1
                    spacing: 15

                    Image{
                        id: fbfeed
                        width: 60
                        height: 60
                        y:1000
                        source:"pictures/fb.png"

                        MouseArea{
                            id: fbtouch
                            anchors.fill: parent
                            onClicked:
                            {
                                if(fbfeed.y==983)
                                {
                                    feedwindow.visible = false;
                                    fbfeed.y = 1000;
                                }
                                else{
                                    fbfeed.y = 983
                                    twfeed.y = 1000;
                                    cnnfeed.y = 1000;
                                    feedimage.source = "pictures/fbfeed.png"
                                    feedwindow.visible = true
                                }
                            }
                        }
                    }

                    Image{
                        id: twfeed
                        width: 60
                        height: 60
                        y: 1000
                        source:"pictures/twitter.png"

                        MouseArea{
                            id: twtouch
                            anchors.fill: parent
                            onClicked:
                            {
                                if(twfeed.y==983)
                                {
                                    feedwindow.visible = false;
                                    twfeed.y = 1000;
                                }
                                else{
                                    twfeed.y = 983;
                                    fbfeed.y = 1000;
                                    cnnfeed.y = 1000;
                                    feedimage.source = "pictures/tweetfeed.jpg"
                                    feedwindow.visible = true
                                }
                            }
                        }
                    }

                    Image{
                        id: cnnfeed
                        width: 60
                        height: 60
                        y: 1000
                        source:"pictures/cnn_logo.jpeg"

                        MouseArea{
                            id: cnntouch
                            anchors.fill: parent
                            onClicked:
                            {
                                if(cnnfeed.y==983)
                                {
                                    feedwindow.visible = false;
                                    cnnfeed.y = 1000;
                                }
                                else{
                                    twfeed.y = 1000;
                                    fbfeed.y = 1000;
                                    cnnfeed.y = 983;
                                    feedimage.source = "pictures/cnnfeed1.jpg"
                                    feedwindow.visible = true
                                }
                            }
                        }
                    }
                }
                Row{
                    id: browrow
                    x: 1400; z:1
                    spacing: 15

                    Image{
                        id: browser1
                        width: 60
                        height: 60
                        y:1000
                        source:"pictures/browser.png"

                        MouseArea{
                            id: brtouch
                            anchors.fill: parent
                            onClicked:
                            {
                                if(browser.y==983)
                                {
                                    browser.y = 1000;
                                    browserfeaturewindow.visible = false;
                                    maincircle.visible = true;
                                    blacktrans.visible = false;
                                }
                                else
                                {
                                    browser.y = 983;
                                    listmin.y = 1000;
                                    browserfeaturewindow.visible = true;
                                    maincircle.visible = false;
                                    blacktrans.visible = true;
                                }
                            }
                        }
                    }

                    Image{
                        id: listmin
                        width: 60
                        height: 60
                        y: 1000
                        source:"pictures/Note.jpg"

                        MouseArea{
                            id: lmintouch
                            anchors.fill: parent
                            onClicked:
                            {
                                if(listmin.y==983)
                                {
                                    sticky1.visible = false;
                                    sticky2.visible = false;
                                    listmin.y = 1000;
                                }
                                else
                                {
                                    browser.y = 1000;
                                    listmin.y = 983;
                                    sticky1.visible = true;
                                    sticky2.visible = true;
                                }
                            }
                        }
                    }

                }

                Image{
                    id:sticky1
                    source: "pictures/List1.png"
                    x:1200; y:550
                    visible: false
                }

                Image{
                    id:sticky2
                    source: "pictures/List2.png"
                    x:1300; y:700
                    visible: false
                }
                Rectangle{
                    id:feedwindow
                    width:404; height: 340
                    x: 15; y: 660
                    border.color: "#1ba1e2"
                    visible: false


                    Image{
                        id: feedimage
                        anchors.fill: parent

                    }

                    MouseArea {
                        id: clickToCloseFeed

                        anchors.fill: parent
                        onClicked:{
                            feedwindow.visible = false
                            cnnfeed.y = 1000
                            fbfeed.y = 1000
                            twfeed.y = 1000
                        }
                    }

                }


                Rectangle{
                    id:featurewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titleline
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebar
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Rectangle{
                            id:selectedbutton
                            width: 240; height: 65
                            y: 126; //change y accordigly as next buttons are to be selected
                            z:2;
                            color: "#1BA1E2"
                        }

                        Rectangle{
                            id:buttonseparator1
                            width: 200; height: 1
                            x: 20; y: 190; z:1
                            color: "#000000"
                        }

                        Rectangle{
                            id:buttonseparator2
                            width: 200; height: 1
                            x: 20; y: 190+64.8; z:1
                            color: "#000000"
                        }

                        Rectangle{
                            id:buttonseparator3
                            width: 200; height: 1
                            x: 20; y: 190+64.8+64.8; z:1
                            color: "#000000"
                        }
                        //any number of aditional button separators followed by copying the above code and adding 64.8 to y

                    }

                }

                /**************COOKING******************/
                Rectangle{
                    id:cookingfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinec
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebarc
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlec
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlec
                        }

                        Column{
                            id: sidelanec
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: recipes
                                downProperty : 1
                                text: "Recipes"

                                onClicked: {
                                    downProperty = 1
                                    favourites.downProperty = 2
                                    suggestions.downProperty = 2
                                    recipeWindow.visible = true
                                    favouritesWindowc.visible = false
                                    suggestionsWindow.visible = false
                                    if(downProperty==1) buttonseparator1c.visible = false
                                    buttonseparator2c.visible = true
                                    americanRecipes.visible = false
                                    bakedBeansRecipeWindow.visible = false
                                    fennelRecipeWindow.visible=false
                                    sundaeRecipeWindow.visible=false

                                }
                            }

                            Rectangle{
                                id:buttonseparator1c
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: favourites
                                downProperty: 2
                                text: "Favorites"

                                onClicked: {
                                    downProperty = 1
                                    recipes.downProperty = 2
                                    suggestions.downProperty = 2
                                    favouritesWindowc.visible = true
                                    recipeWindow.visible = false
                                    suggestionsWindow.visible = false
                                    if(downProperty==1) { buttonseparator1c.visible = false; buttonseparator2c.visible = false; }
                                    americanRecipes.visible = false
                                    bakedBeansRecipeWindow.visible = false
                                    fennelRecipeWindow.visible=false
                                    sundaeRecipeWindow.visible=false
                                }
                            }

                            Rectangle{
                                id:buttonseparator2c
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: suggestions
                                downProperty: 2
                                text: "Suggestions"

                                onClicked: {
                                    downProperty = 1
                                    recipes.downProperty = 2
                                    favourites.downProperty = 2
                                    suggestionsWindow.visible = true
                                    recipeWindow.visible = false
                                    favouritesWindowc.visible = false
                                    if(downProperty==1) { buttonseparator2c.visible = false;}
                                    buttonseparator1c.visible = true
                                    americanRecipes.visible = false
                                    bakedBeansRecipeWindow.visible = false
                                    fennelRecipeWindow.visible=false
                                    sundaeRecipeWindow.visible=false
                                }
                            }


                        }
                    }


                    //Recipes
                    Rectangle{
                        id: recipeWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true

                        Grid {
                            id: recipeCategories
                            spacing: 25
                            x: 25
                            y: 25
                            columns: 3

                            Image{
                                id: americanCat
                                source: "./Cooking/American.png"
                                width: 280
                                height: 150

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        recipeCategories.visible = false;
                                        americanRecipes.visible = true;
                                        Variables.displayAmericanRecipes();
                                    }
                                }
                            }

                            Image {
                                id: italianCat
                                source: "./Cooking/Italian.png"
                                width: 280
                                height: 150
                            }

                            Image {
                                id: chineseCat
                                source: "./Cooking/Chinese.png"
                                width: 280
                                height: 150
                            }

                            Image {
                                id: breakfastCat
                                source: "./Cooking/Breakfast.PNG"
                                width: 280
                                height: 150
                            }

                            Image {
                                id: lunchDinnerCat
                                source: "./Cooking/Lunch&Dinner.PNG"
                                width: 280
                                height: 150
                            }

                            Image {
                                id: snacksCat
                                source: "./Cooking/Snacks.PNG"
                                width: 280
                                height: 150
                            }

                            Image {
                                id: dessertsCat
                                source: "./Cooking/Desserts.PNG"
                                width: 280
                                height: 150
                            }
                        }
                    }

                    Rectangle {
                        id: americanRecipes
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        visible: false
                        // border.color: "black"

                        Rectangle {
                            id: americanHeadingEnclose
                            color: "#7CD0EB"
                            x: 30
                            y: 10
                            width: 250
                            height: 100
                            Text{
                                id:americanHeading
                                font.family: "Segoe WP Light"
                                font.bold: true
                                font.italic: true
                                font.pointSize: 36
                                text: "American"
                                anchors.centerIn: americanHeadingEnclose
                            }
                        }
                        Rectangle {
                            id:currRecipeRect
                            width: 700
                            height: 400
                            x: 30
                            y: 90
                            //border.color: "black"

                            Scrollable {
                                id:currRecipeFlickArea
                                anchors.fill: parent
                                contentWidth: recipeLists.width
                                contentHeight: recipeLists.height
                                flickableDirection: Flickable.VerticalFlick
                                clip: true

                                Text{
                                    id: recipeLists
                                    wrapMode: Text.Wrap
                                    width: currRecipeRect.width
                                    font.family: "Segoe WP"
                                    font.pointSize: 26
                                    color: "black"
                                }

                                ScrollBar {
                                    flickable: currRecipeFlickArea
                                    vertical: true
                                }
                            }

                        }

                        Rectangle{

                            id: rect
                            width: 100
                            height: 100
                            x: 30
                            y: 95
                            color: "transparent"

                            MouseArea {
                                id: bakedBeansRecipe
                                anchors.fill: parent
                                onClicked: {
                                    americanRecipes.visible = false;
                                    bakedBeansRecipeWindow.visible = true;
                                    fennelRecipeWindow.visible = false;
                                    recipeVid.vidName = "./Cooking/bakedBeans.mp4"
                                    // blankVid.visible = true;
                                    playVid.visible = true;

                                }
                            }
                        }

                        Rectangle{

                            id: rect1
                            width: 100
                            height: 100
                            x: 30
                            y: 160
                            color: "transparent"

                            MouseArea {
                                id: fennel
                                anchors.fill: parent
                                onClicked: {
                                    americanRecipes.visible = false;
                                    bakedBeansRecipeWindow.visible = false;
                                    fennelRecipeWindow.visible = true;
                                    //blankVid.visible = true;
                                    recipeVid.vidName = "./Cooking/Fennel.mp4"
                                    playVid.visible = true;
                                }
                            }
                        }

                    }

                    Rectangle {
                        id: bakedBeansRecipeWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "black"
                        visible: false

                        Image {
                            id: bakedBeans
                            source: "./Cooking/bakedBeansRecipe.png"
                        }
                    }

                    Rectangle {
                        id: fennelRecipeWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "brown"
                        visible: false

                        Image {
                            id: fennelRecipe
                            source: "./Cooking/FennelRecipe.png"
                        }
                    }

                    Rectangle {
                        id: sundaeRecipeWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        //color: "brown"
                        visible: false

                        Image {
                            id: sundaeRecipe
                            anchors.fill: parent
                            source: "./Cooking/SundaeRecipe.png"
                        }
                    }


                    //favourites
                    Rectangle{
                        id: favouritesWindowc
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"

                        visible: false

                        Grid {
                            id: favGridRecipes
                            columns: 3
                            spacing : 20
                            x: 10
                            y: 10

                            Image {
                                id: fav1
                                source: "./Cooking/Sundae.PNG"
                                width: 250
                                height: 200

                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked :{
                                        favouritesWindowc.visible=false;
                                        sundaeRecipeWindow.visible = true;
                                        recipeVid.vidName = "./Cooking/Sundae.mp4"
                                        playVid.visible=true;
                                    }
                                }
                            }

                            Image {
                                id: fav2
                                source: "./Cooking/chowmein.PNG"
                                width: 250
                                height: 200
                            }

                            Image {
                                id: fav3
                                source: "./Cooking/spinach.PNG"
                                width: 250
                                height: 200
                            }

                            Image {
                                id:fav4
                                source: "./Cooking/dal.png"
                                width: 250
                                height: 200
                            }

                        }

                    }

                    //suggestions
                    Rectangle{
                        id: suggestionsWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false

                        Text {
                            id:tryThese
                            text: "You might want to try these recipes!"
                            font.family: "Segoe WP Light"
                            font.pointSize: 36
                            x: 100
                            font.italic: true
                        }

                        Row {
                            id: suggestionsRow
                            x: 60
                            y: 120
                            spacing: 20

                            Image{
                                id: sundaePic
                                source: "./Cooking/Sundae.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        suggestionsWindow.visible = false;
                                        sundaeRecipeWindow.visible = true;
                                        recipeVid.vidName = "./Cooking/Sundae.mp4"
                                        playVid.visible=true;
                                    }
                                }
                            }

                            Image {
                                id: sandwichPic
                                source: "./Cooking/spinach.PNG"
                            }

                            Image {
                                id: chowmeinPic
                                source: "./Cooking/chowmein.PNG"
                            }
                        }
                    }

                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBarc
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image {
                            id: backToRecipeList
                            x: 10
                            width: 66
                            height: 60
                            source: "./pictures/arrowBack.png"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    bakedBeansRecipeWindow.visible=false;
                                    fennelRecipeWindow.visible=false;
                                    americanRecipes.visible=true;
                                }
                            }
                        }

                        Image {
                            id:playVid
                            x: 90
                            width: 66
                            height: 60
                            source: "./pictures/playSlideShow.png"
                            visible: false
                            MouseArea {
                                id: playVideo
                                anchors.fill: parent
                                onClicked: {
                                    console.log("In Play");
                                    recipeVid.visible=true;
                                    titlelinec.visible = false;
                                    //bottomBarc.visible=false;
                                    //bakedBeansVid.playing = true;

                                }
                            }
                        }
                        Image{
                            id:helpiconc
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                    /*    Rectangle {
            id:blankVid
            width: 1200
            height: 640
            color: "black"
            visible: false
        }*/

                    VideoPlayer {
                        width: 200
                        height: 200
                        x: -10
                        y: -10
                        id:recipeVid
                        visible : false
                    }


                }

                /**************LISTS******************/
                Rectangle{
                    id:listsfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinel
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebarl
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlel
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlel
                        }

                        Column{
                            id: sidelanel
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: todo
                                downProperty : 1
                                text: "To Do"

                                onClicked: {
                                    downProperty = 1
                                    grocery.downProperty = 2
                                    shopping.downProperty = 2
                                    miscellaneous.downProperty = 2
                                    todoWindow.visible = true
                                    groceryWindow.visible = false
                                    shoppingWindow.visible = false
                                    miscsWindow.visible = false
                                    if(downProperty==1) buttonseparator1l.visible = false
                                    buttonseparator2l.visible = true
                                    buttonseparator3l.visible = true
                                    buttonseparator4l.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator1l
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: grocery
                                downProperty: 2
                                text: "grocery"

                                onClicked: {
                                    downProperty = 1
                                    todo.downProperty = 2
                                    shopping.downProperty = 2
                                    miscellaneous.downProperty = 2
                                    groceryWindow.visible = true
                                    todoWindow.visible = false
                                    if(downProperty==1) { buttonseparator1l.visible = false;     buttonseparator2l.visible = false }
                                    buttonseparator3l.visible = true
                                    buttonseparator4l.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator2l
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: shopping
                                downProperty: 2
                                text: "Shopping"

                                onClicked: {
                                    downProperty = 1
                                    todo.downProperty = 2
                                    grocery.downProperty = 2
                                    miscellaneous.downProperty = 2
                                    groceryWindow.visible = true
                                    todoWindow.visible = false
                                    if(downProperty==1) { buttonseparator3l.visible = false;     buttonseparator2l.visible = false }
                                    buttonseparator1l.visible = true
                                    buttonseparator4l.visible = true
                                }
                            }

                            Rectangle{
                                id: buttonseparator3l
                                width: 200
                                height: 1
                                x: 10
                                color: "#000000"
                            }

                            SideButton {
                                id: miscellaneous
                                downProperty: 2
                                text: "Miscellaneous"

                                onClicked: {
                                    downProperty = 1
                                    todo.downProperty = 2
                                    grocery.downProperty = 2
                                    shopping.downProperty = 2
                                    groceryWindow.visible = true
                                    todoWindow.visible = false
                                    if(downProperty==1) { buttonseparator3l.visible = false;     buttonseparator4l.visible = false }
                                    buttonseparator1l.visible = true
                                    buttonseparator2l.visible = true
                                }
                            }

                            Rectangle{
                                id: buttonseparator4l
                                width: 200
                                height: 1
                                x: 10
                                color: "#000000"
                            }

                        }

                        Rectangle{
                            id: addbutton
                            x:50; y:500;
                            width: 140
                            height: 50
                            color: "#1ba1e2"

                            Text{
                                id: addbttn
                                anchors.verticalCenter: parent.verticalCenter
                                text: "  + Add"
                                font.family: "Segoe WP Bold"
                                font.pointSize: 25
                                color: "white"
                            }
                        }
                    }


                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBarl
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Row{
                            x: 10
                            spacing: 10

                            Image{
                                id: add
                                source: "pictures/note_add.jpg"
                                y: 5
                                width: 60; height: 60
                                fillMode: Image.PreserveAspectFit

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        if(todoWindow.visible==true)
                                            todoadditemWindow.visible=true
                                    }
                                }
                            }

                            Image{
                                id: delet
                                y:10
                                width: 60; height: 45
                                fillMode: Image.PreserveAspectFit
                                source: "pictures/delete.png"
                            }

                            Image{
                                id: listmini
                                y:10
                                width: 60; height: 45
                                fillMode: Image.PreserveAspectFit
                                source: "pictures/Note.jpg"
                            }

                        }

                        Row{
                            x: 650; y:5

                            Rectangle{
                                id:searchbox
                                y: 10
                                height: 40; width: 180
                                border.color: "black"
                            }

                            Image{
                                id:searchicon
                                y: 5
                                width: 60; height: 50
                                source: "pictures/Search.png"
                                fillMode: Image.PreserveAspectFit
                            }

                            Image{
                                id:helpiconl
                                source: "pictures/help.gif"
                                anchors.leftMargin: 30
                            }

                        }


                    }

                    //Todo
                    Rectangle{
                        id: todoWindow
                        x: 260
                        y: 110
                        width: 940
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true

                        Rectangle{
                            id: todoadditemWindow
                            x:200; y:50; z:1
                            width:350; height:350
                            color: "#1ba1e2"
                            visible: false
                            border.color: "black"
                            border.width: 3

                            Rectangle{
                                x:3; y:3
                                width: 344; height: 57
                                color: "#7CD0EB"

                                Text{
                                    text:" Add Item"
                                    font.family: "Segoe WP Light"
                                    font.pointSize: 30
                                    color:"black"
                                }
                            }

                            Column{
                                x: 10; y: 70
                                spacing: 10

                                Text{
                                    text:"Item Name"
                                    color: "white"
                                    font.pointSize: 20
                                    font.family: "Segoe WP Light"
                                }
                                Rectangle{
                                    id:tdtextarea1
                                    width: 320; height:30
                                    color: "white"

                                    TextInput{
                                        id: tditemname
                                        x:2; y:2
                                        focus: true
                                        cursorVisible: true
                                        font.pixelSize: 20
                                        width: parent.width
                                        height: parent.height
                                        // wrapMode: TextEdit.wrap
                                        clip: true
                                    }
                                }
                                Text{
                                    text:"Due"
                                    color: "white"
                                    font.pointSize: 20
                                    font.family: "Segoe WP Light"
                                }
                                Rectangle{
                                    id:tdtextarea2
                                    width: 320; height:30
                                    color: "white"

                                    TextInput{
                                        id: tditemdue
                                        x:2; y:2
                                        focus: true
                                        cursorVisible: true
                                        font.pixelSize:20
                                        width: parent.width
                                        height: parent.height
                                        // wrapMode: TextEdit.wrap
                                        clip: true
                                    }
                                }

                            }

                            Row{
                                x:60; y:280
                                spacing: 20

                                Rectangle{
                                    id: tdsavebttn
                                    width:100; height:40
                                    border.color: "white"
                                    border.width: 2
                                    color: "#1ba1e2"

                                    Text{id:tdsave; text: "  save"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            tdsave.color = "black"
                                            if(tditemname.text!="dddd")
                                            {
                                                Variables.tditemcount++;
                                                // Variables.tditemcount=Variables.tditemcount+1;
                                                var v = Variables.tditemcount;
                                                if(v===1) {
                                                    add1.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add1.visible = true;
                                                }
                                                else if(v===2)  {
                                                    add2.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add2.visible = true;
                                                }
                                                else if(v===3)  {
                                                    add3.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add3.visible = true;
                                                }
                                                else if(v===4)  {
                                                    add4.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add4.visible = true;
                                                }
                                                else if(v===5)  {
                                                    add5.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add5.visible = true;
                                                }
                                                else if(v===6)  {
                                                    add6.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add6.visible = true;
                                                }
                                                else {
                                                    add7.text = "- "+tditemname.text+" - "+tditemdue.text;
                                                    add7.visible = true;
                                                }
                                            }
                                        }

                                        onReleased: {tdsave.color = "white"}

                                    }
                                }

                                Rectangle{
                                    id: tdcancelbttn
                                    width:100; height:40
                                    color: "#1ba1e2"
                                    border.color: "white"
                                    border.width: 2

                                    Text{id:tdcancel; text: " cancel"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            todoadditemWindow.visible = false
                                            tdsave.color = "black"
                                        }
                                    }
                                }
                            }


                        }

                        Rectangle{
                            id: tododeleteitemWindow
                            x:200; y:50; z:1
                            width:350; height:150
                            color: "#1ba1e2"
                            visible: false
                            border.color: "black"
                            border.width: 3

                            Rectangle{
                                x:3; y:3
                                width: 344; height: 50
                                color: "#7CD0EB"

                                Text{
                                    text:" Delete Item"
                                    font.family: "Segoe WP Light"
                                    font.pointSize: 30
                                    color:"black"
                                }
                            }

                            Column{
                                x: 10; y: 70
                                spacing: 10

                                Text{
                                    text:"Are you sure you want to Delete this item?"
                                    color: "white"
                                    font.pointSize: 12
                                    font.family: "Segoe WP Light"
                                }
                            }

                            Row{
                                x:60; y:100
                                spacing: 20

                                Rectangle{
                                    id: tddeletebttn
                                    width:100; height:40
                                    border.color: "white"
                                    border.width: 2
                                    color: "#1ba1e2"

                                    Text{id:tddelete; text: " Delete"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            tddelete.color = "black"
                                            if(itemname.text!=NULL)
                                            {
                                                Variables.tditemcount--;
                                                var v = Variables.tditemcount;
                                                var del = Variables.delitemid;
                                                if(v==1) {
                                                    add1.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add1.visible = true;
                                                }
                                                else if(v==2)  {
                                                    add2.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add2.visible = true;
                                                }
                                                else if(v==3)  {
                                                    add3.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add3.visible = true;
                                                }
                                                else if(v==4)  {
                                                    add4.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add4.visible = true;
                                                }
                                                else if(v==5)  {
                                                    add5.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add5.visible = true;
                                                }
                                                else if(v==6)  {
                                                    add6.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add6.visible = true;
                                                }
                                                else {
                                                    add7.text = "- "+itemname.text+" - "+itemdue.text;
                                                    add7.visible = true;
                                                }
                                            }
                                        }

                                        onReleased: {save.color = "white"}

                                    }
                                }

                                Rectangle{
                                    id: tddcancelbttn
                                    width:100; height:40
                                    color: "#1ba1e2"
                                    border.color: "white"
                                    border.width: 2

                                    Text{id:tddcancel; text: " cancel"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            tododeleteitemWindow.visible = false
                                            tddelet.color = "black"
                                        }
                                    }
                                }
                            }


                        }



                        Scrollable {
                            id: todoFlickArea
                            anchors.fill: parent
                            contentWidth: todoWindow.width
                            contentHeight: todoWindow.height
                            flickableDirection: Flickable.VerticalFlick
                            clip: true

                            Column{
                                id:todolist
                                anchors.fill: parent
                                Text{id:tditem1; text: "- Pay gas bill"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent
                                        onPressAndHold: {
                                            tododeleteitemWindow.visible = true;
                                            tditem1.data
                                            Variables.delitemid=tditem1.text;
                                        }
                                    }
                                }
                                Text{id:tditem2; text: "- bring groceries"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent
                                        onPressAndHold: {
                                            tododeleteitemWindow.visible = true;
                                            Variables.delitemid=tditem2.text;
                                        }
                                    }
                                }
                                Text{id:tditem3; text: "- visit dentist"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent
                                        onPressAndHold: {
                                            tododeleteitemWindow.visible = true;
                                            Variables.delitemid=tditem3.text;
                                        }
                                    }
                                }
                                Text{id:tditem4; text: "- Cook pasta"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent
                                        onPressAndHold: {
                                            tododeleteitemWindow.visible = true;
                                            Variables.delitemid=tditem4.text;
                                        }
                                    }
                                }
                                Text{id:tditem5; text: "- Bring Kids' dress"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent
                                        onPressAndHold: {
                                            tododeleteitemWindow.visible = true;
                                            Variables.delitemid=tditem4.text;
                                        }

                                    }
                                }
                                Text{id:tditem6; text: "- call plumber"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent

                                    }
                                }
                                Text{id:tditem7; text: "- call oven repair"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent

                                    }
                                }
                                Text{id:tditem8; text: "- check credit bill"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent

                                    }
                                }
                                Text{id:tditem9; text: "- arrange dinner for Friday"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent

                                    }
                                }
                                Text{id:tditem10; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light";
                                    MouseArea{
                                        anchors.fill: parent

                                    }
                                }

                                Text{id:add1; text: "- new item1"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}
                                Text{id:add2; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}

                                Text{id:add3; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}

                                Text{id:add4; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}

                                Text{id:add5; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}

                                Text{id:add6; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}

                                Text{id:add7; text: "- Get new Icard"; font.pointSize: 30; font.family: "Segoe WP Light"; visible: false}

                            }

                            ScrollBar {
                                flickable: todoFlickArea
                                vertical: true
                            }

                        }

                    }

                    //Grocery
                    Rectangle{
                        id: groceryWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false
                    }

                    //Shopping
                    Rectangle{
                        id: shoppingWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false
                    }

                    //Miscellaneous
                    Rectangle {
                        id: miscsWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false
                    }
                }

                /**************WEATHER******************/
                Rectangle{
                    id:weatherfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinew
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebarw
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlew
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlew
                        }

                        Column{
                            id: sidelanew
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: currentWeather
                                downProperty : 1
                                text: "Current"

                                onClicked: {
                                    downProperty = 1
                                    forecastWeather.downProperty = 2
                                    inRoomTemp.downProperty = 2

                                    currentWeatherWindow.visible = true
                                    forecastWeatherWindow.visible = false
                                    if(downProperty==1) buttonseparator1w.visible = false
                                    buttonseparator2w.visible = true

                                    inRoomTempWindow.visible=false

                                    var doc = new XMLHttpRequest();
                                    doc.onreadystatechange = function() {
                                        if (doc.readyState == XMLHttpRequest.DONE) {
                                            var jsonObject = eval('(' + doc.responseText + ')');
                                            WeatherFunctions.loadWeather(jsonObject);
                                        }
                                    }
                                    doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + "Chicago" + "&format=json&num_of_days=5&key=80b4744b8c193111130202&extra=localObsTime");
                                    doc.send();
                                }
                            }

                            Rectangle{
                                id:buttonseparator1w
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: forecastWeather
                                downProperty: 2
                                text: "Forecast"

                                onClicked: {
                                    downProperty = 1
                                    currentWeather.downProperty = 2
                                    inRoomTemp.downProperty = 2
                                    forecastWeatherWindow.visible = true;
                                    currentWeatherWindow.visible=false;
                                    inRoomTempWindow.visible=false;
                                    if(downProperty==1){  buttonseparator1w.visible = false; buttonseparator2w.visible = false; }

                                }
                            }

                            Rectangle{
                                id:buttonseparator2w
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: inRoomTemp
                                downProperty: 2
                                text: "Room Temp"

                                onClicked: {
                                    downProperty = 1
                                    currentWeather.downProperty = 2
                                    forecastWeather.downProperty = 2
                                    if(downProperty==1){ buttonseparator2w.visible = false; }
                                    buttonseparator1w.visible = true
                                    inRoomTempWindow.visible = true
                                    forecastWeatherWindow.visible = false
                                    currentWeatherWindow.visible = false

                                }
                            }

                        }
                    }
                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBarw
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image{
                            id: degreePic
                            source: "./pictures/degC.gif"
                            x: 10
                            width: 80
                            height: 70

                            MouseArea {
                                id:degCorF
                                anchors.fill: parent
                                onClicked: {
                                    var fullPicName = String(degreePic.source);
                                    var arrName= fullPicName.split("/");
                                    var source = arrName[arrName.length-1];
                                    console.log(source);
                                    if(source == "degF.gif"
                                            && currentWeatherWindow.visible == true)
                                    {   console.log(degreePic.source);
                                        degreePic.source = "./pictures/degC.gif";
                                        console.log(degreePic.source);
                                        degreeF.visible = true;
                                        degreeC.visible = false;
                                        degreeCorF.text="°F";

                                    }
                                    else if(source == "degC.gif"
                                            && currentWeatherWindow.visible == true)
                                    {
                                        degreePic.source = "./pictures/degF.gif";
                                        degreeF.visible = false;
                                        degreeC.visible = true;
                                        degreeCorF.text="°C";
                                        console.log(degreePic.source + " " +currentWeatherWindow.visible);
                                    }

                                    else if(source == "degF.gif"
                                            && inRoomTempWindow.visible == true)
                                    {
                                        inHouseTempPic.source = "./Cooking/inHouseTempF.png";
                                        degreePic.source = "./pictures/degC.gif";
                                    }
                                    else if(source == "degC.gif"
                                            && inRoomTempWindow.visible == true)
                                    {
                                        inHouseTempPic.source = "./Cooking/inHouseTempC.png";
                                        degreePic.source = "./pictures/degF.gif";
                                    }

                                    else if(source == "degF.gif" && forecastWeatherWindow.visible == true)
                                    {
                                        temp_min.text = tempMinFToday + '°F';
                                        temp_max.text = tempMaxFToday + '°F';
                                        tomo_min.text = tempMinFTomo + '°F';
                                        tomo_max.text = tempMaxFTomo + '°F';

                                        degreePic.source = "./pictures/degC.gif"
                                    }
                                    else if(source == "degC.gif" && forecastWeatherWindow.visible == true)
                                    {
                                        temp_min.text = tempMinCToday + '°C';
                                        temp_max.text = tempMaxCToday + '°C';
                                        tomo_min.text = tempMinCTomo + '°C';
                                        tomo_max.text = tempMaxCTomo + '°C';
                                        degreePic.source = "./pictures/degF.gif"
                                    }

                                }

                            }
                        }

                        Image{
                            id:helpiconw
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                    //CURRENT WEATHER
                    Rectangle{
                        id: currentWeatherWindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        border.color: "white"

                        Image {
                            id: weatherBg
                            x: 36
                            y: 36
                            width: 400
                            height: 320
                            source: "./icons/BlizzardDay.jpg"
                        }

                        Text {
                            id: degreeC
                            font.family: "Segoe WP Light"
                            font.pointSize: 160
                            color: "black"
                            x: 550
                            y: 50
                            // visible : false
                            //text: "25"
                        }

                        Text {
                            id: degreeF
                            font.family: "Segoe WP Light"
                            font.pointSize: 160
                            color: "black"
                            x: 550
                            y: 50

                        }

                        Text {
                            id: degreeCorF
                            font.family: "Segoe WP Light"
                            font.pointSize: 90
                            color: "black"
                            x: 750
                            y: 40
                            text: "°F"
                        }

                        Rectangle {
                            id: currentWeatherDescRect
                            width: 400
                            height: 80
                            x: 480
                            y: 285

                            Scrollable {
                                id: currWeatherFlickArea
                                anchors.fill: parent
                                contentWidth: weatherDesc.width
                                contentHeight: weatherDesc.height
                                flickableDirection: Flickable.VerticalFlick
                                clip: true

                                Text {
                                    id: weatherDesc
                                    wrapMode: Text.Wrap
                                    width: currentWeatherDescRect.width;
                                    font.family: "Segoe WP Light"
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 35
                                    //text: "Overcast lalalala blah blah"
                                }

                                ScrollBar {
                                    flickable: currWeatherFlickArea
                                    vertical: true
                                }

                            }

                        }

                        //Icon bar for different aspects of weather
                        Rectangle{
                            id: weatherIconRectangle
                            x: 36
                            y: 370
                            width:888
                            height: 120
                            color: "#C1DCFF"

                            Image {
                                id: pressureIcon
                                x: 4
                                y: 8
                                width: 50
                                height: 50
                                source: "./pictures/pressure.gif"
                            }

                            Rectangle {
                                id: pressureContainer
                                width: 144
                                height: 60
                                x: 4
                                y: 60
                                color: "#C1DCFF"

                                Text {
                                    id: pressureText
                                    font.family: "Segoe WP"
                                    width: pressureContainer.width
                                    y: 10
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 20
                                    //text: "1020 mb"
                                }
                            }
                            Rectangle {
                                id: separator1
                                x: 148
                                y: 5
                                width: 1
                                height: 110
                                color: "black"
                            }

                            Image {
                                id: humidityIcon
                                x: 152
                                y: 4
                                width: 60
                                height: 60
                                source: "./pictures/humidity.png"
                            }

                            Rectangle {
                                id: humidityContainer
                                width: 144
                                height: 60
                                x: 158
                                y: 60
                                color: "#C1DCFF"

                                Text {
                                    id: humidityText
                                    font.family: "Segoe WP"
                                    width: humidityContainer.width
                                    y: 10
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 20
                                    //text: "68%"
                                }
                            }

                            Rectangle {
                                id: separator2
                                x: 148+148
                                y: 5
                                width: 1
                                height: 110
                                color: "black"
                            }

                            Image {
                                id: windIcon
                                x: 300
                                y: 4
                                width: 60
                                height: 60
                                source: "./pictures/compass.png"
                            }

                            Rectangle {
                                id: windContainer
                                width: 144
                                height: 60
                                x: 304
                                y: 60
                                color: "#C1DCFF"

                                Text {
                                    id: windText
                                    font.family: "Segoe WP"
                                    width: windContainer.width
                                    y: 3
                                    wrapMode: Text.Wrap
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 20
                                    //text: "190 mil/h"
                                }

                                Text {
                                    id: windText2
                                    font.family: "Segoe WP"
                                    width: windContainer.width
                                    y: 32
                                    wrapMode: Text.Wrap
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 17
                                    // text: "NSW"
                                }
                            }

                            Rectangle {
                                id: separator3
                                x: 148+148+148
                                y: 5
                                width: 1
                                height: 110
                                color: "black"
                            }

                            Image {
                                id: precipIcon
                                x: 452
                                y: 8
                                width: 50
                                height: 50
                                source: "./pictures/precip.png"
                            }

                            Rectangle {
                                id: precipContainer
                                width: 144
                                height: 60
                                x: 456
                                y: 60
                                color: "#C1DCFF"

                                Text {
                                    id: precipText
                                    font.family: "Segoe WP"
                                    width: precipContainer.width
                                    y: 10
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 20
                                    // text: "0.0 mm"
                                }
                            }

                            Rectangle {
                                id: separator4
                                x: 148+148+148+148
                                y: 5
                                width: 1
                                height: 110
                                color: "black"
                            }

                            Image {
                                id: cloudIcon
                                x: 604
                                y: 4
                                width: 60
                                height: 60
                                source: "./pictures/cloud.png"
                            }

                            Rectangle {
                                id: cloudContainer
                                width: 144
                                height: 60
                                x: 606
                                y: 60
                                color: "#C1DCFF"

                                Text {
                                    id: cloudText
                                    font.family: "Segoe WP"
                                    width: cloudContainer.width
                                    y: 10
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 20
                                    // text: "100%"
                                }
                            }

                            Rectangle {
                                id: separator5
                                x: 148+148+148+148+148
                                y: 5
                                width: 1
                                height: 110
                                color: "black"
                            }

                            Image {
                                id: visibilityIcon
                                x: 756
                                y: 8
                                width: 60
                                height: 50
                                source: "./pictures/visi.png"
                            }

                            Rectangle {
                                id: visiContainer
                                width: 132
                                height: 60
                                x: 750
                                y: 60
                                color: "#C1DCFF"

                                Text {
                                    id: visiText
                                    font.family: "Segoe WP"
                                    width: pressureContainer.width
                                    y: 10
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 20
                                    // text: "6 miles"
                                }
                            }
                        }

                    }

                    //FORECAST
                    Rectangle{
                        id: forecastWeatherWindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: false

                        Rectangle {
                            id: predictToday
                            width: 390
                            height: 160
                            color: "#95E8F8"
                            border.width: 5
                            border.color: "#081073"
                            x: 160
                            y: 100
                            radius: 10
                            opacity: 0.5
                        }

                        Text {
                            id: todayText
                            text: "TODAY"
                            //color: "#081073"
                            color: "black"
                            font.family: "Arial Rounded MT Bold"
                            font.pixelSize: 25
                            x: 300
                            y: 105
                        }

                        Grid {
                            id: todayData1
                            columns: 2
                            rows: 5
                            spacing: 1
                            x: 180
                            y: 140
                            Text {
                                id: minTemptext
                                text: "Min. Temp: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: temp_min
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: maxTemptext
                                text: "Max. Temp: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: temp_max
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: ppText
                                text: "Precipitation: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: precip_today
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: windPredict
                                text: "Wind Speed: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: wind_predict
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: descPredict
                                text: "Weather: "
                                color: "#000042"
                                font.family: "Arial Rounded MT Bold"
                                font.pixelSize: 17
                            }

                            Text {
                                id: desc_predict
                                color: "#000042"
                                font.family: "Arial Rounded MT Bold"
                                font.pixelSize: 17
                            }
                        }

                        Rectangle {
                            id: predictTomo
                            width: 390
                            height: 160
                            color: "#95E8F8"
                            border.width: 5
                            border.color: "#081073"
                            x: 350
                            y: 270
                            opacity: 0.5
                            radius: 10
                        }


                        Text {
                            id: tomoText
                            text: "TOMORROW"
                            color: "black"
                            font.family: "Arial Rounded MT Bold"
                            font.pixelSize: 25
                            x: 455
                            y: 275
                        }

                        Grid {
                            id: tomoData1
                            columns: 2
                            rows: 5
                            spacing: 1
                            x: 370
                            y: 310
                            Text {
                                id: minTemptomo
                                text: "Min. Temp: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: tomo_min
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: maxTemptomo
                                text: "Max. Temp: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: tomo_max
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: ppTomo
                                text: "Precipitation: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: precip_tomo
                                font.family: "Arial Rounded MT Bold"
                                color: "#000042"
                                font.pixelSize: 17
                            }

                            Text {
                                id: windTomo
                                text: "Wind Speed: "
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: wind_tomo
                                font.family: "Arial Rounded MT Bold"
                                color: "#081073"
                                font.pixelSize: 17
                            }

                            Text {
                                id: descTomo
                                text: "Weather: "
                                color: "#000042"
                                font.family: "Arial Rounded MT Bold"
                                font.pixelSize: 17
                            }

                            Text {
                                id: desc_tomo
                                color: "#000042"
                                font.family: "Arial Rounded MT Bold"
                                font.pixelSize: 17
                            }
                        }

                    }

                    //INROOM WEATHER
                    Rectangle {
                        id: inRoomTempWindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible : false

                        Image {
                            id: inHouseTempPic
                            source: "./Cooking/InHouseTempF.png"
                            anchors.centerIn: parent
                        }
                    }


                }

                /**************BROWSER******************/
                Rectangle {
                    id: browserfeaturewindow
                    width: 1200
                    height: 660
                    x: 180
                    y: 210
                    visible: false

                    Image {
                        id: back
                        x: 10
                        y: 10
                        source: "./pictures/bwd.jpg"

                        MouseArea {
                            id:backButton
                            anchors.fill: parent
                            onClicked: {
                                Variables.backURL();
                            }
                        }
                    }

                    Image {
                        id: front
                        x: 100
                        y: 10
                        source: "./pictures/fwd.jpg"

                        MouseArea {
                            id:frontButton
                            anchors.fill: parent
                            onClicked: {
                                Variables.fwdURL();
                            }
                        }

                    }

                    Rectangle {
                        id: urlbackground
                        x: 190
                        y: 10
                        width: 900
                        height: 70
                        color: "#C1DCFF"

                        Image {
                            id: favAdd
                            x: 820
                            y: 5
                            width: 60
                            height: 60
                            source: "./pictures/RegFavB.jpg"
                            visible: true

                            MouseArea {
                                id: clickedFav
                                anchors.fill: parent
                                onClicked: {
                                    Variables.addToFav(urlEnter.text);
                                    favAdd.visible = false
                                    favAdded.visible = true
                                }
                            }
                        }

                        Image {
                            id: favAdded
                            x: 820
                            y: 5
                            width: 60
                            height: 60
                            source: "./pictures/FavB.jpg"
                            visible: false

                            MouseArea {
                                id: removedFav
                                anchors.fill: parent
                                onClicked: {
                                    Variables.removeFromFav(urlEnter.text);
                                    favAdd.visible = true
                                    favAdded.visible = false
                                }
                            }
                        }

                    }

                    TextInput {
                        id: urlEnter
                        x: 205
                        y: 25
                        width: 880
                        height: 65
                        font.family: "Segoe WP"
                        font.pointSize: 20
                        color: "black"
                        focus: true

                        onAccepted: {
                            Variables.addURL(urlEnter.text);
                        }
                    }

                    Image {
                        id: reload
                        x: 1100
                        y: 10
                        width: 90
                        height: 70
                        source: "./pictures/reload.png"

                        MouseArea{
                            id: reloadButton
                            anchors.fill: parent
                            onClicked: {
                                Variables.reloadPage();
                            }
                        }
                    }



                    Rectangle {
                        id: browser
                        width: 1100
                        height: 480
                        x: 20
                        y: 100

                        WebView {
                            id: browserActual
                            url: urlEnter.text
                            width: parent.width
                            height: parent.height

                            Text {
                                id: go
                                text: "GO!"
                                x: 600
                                y: 100
                                color: "transparent"
                                font.pointSize: 30
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        var schemaRE = /^\w+:/;
                                        if(schemaRE.test(request.url))
                                        {
                                            request.action = WebView.AcceptRequest;
                                        }
                                        else {
                                            request.action = WebView.IgnoreRequest;
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        id: displayFavB
                        width: 1100
                        height: 480
                        x: 20
                        y: 100
                        visible: false

                        Text{
                            id: favLists
                            font.family: "Segoe WP Semibold"
                            font.pointSize: 22
                            x: 30
                        }

                    }



                    Rectangle {
                        id: bottomBarb
                        color: "#C1DCFF"
                        width: 1200
                        height: 66
                        x:0; y:594

                        Image {
                            id: favIconb
                            x: 10
                            height: 60
                            width: 66
                            source: "./pictures/FavB.jpg"
                            MouseArea {
                                id: favbrowser
                                anchors.fill: parent
                                onClicked: {
                                    browser.visible = false;
                                    Variables.displayFav();
                                    displayFavB.visible=true;
                                    favIconb.visible = false;
                                    favIconbFav.visible = true;
                                }
                            }
                        }

                        Image {
                            id: homeIconb
                            x: 86
                            width: 66
                            height: 60
                            source: "./pictures/House.png"

                            MouseArea {
                                id: homeBrowser
                                anchors.fill: parent
                                onClicked: {
                                    Variables.goBrowserHome();
                                }
                            }
                        }

                        Image {
                            id: settingsB
                            height:70
                            width: 66
                            x: 162
                            source: "./pictures/SettingsB.ico"
                        }

                        Image{
                            id:helpiconb
                            source: "pictures/help.gif"
                            x: 1140
                            height: parent.height

                        }


                        Image {
                            id: favIconbFav
                            x: 10
                            height: 66
                            width: 60
                            visible: false
                            source: "./pictures/BrowserIcon.gif"

                            MouseArea {
                                id: favbrowserFav
                                anchors.fill: parent
                                onClicked: {
                                    browser.visible = true;
                                    displayFavB.visible = false;
                                    favIconb.visible = true;
                                    favIconbFav.visible = false;
                                }
                            }
                        }
                    }
                }

                /********PICTURE GALLERY************/
                Rectangle{
                    id:picturegallerywindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinep
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebarp
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlep
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlep
                        }

                        Column{
                            id: sidelanep
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: albums
                                downProperty : 1
                                text: "Albums"

                                onClicked: {
                                    albumsWindow.visible = true;
                                    backPP.visible = false;
                                    backP.visible = true;
                                    dateAlbums.downProperty = 2;
                                    favouritesP.downProperty = 2;
                                    albums.downProperty = 1;
                                    datePics.visible = false;
                                }
                            }

                            Rectangle{
                                id:buttonseparator1p
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: dateAlbums
                                downProperty: 2
                                text: "Date"

                                onClicked: {
                                    albumsWindow.visible = false;
                                    datePics.visible = true;
                                    backPP.visible = true;
                                    backP.visible = false;
                                    dateAlbums.downProperty = 1;
                                    favouritesP.downProperty = 2;
                                    albums.downProperty = 2;
                                }
                            }

                            Rectangle{
                                id:buttonseparator2p
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: favouritesP
                                downProperty: 2
                                text: "Favorites"
                            }

                            Rectangle{
                                id: buttonseparator3p
                                width: 200
                                height: 1
                                x: 10
                                color: "#000000"
                            }
                        }

                        Rectangle {
                            id: albumsWindow
                            x: 240
                            y: 90
                            width: 960
                            height: 500
                            color: "white"
                            visible: true

                            Grid {
                                columns: 3
                                spacing: 15
                                x: 20
                                y: 20

                                Image {
                                    id: grandpa
                                    source: "./gallery/grandpa.jpg"
                                    width: 250
                                    height: 200

                                    MouseArea {
                                        id: grandpaPics
                                        anchors.fill: parent

                                        onClicked:
                                        {
                                            albumsWindow.visible = false;
                                            grandpaPicGal.visible = true;
                                        }
                                    }
                                }

                                Image {
                                    id: grandma
                                    source: "./gallery/grandma.jpg"
                                    width: 250
                                    height: 200

                                    MouseArea {
                                        id: grandmaPics
                                        anchors.fill: parent

                                        onClicked:
                                        {
                                            albumsWindow.visible = false;
                                            grandmaPicGal.visible = true;
                                        }
                                    }
                                }

                                Image {
                                    id: concert
                                    source: "./gallery/concert.jpg"
                                    width: 250
                                    height: 200
                                }

                                Image {
                                    id: singapore
                                    source: "./gallery/singapore.jpg"
                                    width: 250
                                    height: 200
                                }

                            }
                        }

                        Rectangle {
                            id: grandpaPicGal
                            x: 240
                            y: 90
                            width: 960
                            height: 500
                            color: "white"
                            visible:false

                            Image {
                                id: grandpaPicAlbum
                                source: "./gallery/grandpaPics.png"
                            }
                        }

                        Rectangle {
                            id: grandmaPicGal
                            x: 240
                            y: 90
                            width: 960
                            height: 500
                            color: "white"
                            visible:false

                            Image {
                                id: grandmaPicAlbum
                                source: "./gallery/bdaypic.png"
                            }
                        }

                        Rectangle {
                            id: datePics
                            x: 240
                            y: 90
                            width: 960
                            height: 500
                            color: "white"
                            visible:false

                            Text {
                                id: date1
                                x: 20
                                y: 20
                                font.family: "Segoe WP Light"
                                font.pointSize: 36
                                color: "black"
                                text: "2012"
                            }

                            Grid {
                                id: albumGrid1
                                x: 20
                                y: 80
                                columns: 3
                                spacing: 15

                                Image {
                                    id: grandpaP
                                    source: "./gallery/grandpa.jpg"
                                    width: 250
                                    height: 200

                                    MouseArea {
                                        id: grandpaPicsP
                                        anchors.fill: parent

                                        onClicked:
                                        {
                                            datePics.visible = false;
                                            grandpaPicGal.visible = true;
                                        }
                                    }
                                }

                                Image {
                                    id: grandmaP
                                    source: "./gallery/grandma.jpg"
                                    width: 250
                                    height: 200

                                    MouseArea {
                                        id: grandmaPicsP
                                        anchors.fill: parent

                                        onClicked:
                                        {
                                            datePics.visible = false;
                                            grandmaPicGal.visible = true;
                                        }
                                    }
                                }

                                Image {
                                    id: concertAl
                                    width: 250
                                    height: 200
                                    source: "./gallery/concert.jpg"

                                }
                            }

                            Text {
                                id: date2
                                x: 20
                                y: 290
                                font.family: "Segoe WP Light"
                                font.pointSize: 36
                                color: "black"
                                text: "2013"
                            }

                            Image {
                                id: singa
                                source: "./gallery/singapore.jpg"
                                x: 20
                                y: 350
                                width: 250
                                height: 200
                            }


                        }

                    }

                    Rectangle {
                        id: bottomBarp
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image {
                            id: backP
                            source: "./pictures/arrowBack.png"
                            x: 10
                            width: 60
                            height: 60

                            MouseArea {
                                id:backPClick
                                anchors.fill: parent
                                onClicked: {
                                    albumsWindow.visible = true;
                                    grandmaPicGal.visible = false;
                                    grandpaPicGal.visible = false;
                                }

                            }
                        }

                        Image {
                            id: backPP
                            source: "./pictures/arrowBack.png"
                            x: 10
                            width: 60
                            height: 60
                            visible: false
                            MouseArea {
                                id:backPPClick
                                anchors.fill: parent
                                onClicked: {
                                    datePics.visible = true;
                                    grandmaPicGal.visible = false;
                                    grandpaPicGal.visible = false;
                                }

                            }
                        }

                        Image {
                            id: slideShowIcon
                            source: "./pictures/playSlideShow.png"
                            width: 66
                            height: 60
                            x: 80

                            MouseArea {
                                id:slideShow
                                anchors.fill: parent
                                onClicked: {
                                    trialSlideShow.visible = true;
                                    slideShowFeature.visible = true;
                                    timer1.running = true;
                                }
                            }
                        }

                        Image{
                            id:helpiconp
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }
                }

                /**********SLIDESHOW FEATURE**********/
                Rectangle{
                    id: trialSlideShow
                    width: 1200
                    height: 660
                    x: 180
                    y: 210
                    visible: false
                    Image {
                        id:slideShowFeature
                        width: 1200
                        height: 660
                        //x: 180
                        //y: 210
                        source: "./gallery/grandpa/"+picNo+".jpg"
                        visible: false
                    }

                    Timer {
                        id: timer1
                        interval: 3000; running: false; repeat: true;
                        onTriggered: {picNo++; if(picNo >11) picNo = 1;}
                    }
                }


                /********KIDS SECTION*********/
                Rectangle{
                    id:kidssectionwindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinek
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebark
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlek
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlek
                        }

                        Column{
                            id: sidelanek
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: bigAlpha
                                downProperty : 1
                                text: "Alphabet Caps"

                                onClicked: {
                                    alphabigwindow.visible = true;
                                    alphasmallwindow.visible = false;
                                    numberwindow.visible = false;
                                    bigAlpha.downProperty = 1;
                                    smallAlpha.downProperty = 2;
                                    numberKids.downProperty = 2;
                                }
                            }

                            Rectangle{
                                id:buttonseparator1k
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: smallAlpha
                                downProperty: 2
                                text: "Alphabet Small"
                                onClicked: {
                                    alphabigwindow.visible = false;
                                    alphasmallwindow.visible = true;
                                    numberwindow.visible = false;
                                    bigAlpha.downProperty = 2;
                                    smallAlpha.downProperty = 1;
                                    numberKids.downProperty = 2;
                                }
                            }

                            Rectangle{
                                id:buttonseparator2k
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: numberKids
                                downProperty: 2
                                text: "Numbers"
                                onClicked: {
                                    alphabigwindow.visible = false;
                                    alphasmallwindow.visible = false;
                                    numberwindow.visible = true;
                                    bigAlpha.downProperty = 2;
                                    smallAlpha.downProperty = 2;
                                    numberKids.downProperty = 1;
                                }
                            }

                            Rectangle{
                                id: buttonseparator3k
                                width: 200
                                height: 1
                                x: 10
                                color: "#000000"
                            }

                        }
                    }

                    Rectangle {
                        id: alphabigwindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: true

                        Image {
                            id: letters
                            x: 30
                            y: 30
                            source: "./Letters/restLetters.png"
                        }

                        MouseArea {
                            id: clickToCloseLetter
                            width: 200
                            height: 200
                            x: 670
                            y: 100

                            onClicked: {
                                capsAPic.visible = false;
                                capsBPic.visible = false;
                                capsCPic.visible = false;
                                capsDPic.visible = false;
                                capsEPic.visible = false;
                            }

                        }

                        Row {
                            id: letters1
                            spacing: 15
                            x: 30
                            y: 30

                            Image {
                                id: capsA
                                source: "./Letters/capA.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        capsAPic.visible = true;
                                        capsBPic.visible = false;
                                        capsCPic.visible = false;
                                        capsDPic.visible = false;
                                        capsEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: capsB
                                source: "./Letters/capB.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        capsAPic.visible = false;
                                        capsBPic.visible = true;
                                        capsCPic.visible = false;
                                        capsDPic.visible = false;
                                        capsEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: capsC
                                source: "./Letters/capC.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        capsAPic.visible = false;
                                        capsBPic.visible = false;
                                        capsCPic.visible = true;
                                        capsDPic.visible = false;
                                        capsEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id:capsD
                                source: "./Letters/capD.png"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        capsAPic.visible = false;
                                        capsBPic.visible = false;
                                        capsCPic.visible = false;
                                        capsDPic.visible = true;
                                        capsEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: capsE
                                source: "./Letters/capE.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        capsAPic.visible = false;
                                        capsBPic.visible = false;
                                        capsCPic.visible = false;
                                        capsDPic.visible = false;
                                        capsEPic.visible = true;
                                    }
                                }
                            }
                        }

                        Image {
                            id:capsAPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/appleA.png"
                        }

                        Image {
                            id:capsBPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/ballB.png"
                        }

                        Image {
                            id:capsCPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/catC.png"
                        }

                        Image {
                            id:capsDPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/dogD.png"
                        }

                        Image {
                            id:capsEPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/elephantE.png"
                        }

                    }

                    Rectangle {
                        id: alphasmallwindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: false

                        Image {
                            id: letterssmall
                            x: 30
                            y: 30
                            source: "./Letters/restSmall.png"
                        }

                        MouseArea {
                            id: clickToCloseLetterS
                            width: 200
                            height: 200
                            x: 670
                            y: 100

                            onClicked: {
                                smallAPic.visible = false;
                                smallBPic.visible = false;
                                smallCPic.visible = false;
                                smallDPic.visible = false;
                                smallEPic.visible = false;
                            }

                        }

                        Row {
                            id: letters2
                            spacing: 15
                            x: 30
                            y: 30

                            Image {
                                id: smallA
                                source: "./Letters/smallA.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        smallAPic.visible = true;
                                        smallBPic.visible = false;
                                        smallCPic.visible = false;
                                        smallDPic.visible = false;
                                        smallEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: smallB
                                source: "./Letters/smallB.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        smallAPic.visible = false;
                                        smallBPic.visible = true;
                                        smallCPic.visible = false;
                                        smallDPic.visible = false;
                                        smallEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: smallC
                                source: "./Letters/smallC.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        smallAPic.visible = false;
                                        smallBPic.visible = false;
                                        smallCPic.visible = true;
                                        smallDPic.visible = false;
                                        smallEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id:smallD
                                source: "./Letters/smallD.png"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        smallAPic.visible = false;
                                        smallBPic.visible = false;
                                        smallCPic.visible = false;
                                        smallDPic.visible = true;
                                        smallEPic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: smallE
                                source: "./Letters/smallE.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        smallAPic.visible = false;
                                        smallBPic.visible = false;
                                        smallCPic.visible = false;
                                        smallDPic.visible = false;
                                        smallEPic.visible = true;
                                    }
                                }
                            }
                        }

                        Image {
                            id:smallAPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/apple_a.png"
                        }

                        Image {
                            id:smallBPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/ball_b.png"
                        }

                        Image {
                            id:smallCPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/cat_c.png"
                        }

                        Image {
                            id:smallDPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/dog_d.png"
                        }

                        Image {
                            id:smallEPic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/elephant_e.png"
                        }
                    }

                    Rectangle {
                        id: numberwindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: false

                        MouseArea {
                            id: clickToCloseNumbers
                            width: 200
                            height: 200
                            x: 670
                            y: 100

                            onClicked: {
                                no1Pic.visible = false;
                                no2Pic.visible = false;
                                no3Pic.visible = false;
                                no4Pic.visible = false;
                                no5Pic.visible = false;
                            }

                        }

                        Row {
                            id: numbersRow1
                            spacing: 15
                            x: 30
                            y: 30

                            Image {
                                id: no1
                                source: "./Letters/1.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        no1Pic.visible = true;
                                        no2Pic.visible = false;
                                        no3Pic.visible = false;
                                        no4Pic.visible = false;
                                        no5Pic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: no2
                                source: "./Letters/2.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        no1Pic.visible = false;
                                        no2Pic.visible = true;
                                        no3Pic.visible = false;
                                        no4Pic.visible = false;
                                        no5Pic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: no3
                                source: "./Letters/3.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        no1Pic.visible = false;
                                        no2Pic.visible = false;
                                        no3Pic.visible = true;
                                        no4Pic.visible = false;
                                        no5Pic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id:no4
                                source: "./Letters/4.png"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        no1Pic.visible = false;
                                        no2Pic.visible = false;
                                        no3Pic.visible = false;
                                        no4Pic.visible = true;
                                        no5Pic.visible = false;
                                    }
                                }
                            }

                            Image {
                                id: no5
                                source: "./Letters/5.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        no1Pic.visible = false;
                                        no2Pic.visible = false;
                                        no3Pic.visible = false;
                                        no4Pic.visible = false;
                                        no5Pic.visible = true;
                                    }
                                }
                            }
                        }

                        Row {
                            id: numbersRow2
                            spacing: 15
                            x: 130
                            y: 180

                            Image {
                                id: no6
                                source: "./Letters/6.png"
                            }

                            Image {
                                id: no7
                                source: "./Letters/7.png"
                            }

                            Image {
                                id: no8
                                source: "./Letters/8.png"
                            }

                            Image {
                                id: no9
                                source: "./Letters/9.png"
                            }

                        }

                        Image {
                            id: no10
                            source: "./Letters/10.png"
                            x: 370
                            y: 350
                        }

                        Image {
                            id:no1Pic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/1pic.png"
                        }

                        Image {
                            id:no2Pic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/2pic.png"
                        }

                        Image {
                            id:no3Pic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/3pic.png"
                        }

                        Image {
                            id:no4Pic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/4pic.png"
                        }

                        Image {
                            id:no5Pic
                            visible: false
                            x: 270
                            y: 100
                            source: "./Letters/5pic.png"
                        }

                    }

                    Rectangle {
                        id: bottomBark
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image{
                            id:helpiconk
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                }


                /*********HOME SYNC**************/
                Rectangle{
                    id:homesyncwindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelineh
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebarh
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitleh
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitleh
                        }
                    }
                    Column{
                        id: sidelaneh
                        x:0; y:140
                        spacing:2

                        SideButton {
                            id: lights1
                            downProperty : 1
                            text: "Lights"

                            onClicked: {
                                lightsWindow.visible = true;
                                lights1.downProperty = 1
                                safety1.downProperty = 2;
                                thermostat1.downProperty = 2;
                                safetyWindow.visible = false;
                                thermostatWindow.visible = false;

                            }
                        }

                        Rectangle{
                            id:buttonseparator1h
                            x:10
                            width: 200; height: 1
                            color: "#000000"
                            visible: false
                        }

                        SideButton {
                            id: safety1
                            downProperty: 2
                            text: "Safety"

                            onClicked: {
                                lightsWindow.visible = false;
                                lights1.downProperty = 2;
                                safety1.downProperty = 1;
                                thermostat1.downProperty = 2;
                                safetyWindow.visible = true;
                                thermostatWindow.visible = false;
                            }
                        }

                        Rectangle{
                            id:buttonseparator2h
                            width: 200; height: 1
                            x:10
                            color: "#000000"
                        }

                        SideButton {
                            id: thermostat1
                            downProperty: 2
                            text: "Thermostat"
                            onClicked: {
                                lightsWindow.visible = false;
                                lights1.downProperty = 2;
                                safety1.downProperty = 2;
                                thermostat1.downProperty = 1;
                                safetyWindow.visible = false;
                                thermostatWindow.visible = true;
                            }
                        }

                        Rectangle{
                            id: buttonseparator3h
                            width: 200
                            height: 1
                            x: 10
                            color: "#000000"
                        }
                    }

                    Rectangle {
                        id: lightsWindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: true

                        Grid {
                            id: lightsGrid
                            columns: 3
                            spacing: 15
                            x: 20
                            y: 20

                            Image{
                                id:livingon
                                width: 250
                                height: 250
                                visible: true
                                source: "./Sync/livingon.PNG"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        livingon.source="./Sync/livingoff.png"
                                    }
                                }
                            }


                            Image{
                                id:kitchenoff
                                width: 250
                                height: 250
                                visible:true
                                source: "./Sync/kitchenoff.png"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        kitchenoff.source="./Sync/kitchenon.png"
                                    }
                                }
                            }



                            Image{
                                id:bedroomon
                                width: 250
                                height: 250
                                visible:true
                                source: "./Sync/bedroomon.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        bedroomon.source="./Sync/bedroomoff.png"
                                    }
                                }
                            }



                            Image{
                                id:bedroom2on
                                width: 250
                                height: 250
                                visible: true
                                source: "./Sync/bedroom2on.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        bedroom2on.source="./Sync/bedroom2off.png"
                                    }
                                }
                            }



                            Image {
                                id: bedroom3off
                                width: 250
                                height: 250
                                visible:true
                                source: "./Sync/bedroom3off.png"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        bedroom3off.source="./Sync/bedroom3on.png"
                                    }
                                }
                            }

                            Image {
                                id:guestroomon
                                width: 250
                                height: 250
                                visible: true
                                source: "./Sync/guestroomon.PNG"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        guestroomon.source="./Sync/guestroomoff.png"
                                    }
                                }
                            }


                        }


                    }

                    Rectangle {
                        id:safetyWindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: false

                        Grid {
                            id: safetyGrid
                            columns: 3
                            spacing: 15
                            x: 20
                            y: 20

                            Image{
                                id:frontDoor
                                width: 250
                                height: 250
                                visible: true
                                fillMode: Image.preserveAspectFit
                                source: "./Sync/win green.gif"

                            }


                            Image{
                                id:backDoor
                                width: 250
                                height: 250
                                visible:true
                                source: "./Sync/backDoor.png"

                            }



                            Image{
                                id:garage
                                width: 250
                                height: 250
                                visible:true
                                source: "./Sync/garage.png"

                            }



                            Image{
                                id:smoke
                                width: 250
                                height: 250
                                visible: true
                                source: "./Sync/Smoke.png"
                            }

                        }

                    }

                    Rectangle {
                        id: thermostatWindow
                        x: 240
                        y: 90
                        width: 960
                        height: 500
                        color: "white"
                        visible: false

                        Image {
                            id: thermostatPic1
                            anchors.centerIn: parent
                            width: 600
                            height: 500
                            source: "./Sync/Thermostat1.png"

                        }
                        Rectangle{
                            color: "transparent"
                            width: 50
                            height: 100
                            x: 360
                            y: 20

                            MouseArea {
                                id: clickToChange
                                anchors.fill: parent
                                onClicked: {
                                    thermostatPic1.source = "./Sync/Thermostat2.png"
                                }

                            }
                        }
                    }
                }

                /**************TRAFFIC******************/
                Rectangle{
                    id:trafficfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinet
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebart
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlet
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlet
                        }

                        Column{
                            id: sidelanet
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: myroutes
                                downProperty : 1
                                text: "My Routes"

                                onClicked: {
                                    downProperty = 1
                                    directions.downProperty = 2
                                    setplaces.downProperty = 2
                                    myroutesWindow.visible = true
                                    directionsWindow.visible = false
                                    setplacesWindow.visible = false
                                    if(downProperty==1) buttonseparator1t.visible = false
                                    buttonseparator2t.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator1t
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: directions
                                downProperty: 2
                                text: "Directions"

                                onClicked: {
                                    downProperty = 1
                                    myroutes.downProperty = 2
                                    setplaces.downProperty = 2
                                    myroutesWindow.visible = false
                                    directionsWindow.visible = true
                                    setplacesWindow.visible = false
                                    if(downProperty==1) { buttonseparator1t.visible = false; buttonseparator2t.visible = false; }
                                }
                            }

                            Rectangle{
                                id:buttonseparator2t
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: setplaces
                                downProperty: 2
                                text: "Set Places"

                                onClicked: {
                                    downProperty = 1
                                    myroutes.downProperty = 2
                                    directions.downProperty = 2
                                    myroutesWindow.visible = false
                                    directionsWindow.visible = false
                                    setplacesWindow.visible = true
                                    if(downProperty==1) { buttonseparator2t.visible = false; }
                                    buttonseparator1t.visible = true
                                }
                            }


                        }
                    }
                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBart
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image{
                            id:helpicont
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                    //My Routes
                    Rectangle{
                        id: myroutesWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true

                        Row{
                            x:30; y:20
                            spacing: 20
                            Text{
                                id: trafficcount
                                text: "18 minutes"
                                font.family: "Segoe WP Light"
                                font.bold: true
                                font.pointSize: 40
                                color: "#1ba1e2"
                            }
                            Text{
                                id: trafficdest
                                text: "To Office"
                                font.family: "Segoe WP Light"
                                font.pointSize: 40
                                color: "#000000"
                            }
                        }

                        Text{
                            id: trafficsuggest
                            x:30; y:80
                            text: "Light Traffic on 59B"
                            font.family: "Segoe WP Light"
                            font.pointSize: 25
                            color: "#000000"
                        }

                        Image{
                            id:trafficmap
                            x:0; y:130
                            width:900; height:300
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            source: "pictures/Map.jpg"
                        }

                    }

                    //directions
                    Rectangle{
                        id: directionsWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false

                        Row{
                            x:30; y:20
                            spacing: 40

                            Rectangle{
                                id: tdetailsrect

                                Column{
                                    spacing: 20
                                    Row{
                                        spacing: 10
                                        Text{
                                            font.pointSize: 15
                                            text: "From: "
                                            font.family: "Segoe WP Light"
                                        }
                                        Rectangle{
                                            id:trtextarea1
                                            width: 320; height:30
                                            color: "white"
                                            border.width: 1
                                            border.color: "black"

                                            TextInput{
                                                id: trfrom
                                                x:2; y:2
                                                activeFocusOnPress: true
                                                cursorVisible: true
                                                font.pixelSize: 20
                                                width: parent.width
                                                height: parent.height
                                                //  wrapMode: TextEdit.wrap
                                                clip: true
                                            }
                                        }
                                    }

                                    Row{
                                        spacing: 35
                                        Text{
                                            font.pointSize: 15
                                            text: "To: "
                                            font.family: "Segoe WP Light"
                                        }
                                        Rectangle{
                                            id:trtextarea2
                                            width: 320; height:30
                                            color: "white"
                                            border.width: 1
                                            border.color: "black"


                                            TextInput{
                                                id: trto
                                                x:2; y:2
                                                activeFocusOnPress: true
                                                cursorVisible: true
                                                font.pixelSize: 20
                                                width: parent.width
                                                height: parent.height
                                                //wrapMode: TextEdit.wrap
                                                clip: true
                                            }
                                        }
                                    }

                                    Row{
                                        x:40
                                        id: trbuttonrow
                                        spacing:20

                                        Rectangle{
                                            id: trsavebttn
                                            width:200; height:40
                                            border.color: "black"
                                            border.width: 2
                                            color: "#1ba1e2"

                                            Text{id:trsave; text: " Get Directions"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}
                                        }

                                        Rectangle{
                                            id: trcancelbttn
                                            width:100; height:40
                                            border.color: "black"
                                            border.width: 2
                                            color: "#1ba1e2"

                                            Text{id:trcancel; text: " Cancel"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}
                                        }


                                    }

                                }

                            }
                        }
                        Rectangle{
                            x: 500; y: 20
                            id: trdirectionslist
                            width: 300; height: 400
                            Image{
                                source: "pictures/directions.jpg"
                                fillMode: Image.PreserveAspectFit
                            }
                        }
                    }

                    //set places
                    Rectangle{
                        id: setplacesWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false

                        Rectangle{
                            id: trsetplacesrect
                            x: 30; y:20
                            Column{
                                spacing: 20
                                Row{
                                    spacing: 10
                                    Text{
                                        font.pointSize: 15
                                        text: "Name: "
                                        font.family: "Segoe WP Light"
                                    }
                                    Rectangle{
                                        id:tplacestextarea1
                                        width: 320; height:30
                                        color: "white"
                                        border.width: 1
                                        border.color: "black"

                                        TextInput{
                                            id: tplacename
                                            x:2; y:2
                                            activeFocusOnPress: true
                                            cursorVisible: true
                                            font.pixelSize: 20
                                            width: parent.width
                                            height: parent.height
                                            // Text.Wrap: TextEdit.wrap
                                            clip: true
                                        }
                                    }
                                }

                                Row{
                                    spacing: 10
                                    Text{
                                        font.pointSize: 15
                                        text: "Address: "
                                        font.family: "Segoe WP Light"
                                    }
                                    Rectangle{
                                        id:tplacestextarea2
                                        width: 320; height:30
                                        color: "white"
                                        border.width: 1
                                        border.color: "black"


                                        TextInput{
                                            id: taddress
                                            x:2; y:2
                                            activeFocusOnPress: true
                                            cursorVisible: true
                                            font.pixelSize: 20
                                            width: parent.width
                                            height: parent.height
                                            // Text.Wrap: TextEdit.wrap
                                            clip: true
                                        }
                                    }
                                }

                                Row{
                                    x:40
                                    id: tplacesbuttonrow
                                    spacing:20

                                    Rectangle{
                                        id: tpsavebttn
                                        width:100; height:40
                                        border.color: "black"
                                        border.width: 2
                                        color: "#1ba1e2"

                                        Text{id:tpsave; text: " save"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                tpsave.color = "black"
                                                if(taddress.text!="dddd")
                                                {
                                                    Variables.trplacescount++;
                                                    var w = Variables.trplacescount;
                                                    if(w==1) {
                                                        tradd1.text = "- "+tplacename.text+" - "+taddress.text;
                                                        tradd1.visible = true;
                                                    }
                                                    else if(w==2)  {
                                                        tradd2.text = "- "+tplacename.text+" - "+taddress.text;
                                                        tradd2.visible = true;
                                                    }
                                                    else if(w==3)  {
                                                        tradd3.text = "- "+tplacename.text+" - "+taddress.text;
                                                        tradd3.visible = true;
                                                    }
                                                    else if(w==4)  {
                                                        tradd4.text = "- "+tplacename.text+" - "+taddress.text;
                                                        tradd4.visible = true;
                                                    }
                                                    else {
                                                        tradd5.text = "- "+tplacename.text+" - "+taddress.text;
                                                        tradd5.visible = true;
                                                    }

                                                }
                                            }

                                            onReleased: {tpsave.color = "white"}

                                        }


                                    }

                                    Rectangle{
                                        id: tpcancelbttn
                                        width:100; height:40
                                        border.color: "black"
                                        border.width: 2
                                        color: "#1ba1e2"

                                        Text{id:tpcancel; text: " Cancel"; font.family: "Segoe UI"; color: "white"; font.pointSize: 20; anchors.horizontalCenter: parent}

                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                setplacesWindow.visible = false
                                                myroutesWindow.visible = true
                                            }
                                        }

                                    }


                                }

                            }

                        }



                        Rectangle{
                            id: myplaceslist
                            x: 500; y:20
                            width: 350; height:450
                            border.color: "black"
                            border.width: 1


                            Scrollable {
                                id: myplacesFlickArea
                                anchors.fill: parent
                                contentWidth: myplaceslist.width
                                contentHeight: myplaceslist.height
                                flickableDirection: Flickable.VerticalFlick
                                clip: true

                                Column{
                                    id:trmyplaceslist
                                    anchors.fill: parent
                                    Text{id:tritem1; text: "- Home - 1413 W Taylor"; font.pointSize: 20; font.family: "Segoe WP Light";}
                                    Text{id:tritem2; text: "- Office - 20 S Wacker Dr"; font.pointSize: 20; font.family: "Segoe WP Light";}

                                    Text{id:tradd1; text: "- Get new Icard"; font.pointSize: 20; font.family: "Segoe WP Light"; visible: false}

                                    Text{id:tradd2; text: "- Get new Icard"; font.pointSize: 20; font.family: "Segoe WP Light"; visible: false}

                                    Text{id:tradd3; text: "- Get new Icard"; font.pointSize: 20; font.family: "Segoe WP Light"; visible: false}

                                    Text{id:tradd4; text: "- Get new Icard"; font.pointSize: 20; font.family: "Segoe WP Light"; visible: false}

                                    Text{id:tradd5; text: "- Get new Icard"; font.pointSize: 20; font.family: "Segoe WP Light"; visible: false}


                                }

                                ScrollBar {
                                    flickable: myplacesFlickArea
                                    vertical: true
                                }

                            }

                        }

                    }

                }

                /***********MUSIC***********************/
                Rectangle{
                    id:musicfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelinem
                        width: 984; height: 4
                        x: 40; y: 90; z:1;
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebarm
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitlem
                            x: 30; z:2;
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitlem
                        }

                        Column{
                            id: sidelanem
                            x:0; y:140
                            spacing:2
                            /*
                SideButton {
                    id: mymusic
                    downProperty : 1
                    text: "My Music"

                   onClicked: {
                       downProperty = 1
                      // playlists.downProperty = 2
                      // favorites.downProperty = 2
                       albumsM.downProperty = 2
                       nowplaying.downProperty = 2
                   //    mymusicWindow.visible = true
                    //   favoritesWindow.visible = false
                       albumsWindowM.visible = false
                       nowplayingWindow.visible = false
                    //   playlistsWindow.visible=false;

                       if(downProperty==1) buttonseparator1m.visible = false
                       buttonseparator2m.visible = true;
                       buttonseparator3m.visible = true
                       //buttonseparator4m.visible = true
                   }
                }

                Rectangle{
                    id:buttonseparator1m
                    x:10
                    width: 200; height: 1
                    color: "#000000"
                    visible: false
                }





                SideButton {
                    id: playlists
                    downProperty: 2
                    text: "Playlists"

                    onClicked: {
                        downProperty = 1
                      //  mymusic.downProperty = 2
                        albumsM.downProperty = 2
                      //  favorites.downProperty = 2
                        nowplaying.downProperty = 2
                     //   playlistsWindow.visible = true
                     //   mymusicWindow.visible = false
                     //   favoritesWindow.visible = false
                        albumsWindowM.visible = false
                        nowplayingWindow.visible=false;
                        if(downProperty==1)
                         {buttonseparator1m.visible = false; buttonseparator2m.visible = false;}
                        buttonseparator3m.visible = false;
                     }
                }

                Rectangle{
                    id:buttonseparator2am
                    width: 200; height: 1
                    x:10;visible:false;
                    color: "#000000"
                }





                SideButton {
                    id: favorites
                    downProperty: 2
                    text: "Favorites"

                    onClicked: {
                        downProperty = 1
                     //   playlists.downProperty = 2
                        albumsM.downProperty = 2
                     //   mymusic.downProperty = 2
                        nowplaying.downProperty = 2
                     //   playlistsWindow.visible = false
                     //   favoritesWindow.visible = true
                     // mymusicWindow.visible = false
                        albumsWindowM.visible = false
                        nowplayingWindow.visible=false;
                        if(downProperty==1)
                        { buttonseparator1m.visible = false; buttonseparator2m.visible = false; }
                        buttonseparator3m.visible = true
                     }
                }

                Rectangle{
                    id:buttonseparator2m
                    width: 200; height: 1
                    x:10;visible:false;
                    color: "#000000"
                }
    */
                            SideButton {
                                id: albumsM
                                downProperty: 2
                                text: "Albums"


                                onClicked: {
                                    downProperty = 1
                                    //          mymusic.downProperty = 2
                                    //            playlists.downProperty = 2
                                    //              favorites.downProperty = 2
                                    nowplaying.downProperty = 2
                                    //                    mymusicWindow.visible = false
                                    //                  playlistsWindow.visible = false
                                    albumsWindowM.visible = true
                                    //                favoritesWindow.visible = false
                                    nowplayingWindow.visible=false;

                                    if(downProperty==1) { buttonseparator2m.visible = false; buttonseparator3m.visible = false; }
                                    buttonseparator1m.visible = true
                                }
                            }

                            Rectangle{
                                id: buttonseparator3m
                                width: 200
                                height: 1;visible:false;
                                x: 10
                                color: "#000000"
                            }

                            SideButton {
                                id: nowplaying
                                downProperty: 2
                                text: "Now Playing"

                                onClicked: {
                                    downProperty = 1
                                    //        mymusic.downProperty = 2
                                    //       playlists.downProperty = 2
                                    //      favorites.downProperty = 2
                                    albumsM.downProperty = 2
                                    //    mymusicWindow.visible = false
                                    //   favoritesWindow.visible = false
                                    //   playlistsWindow.visible = false
                                    albumsWindowM.visible = false
                                    nowplayingWindow.visible=true;
                                    if(downProperty==1) { buttonseparator3m.visible = false; }
                                    buttonseparator1m.visible = true ;buttonseparator2m.visible = true
                                }
                            }





                        }
                    }
                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBarm
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image{
                            id:helpiconm
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                    //My Music Window
                    Rectangle{
                        id: mymusicWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true
                    }

                    //playlists
                    Rectangle{
                        id: playlistsWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true
                    }

                    //favorites
                    Rectangle{
                        id: favoritesWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true
                    }

                    //albums
                    Rectangle {
                        id: albumsWindowM
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true
                        Column{spacing:30;

                            Row{spacing:30;
                                Text{text:" "}
                                Image{source:"pictures/eminem.jpg";width:200;height:200}
                                Image{source:"pictures/ken.jpg";width:200;height:200}
                                Image{source:"pictures/wolf.jpg";width:200;height:200}
                                Image{source:"pictures/mb.jpg";width:200;height:200}
                            }
                            Row{spacing:30;
                                Text{text:" "}
                                Image{source:"pictures/rihanna.jpg";width:200;height:200}
                                Image{source:"pictures/akon.jpg";width:200;height:200}
                                Image{source:"pictures/linking.jpg";width:200;height:200}
                                Image{source:"pictures/jb.jpg";width:200;height:200}
                            }


                        }


                    }



                    //now playing
                    Rectangle {
                        id: nowplayingWindow;
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true

                        Text{
                            id:songname;text:"Lightning";
                            x:20;color:"blue";
                            font.pointSize: 25;
                            font.family:"Segoe UI Symbol"
                        }



                        Audio { id: playmusic;
                            source: "songs/Lightning.mp3" }
                        Audio { id: playmusic1;
                            source: "songs/right.mp3" }
                        Audio { id: playmusic2;
                            source: "songs/umbrella.mp3" }

                        Text{id:albumname;text:"   In your atmosphere"
                            font.pointSize: 20;color:"black"
                            font.italic:true;
                            anchors.top:songname.bottom;}
                        Image{
                            id:album;x:100;y:90;width:500;height:350;
                            source:"pictures/inatm.jpg";visible:true;


                            Image{id:play;x:160;y:100;
                                source:"icons/play-icon.gif"
                                MouseArea{
                                    id:playbutton
                                    anchors.fill: parent
                                    onClicked: {
                                        album.source="pictures/inatm.jpg";
                                        albumname.text=" In your atmosphere"
                                        songname.text="Lightning"
                                        n1.color="black";n3.color="black";n2.color="white"
                                        playmusic1.stop();playmusic2.stop();  playmusic.play();
                                    }
                                }
                            }
                            Image{id:previous;x:60;y:110;
                                source:"icons/prev-icon.gif"
                                MouseArea{
                                    id:previousbutton
                                    anchors.fill: parent
                                    onClicked: {
                                        playmusic.stop();
                                        playmusic1.play();
                                        songname.text="Right Now na na"
                                        albumname.text=" Akon"
                                        album.source="pictures/akon.jpg"
                                        n2.color="black";n1.color="white"
                                        n3.color="black;"
                                        playmusic2.stop();
                                    }
                                }
                            }
                            Image{id:next;x:330;y:110;
                                source:"icons/next-icon.gif"
                                MouseArea{
                                    id:nextbutton
                                    anchors.fill: parent
                                    onClicked: {playmusic.stop();
                                        album.source="pictures/rihanna.jpg"
                                        songname.text="Umbrella"
                                        albumname.text=" Rihanna"
                                        n3.color="white";n1.color="black";
                                        n2.color="black"
                                        playmusic2.play();
                                        playmusic1.stop();
                                    }
                                }
                            }


                        }
                        Rectangle{color:"#1BA1E2";x:675;y:88
                            ;width:225;height:350
                            Column{
                                spacing:5;
                                Text{id:n1;text:"Right Now";font.pointSize: 20;color:"black"
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            songname.text="Right Now"
                                            albumname.text=" Akon"

                                            n2.color="black";n3.color="black";n1.color="white"
                                            playmusic.stop();playmusic2.stop();  playmusic1.play();
                                            album.source="pictures/akon.jpg"}}
                                }
                                Text{id:n2;text:"Lightning";font.pointSize: 20;
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {n2.color="white";n3.color="black";n1.color="black"
                                            playmusic.play();playmusic2.stop();  playmusic1.stop();
                                            songname.text="Lightning"
                                            albumname.text=" In Your Atmosphere"
                                            album.source="pictures/inatm.jpg"}}
                                }

                                Text{id:n3;text:"Umbrella";font.pointSize: 20;
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            songname.text="Umbrella"
                                            albumname.text=" Rihanna"
                                            n2.color="black";n3.color="white";n1.color="black"
                                            playmusic.stop();playmusic2.play();  playmusic1.stop();
                                            album.source="pictures/rihanna.jpg"}}
                                }


                                Text{text:"Smack down";font.pointSize: 20;}
                                Text{text:"Words";font.pointSize: 20;}
                                Text{text:"Smile";font.pointSize: 20}
                                Text{text:"Pretty Woman";font.pointSize: 20;}
                                Text{text:"Heartbeat";font.pointSize: 20;}

                            }

                        }
                    }
                }


                /**************ORGANIZER*****************id:of daily,weekly interchanged..:P*/
                Rectangle{
                    id:organizerfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelineo
                        width: 984; height: 4
                        x: 40; y: 90; z:1;
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebaro
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitleo
                            x: 30; z:2;
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: Variables.featureTitleo
                        }

                        Column{
                            id: sidelaneo
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: stopwatch
                                downProperty : 1
                                text: "Stopwatch"

                                onClicked: {
                                    downProperty = 1
                                    timer.downProperty = 2
                                    daily.downProperty = 2
                                    // weekly.downProperty = 2
                                    familyevents.downProperty = 2
                                    stopwatchwindow.visible = true
                                    timerwindow.visible = false
                                    dailywindow.visible = false
                                    // weeklywindow.visible = false
                                    familyeventswindow.visible=false;
                                    if(downProperty==1) buttonseparator1o.visible = false
                                    buttonseparator2o.visible = true
                                    buttonseparator3o.visible = true
                                    buttonseparator4o.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator1o
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: timer
                                downProperty: 2
                                text: "Timer"

                                onClicked: {
                                    downProperty = 1
                                    stopwatch.downProperty = 2
                                    daily.downProperty = 2
                                    //weekly.downProperty = 2
                                    familyevents.downProperty = 2
                                    stopwatchwindow.visible = false
                                    timerwindow.visible = true
                                    dailywindow.visible = false
                                    //weeklywindow.visible = false
                                    familyeventswindow.visible=false;
                                    if(downProperty==1) { buttonseparator1o.visible = false; buttonseparator2o.visible = false; }
                                    buttonseparator3o.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator2o
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: daily
                                downProperty: 2
                                text: "Weekly"

                                onClicked: {
                                    downProperty = 1
                                    stopwatch.downProperty = 2
                                    timer.downProperty = 2
                                    //weekly.downProperty = 2
                                    familyevents.downProperty = 2
                                    stopwatchwindow.visible = false
                                    timerwindow.visible = false
                                    dailywindow.visible = true
                                    // weeklywindow.visible = false
                                    familyeventswindow.visible=false;

                                    if(downProperty==1) { buttonseparator2o.visible = false; buttonseparator3o.visible = false; }
                                    buttonseparator1o.visible = true
                                }
                            }

                            Rectangle{
                                id: buttonseparator3o
                                width: 200
                                height: 1
                                x: 10
                                color: "#000000"
                            }
                            /*
                SideButton {
                    id: weekly
                    downProperty: 2
                    text: "Daily"

                    onClicked: {
                        downProperty = 1
                        stopwatch.downProperty = 2
                        timer.downProperty = 2
                        daily.downProperty = 2
                        familyevents.downProperty = 2
                        stopwatchwindow.visible = false
                        timerwindow.visible = false
                        dailywindow.visible = false
                        weeklywindow.visible = true
                        familyeventswindow.visible=false;
                        if(downProperty==1) { buttonseparator4o.visible = false; buttonseparator3o.visible = false; }
                        buttonseparator1o.visible = true ;buttonseparator2o.visible = true
                     }
                }

                Rectangle{
                    id: buttonseparator4o
                    width: 200
                    height: 1
                    x: 10
                    color: "#000000"
                }
    */
                            SideButton {
                                id: familyevents
                                downProperty: 2
                                text: "Family events"

                                onClicked: {
                                    downProperty = 1
                                    stopwatch.downProperty = 2
                                    timer.downProperty = 2
                                    daily.downProperty = 2
                                    //   weekly.downProperty = 2
                                    stopwatchwindow.visible = false
                                    timerwindow.visible = false
                                    dailywindow.visible = false
                                    // weeklywindow.visible = false
                                    familyeventswindow.visible=true;

                                    if(downProperty==1)  buttonseparator3o.visible = true
                                    buttonseparator1o.visible = true
                                    buttonseparator2o.visible = true
                                }
                            }

                        }
                    }
                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBaro
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image{
                            id:helpicono
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                    //stopwatch
                    Rectangle{
                        id: stopwatchwindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true
                        Image{source:"pictures/stopwatch.png";x:180;y:60
                            Text{
                                id:stopwatchhours;
                                font.pixelSize: 50;
                                x:180;y:130;
                                text:"0";
                                font.family:"Segoe WP Light"
                            }
                            Text{
                                id:stopwatchminutes;
                                font.pixelSize: 50;
                                x:300;y:130;
                                text:"0";
                                font.family:"Segoe WP Light"
                            }
                            Text{
                                id:stopwatchseconds;
                                font.pixelSize: 50;
                                x:395;y:130;
                                text:"0";
                                font.family:"Segoe WP Light"
                            }

                            Timer {
                                id:secondcount;
                                interval: 1000; running: false; repeat: true; triggeredOnStart: true
                                onTriggered: Variables.startseconds(stopwatchseconds.text);
                            }
                            Rectangle{x:80;y:350;width:100;height:50;color:"#1BA1E2";id:startbuttonenclosure;border.color:"black"

                                Button {
                                    id: startstopwatchbutton;
                                    // x:170;y:340;
                                    text : " Start"
                                    onClicked:{
                                        secondcount.start()
                                        // minutecount.start()
                                    }
                                }
                            }

                            Rectangle{
                                x:250;y:350;
                                width:100;height:50;
                                color:"#1BA1E2";
                                id:resetbuttonenclosure;
                                border.width: 1;
                                border.color:"black"

                                Button {
                                    id: stopstopwatchbutton;
                                    // x:170;y:340;
                                    text : " Stop"
                                    onClicked:{
                                        secondcount.stop()
                                        // minutecount.start()
                                    }
                                }

                            }

                            Rectangle{
                                x:420
                                y:350;
                                width:100;height:50;
                                color:"#1BA1E2";
                                id:stopbuttonenclosure;
                                border.width: 1;
                                border.color:"black"

                                Button {
                                    id: resetstopwatchbutton;
                                    // x:170;y:340;
                                    text : "Reset"
                                    onClicked:{
                                        secondcount.stop()
                                        stopwatchhours.text="0";
                                        stopwatchminutes.text="0";
                                        stopwatchseconds.text="0";
                                        // minutecount.start()
                                    }
                                }

                            }





                        }
                    }

                    //Timer;
                    Rectangle{
                        id: timerwindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false
                        Image{source:"pictures/stopwatch.png";x:180;y:60
                            Text{
                                id:timerhours;
                                font.pixelSize: 50;
                                x:180;y:130;
                                text:"10";
                                font.family:"Segoe WP Light"
                            }
                            Text{
                                id:timerminutes;
                                font.pixelSize: 50;
                                x:300;y:130;
                                text:"10";
                                font.family:"Segoe WP Light"
                            }
                            Text{
                                id:timerseconds;
                                font.pixelSize: 50;
                                x:395;y:130;
                                text:"10";
                                font.family:"Segoe WP Light"
                            }

                            Timer {
                                id:timersecondcount;
                                interval: 1000; running: false; repeat: true; triggeredOnStart: true
                                onTriggered: Variables.starttimerseconds(timerseconds.text);
                            }
                            Rectangle{
                                x:80;y:350;
                                width:100;height:50;
                                color:"#1BA1E2";
                                id:starttimerbuttonenclosure;
                                border.width: 1;
                                border.color:"black"

                                Button {
                                    id: starttimerbutton;
                                    // x:170;y:340;
                                    text : " Start"
                                    onClicked:{
                                        timersecondcount.start()
                                        // minutecount.start()
                                    }
                                }
                            }

                            Rectangle{
                                x:250;y:350;
                                width:100;height:50;
                                color:"#1BA1E2";
                                id:stoptimerenclosure;
                                border.width: 1;
                                border.color:"black"

                                Button {
                                    id: stoptimerbutton;
                                    // x:170;y:340;
                                    text : " Stop"
                                    onClicked:{
                                        timersecondcount.stop()
                                        // minutecount.start()
                                    }
                                }

                            }

                            Rectangle{
                                x:420
                                y:350;
                                width:100;height:50;
                                color:"#1BA1E2";
                                id:resettimerbuttonenclosure;
                                border.width: 1;
                                border.color:"black"

                                Button {
                                    id: resettimerbutton;
                                    // x:170;y:340;
                                    text : "Reset"
                                    onClicked:{
                                        timersecondcount.stop()
                                        timerhours.text="0";
                                        timerminutes.text="0";
                                        timerseconds.text="0";
                                        // minutecount.start()
                                    }
                                }

                            }





                        }
                    }

                    //Daily
                    Rectangle{
                        id: dailywindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false
                        Text{text:"May 1-7, 2013";font.pointSize: 25;color:"black";
                            font.family:"Segoe WP Light";anchors.horizontalCenter:parent.horizontalCenter }
                        Column{
                            spacing:20;

                            Row{spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true; text:"";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true; text:"Mon 1";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true;text:"Tue 2";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true;text:"Wed 3";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true;text:"Thu 4";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true;text:"Fri 5";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:18;font.pointSize: 14;font.bold: true;text:"Sat 6";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                                Rectangle{Text{x:24;font.pointSize: 14;font.bold: true;text:"Sun 7";color:"white"}x:90;y:80;width:90;height:35;color:"gray";}
                            }

                            Row{
                                spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{x:90;y:80;width:90;height:35;color:"gray";
                                    Text{text:"9:00 am";color:"white";anchors.centerIn: parent
                                        font.pointSize: 12;     }
                                }

                                Rectangle{x:90;y:80;width:90;height:35;color:"#1BA1E2"

                                    Flickable {
                                        id: flickArea
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:"Meet Tim"
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:" "
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}



                            }

                            Row{
                                spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{x:90;y:80;width:90;height:35;color:"gray";
                                    Text{text:"10:00 am";color:"white";anchors.centerIn: parent
                                        font.pointSize: 12;     }
                                }

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:" "
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}



                            }

                            Row{
                                spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{x:90;y:80;width:90;height:35;color:"gray";
                                    Text{text:"11:00 am";color:"white";anchors.centerIn: parent
                                        font.pointSize: 12;     }
                                }

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:" "
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}



                            }

                            Row{
                                spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{x:90;y:80;width:90;height:35;color:"gray";
                                    Text{text:"12:00 pm";color:"white";anchors.centerIn: parent
                                        font.pointSize: 12;     }
                                }

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"#1BA1E2"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:" Lecture "
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}



                            }
                            Row{
                                spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{x:90;y:80;width:90;height:35;color:"gray";
                                    Text{text:"12:00 pm";color:"white";anchors.centerIn: parent
                                        font.pointSize: 12;     }
                                }

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:"  "
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}



                            }
                            Row{
                                spacing:10;
                                Text{text:" "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Text{text: " "}
                                Rectangle{x:90;y:80;width:90;height:35;color:"gray";
                                    Text{text:"1:00 pm";color:"white";anchors.centerIn: parent
                                        font.pointSize: 12;     }
                                }

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:"  "
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}

                                Rectangle{x:90;y:80;width:90;height:35;color:"#1BA1E2"

                                    Flickable {

                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:"Work"
                                        }}}


                                Rectangle{x:90;y:80;width:90;height:35;color:"gray"

                                    Flickable {
                                        anchors.fill: parent
                                        contentWidth: parent.width; contentHeight: parent.height
                                        flickableDirection: Flickable.HorizontalAndVerticalFlick
                                        clip: true

                                        TextInput{
                                            wrapMode: TextInput.Wrap
                                            width:90;
                                            anchors.centerIn: parent
                                            color:"white";font.pointSize: 16;
                                            text:""
                                        }}}



                            }
                        }

                    }

                    //Weekly
                    /*Rectangle {
                  id: weeklywindow
                  x: 240
                  y: 110
                  width: 960
                  height: 480
                  color: "white"
                  border.color: "white"
                  visible: false
              }*/
                    Rectangle {
                        id: familyeventswindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false
                        Image{id:familyimage;width:960;height:480;source:"pictures/family.png"}
                    }
                }

                /*********SETTINGS***************/
                Rectangle{
                    id:settingsfeaturewindow
                    width: 1200; height: 660
                    x: 180; y:210;
                    visible: false

                    Rectangle{
                        id:titlelines
                        width: 984; height: 4
                        x: 40; y: 90; z:1
                        color: "#0070F0"
                    }

                    Rectangle{
                        id:sidebars
                        width: 240; height: 660
                        color: "#7CD0EB"

                        Text {
                            id: featureTitles
                            x: 30
                            color: "black"
                            font.pointSize : 60
                            font.family: "Segoe UI Symbol"
                            text: "Settings"
                        }

                        Column{
                            id: sidelanes
                            x:0; y:140
                            spacing:2

                            SideButton {
                                id: skins
                                downProperty : 1
                                text: "Skins"

                                onClicked: {
                                    downProperty = 1
                                    languages.downProperty = 2
                                    account.downProperty = 2
                                    help.downProperty = 2
                                    skinsWindow.visible = true
                                    languagesWindow.visible = false
                                    if(downProperty==1) buttonseparator1s.visible = false
                                    buttonseparator2s.visible = true
                                    buttonseparator3s.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator1s
                                x:10
                                width: 200; height: 1
                                color: "#000000"
                                visible: false
                            }

                            SideButton {
                                id: languages
                                downProperty: 2
                                text: "Languages"

                                onClicked: {
                                    downProperty = 1
                                    skins.downProperty = 2
                                    account.downProperty = 2
                                    help.downProperty = 2
                                    skinsWindow.visible = false
                                    languagesWindow.visible = true
                                    accountWindow.visible=false;
                                    helpWindow.visible=false;
                                    if(downProperty==1) { buttonseparator1s.visible = false; buttonseparator2s.visible = false; }
                                    buttonseparator3s.visible = true
                                }
                            }

                            Rectangle{
                                id:buttonseparator2s
                                width: 200; height: 1
                                x:10
                                color: "#000000"
                            }

                            SideButton {
                                id: account
                                downProperty: 2
                                text: "Accounts"

                                onClicked: {
                                    downProperty = 1
                                    skins.downProperty = 2
                                    languages.downProperty = 2
                                    account.downProperty = 2
                                    skinsWindow.visible = false
                                    languagesWindow.visible = false
                                    helpWindow.visible=false;
                                    accountWindow.visible=true;
                                    if(downProperty==1) { buttonseparator2s.visible = false; buttonseparator3s.visible = false; }
                                    buttonseparator1s.visible = true
                                }
                            }

                            Rectangle{
                                id: buttonseparator3s
                                width: 200
                                height: 1
                                x: 10
                                color: "#000000"
                            }

                            SideButton {
                                id: help
                                downProperty: 2
                                text: "Help"

                                onClicked: {
                                    downProperty = 1
                                    skins.downProperty = 2
                                    languages.downProperty = 2
                                    account.downProperty = 2
                                    skinsWindow.visible = false
                                    languagesWindow.visible = false
                                    accountWindow.visible=false
                                    helpWindow.visible=true
                                    if(downProperty==1)  buttonseparator3s.visible = false
                                    buttonseparator1s.visible = true
                                    buttonseparator2s.visible = true
                                }
                            }

                        }
                    }
                    //The bottom blue bar with icons
                    Rectangle {
                        id: bottomBars
                        color: "#C1DCFF"
                        width: 960
                        height: 66
                        x:240; y:594

                        Image{
                            id:helpicons
                            source: "pictures/help.gif"
                            x:900; y:5
                        }
                    }

                    //skins
                    Rectangle{
                        id: skinsWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: true
                        Image{x:150;y:50;width:250;height:400;id:color1;source:"pictures/blue.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    toppanel.color="#1BA1E2";
                                    sidepanel.color="#7CD0EB";
                                    bttmpanel.color="#C1DCFF";
                                }
                            }
                        }
                        Image{x:525;y:50;width:250;height:400;id:color2;source:"pictures/purple.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    toppanel.color="#76608A";
                                    sidepanel.color="#647687";
                                    bttmpanel.color="#6D8764";
                                }
                            }


                        }

                    }

                    //languages
                    Rectangle{
                        id: languagesWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false


                        Image{id:eng1;x:50;y:25;width:200;height:50;source:"pictures/eng1.png";
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    Variables.flag = 0;
                                    skins.text="Skins";languages.text="Languages";
                                    account.text="Account";help.text="Help";
                                    featureTitles.text="Settings";eng1.source="pictures/eng1.png";fre.source="pictures/french.png"
                                    mq.text = "Pick up Kids - Cook Pizza - Pay Comed Bill - Pay Rent - Eliza's Birthday Tomorrow - Pay Gas Bill - Dental Appointment 15th - Call Plumber"
                                    traffpred.text = "Light Traffic";
                                }
                            }


                        }
                        Image{id:fre;x:300;y:25;width:200;height:50;source:"pictures/french.png";
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    Variables.flag = 1;
                                    skins.text="Peaux";languages.text="Langues";
                                    account.text="Comptabilité";help.text="Aide";fre.source="pictures/french2.png"
                                    featureTitles.text="Réglages";eng1.source="pictures/eng2.png"
                                    mq.text="Ramasser les enfants - cuire la pizza - Payer Comed projet de loi - payer le loyer - L'anniversaire est demain Eliza - Payer la facture de gaz - 15ème rendez-vous dentaire - appelez Plombier"
                                    traffpred.text = "Moins Trafic";
                                }
                            }
                        }

                        Image{x:50;y:125;width:200;height:50;source:"pictures/uk.png";}
                        Image{x:300;y:125;width:200;height:50;source:"pictures/china.png";}

                        Image{x:50;y:225;width:200;height:50;source:"pictures/lang.png";}
                        Image{x:300;y:225;width:200;height:50;source:"pictures/deutsch.png";}

                        Image{x:50;y:325;width:200;height:50;source:"pictures/espanol.png";}
                        Image{x:300;y:325;width:200;height:50;source:"pictures/italiano.png";}

                        Image{x:50;y:425;width:200;height:50;source:"pictures/hindi.png";}
                        Image{x:300;y:425;width:200;height:50;source:"pictures/netherlands.png";}


                    }

                    //Account
                    Rectangle{
                        id: accountWindow;x: 240;y: 110
                        width: 960;height: 480
                        color: "white";border.color: "white"
                        visible: false;

                        Text{text:"Hi Diana, Please enter your password";font.italic:true;font.pointSize: 25;
                            font.family:"Segoe WP Light";
                            anchors.horizontalCenter:parent.horizontalCenter
                        }
                        Image{x:80;y:50;width:800;height:400;source:"pictures/settings1.png"}

                    }
                    //help
                    Rectangle {
                        id: helpWindow
                        x: 240
                        y: 110
                        width: 960
                        height: 480
                        color: "white"
                        border.color: "white"
                        visible: false

                        Image{x:80;y:50;width:800;height:400;source:"pictures/helpss.png"}
                    }
                }


                Item{
                    x:450; y:240;

                    Image{
                        id: maincircle
                        source: "pictures/ball1.gif"
                        visible: true

                        Image{
                            id: cookingicon
                            source: "pictures/food.ico"
                            width: 180; height:180;
                            fillMode: Image.PreserveAspectFit
                            x:220; y:20;

                            MouseArea{
                                id:cookingbutton
                                anchors.fill: parent
                                onClicked: {
                                    //   cookingicon.source = "pictures/food - pressed.jpg"
                                    maincircle.visible = false;
                                    cookingfeaturewindow.visible = true;
                                    blacktrans.visible = true;
                                }
                            }

                        }

                        Image{
                            id: listicon
                            source: "pictures/list.png"
                            x:420; y:170;
                            width: 170; height:180;
                            fillMode: Image.PreserveAspectFit

                            MouseArea{
                                id:listsbutton
                                anchors.fill: parent
                                onClicked: {
                                    maincircle.visible = false;
                                    listsfeaturewindow.visible = true;
                                    blacktrans.visible = true;
                                }
                            }
                        }

                        Image{
                            id: orgicon
                            source: "pictures/organiser.gif"
                            x:300; y:400;
                            width: 270; height:150;
                            fillMode: Image.PreserveAspectFit

                            MouseArea{
                                id: organizerbutton
                                anchors.fill: parent
                                onClicked: {
                                    maincircle.visible = false;
                                    organizerfeaturewindow.visible = true;
                                    blacktrans.visible = true;
                                }
                            }

                        }

                        Image{
                            id: homesyncicon
                            source: "pictures/homesync.gif"
                            x:100; y:365;
                            width: 170; height:180;
                            fillMode: Image.PreserveAspectFit
                            MouseArea{
                                id: homesyncbutton
                                anchors.fill: parent
                                onClicked: {
                                    maincircle.visible = false;
                                    homesyncwindow.visible = true;
                                    blacktrans.visible = true;
                                }
                            }
                        }

                        Image{
                            id: kidsicon
                            source: "pictures/kids_icon.png"
                            x:40; y:170;
                            width: 170; height:180;
                            fillMode: Image.PreserveAspectFit
                            MouseArea{
                                id:kidsbutton
                                anchors.fill: parent
                                onClicked: {
                                    maincircle.visible = false;
                                    kidssectionwindow.visible = true;
                                    blacktrans.visible = true;
                                }
                            }
                        }

                    }



                }


            }

        }
        Component.onCompleted: {
            var views = viewsContainer.children;
            var view;
            for(var i = 0; i < views.length; i++) {
                view = views[i]
                view.visible = false;
                console.log(i)
            }
            views[0].visible = true;
            console.log(views[0].color)
        }

    }
}
