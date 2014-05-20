//Put titles of features(flag based on which is clicked) and the colors in this for skins.
var featureTitlew = "Weather";
var featureTitlec = "Cooking";
var featureTitlel = "Lists";
var featureTitlep = "Gallery";
var featureTitlek= "Kids";
var featureTitleh = "Home Sync";
var featureTitlet = "Traffic";
var featureTitlem = "Music";
var featureTitleo = "Organizer";
var langFlag = 0;

var tditemcount = 0;
var delitemid = "dddd";
var trplacescount = 0;


//Store the list of URLs for Browser
var urlList = [];
//Store the count for the list of URLs
var count = 0;
var currIndex = 0;

//Browser Functions
function addURL(url)
{
    urlList.push(browserActual.url);
    count=count+1;
    currIndex = count-1;
    console.log("URL is"+urlList);
    console.log("Count is "+count);
    console.log("Current Index is "+currIndex);
    urlEnter.text = browserActual.url;
    console.log("Actual URL "+browserActual.url);
  //  checkFav(urlEnter.text);
}

function backURL()
{
    currIndex=currIndex-1;
    if(currIndex < 0)
    {
        back.source = "./pictures/backgray.gif"
    }
    else
    {
        if(currIndex < count)
        {
            front.source = "./pictures/fwd.jpg"
        }
        console.log("Current Index dec "+currIndex);
        var backURL = urlList[currIndex];
        console.log("Current URL is "+urlList[currIndex]);
        urlEnter.text = backURL;
        back.source = "./pictures/bwd.jpg"
    }
}
function fwdURL()
{
    currIndex = currIndex+1;
    if(currIndex > count)
    {
        front.source = "./pictures/fwdgray.gif"
    }
    else
    {
        if(currIndex > 0)
        {
            back.source = "./pictures/bwd.jpg";
        }
        var fwdURL = urlList[currIndex];
        urlEnter.text = fwdURL;
        front.source = "./pictures/fwd.jpg";
    }
}
function goBrowserHome()
{
    urlEnter.text = "http://www.google.com/"
}

function reloadPage()
{
    var currPage = urlList[currIndex];
    urlEnter.text = currPage;
}

var browseFav = [];
function addToFav()
{
    browseFav.push(browserActual.url);

}

var favList = [];

function addToFav(urlText)
{
    favList.push(urlText);
    console.log("Fav "+favList);
}

function removeFromFav(urlText)
{
    if(favList.indexOf(urlText) != -1)
    {
        var index = favList.indexOf(urlText);
        favList.splice(index,1);
    }
    console.log(favList);
}

function unique(a){
    a.sort();
    for(var i = 1; i < a.length; ){
        if(a[i-1] == a[i]){
            a.splice(i, 1);
        } else {
            i++;
        }
    }
    return a;
}

function displayFav()
{
    favLists.text=" ";
    var uniqueFav=[];
    uniqueFav = unique(favList);

    for(var i=0;i<uniqueFav.length;i++)
    {
        favLists.text += "\n" + uniqueFav[i];
    }

}


var americanRecipes = [];
americanRecipes.push("Baked Beans");
americanRecipes.push("Roasted California Fennel");
americanRecipes.push("Rosemary Corn Bread");
americanRecipes.push("Classic Deviled Eggs");
americanRecipes.push("Acorn Squash with Chard & White Beans");

function displayAmericanRecipes()
{

    for(var i=0;i<americanRecipes.length;i++)
    {
        recipeLists.text += "\n\n" + americanRecipes[i];
    }
}

/*var picList = [];
var picIndex = 0;
var picsrc;
function playSlideShow()
{
    console.log("Hi in playSlideShow");
    for(var i= 1;i<12;i++)
    {
        picsrc = "./gallery/grandpa/"+i+".jpg";
        picList.push(picsrc);
    }

 /*   while (picIndex < 11) {
        console.log("Inside the while loop");
        console.log(picIndex);
    setTimeout(function(){
         console.log("Inside setTimeout");
         console.log(picIndex);
         slideShowFeature.source = picList[picIndex];
         }, 200);
    picIndex++;
   }
   /*
    }*/

   // var i=1;
   // picsrc ="./gallery/grandpa/"+i+".jpg";
 //   console.log(picsrc);
    //console.log(picList);
   /* slideShowFeature.source = picList[0];
    console.log("Hia");
    picIndex++;
    //pausecomp(7000);
    console.log("Heya");

    //pausecomp(1000);
   slideShowFeature.source = picList[picIndex];

    slideShowFeature.visible = true;
    for()
    slideShowFeature2.visible = true;

}

/*function setImg(){
    slideShowFeature.source = picsrc;
}

function pausecomp(millis)
{
var date = new Date();
var curDate = null;

do { curDate = new Date(); }
while(curDate-date < millis);
}
 */
/*
function checkFav(url)
{
    if(favList.length>0){
    var uniqueFav = unique(favList);
    for(var i=0;i<uniqueFav.length;i++)
    {
        if(uniqueFav[i] == url)
        {
            favAdd.visible = false;
            favAdded.visible = true;
        }
    }
}
*/
function startseconds(sec)
{
    sec++;
    if(sec==60){startminutes(sec,stopwatchminutes.text);sec=0;}
    stopwatchseconds.text= sec;
}
function startminutes(sec,min)
{
    if(sec==60){sec=0;min++;}
    if(min==60){starthours(stopwatchhours.text,min,sec);min=0;}
    stopwatchminutes.text= min;
}
function starthours(hrs,min,sec)
{
    if(min==60){hrs++;}
    print(hrs);
    stopwatchhours.text= hrs;
}

//timer functions
function starttimerseconds(sec)
{
    sec--;
    if(sec==0){starttimerminutes(sec,timerminutes.text);sec=60;}
    timerseconds.text= sec;
}
function starttimerminutes(sec,min)
{
    if(sec==0){sec=60;min--;}
    if(min==0){starttimerhours(timerhours.text,min,sec);min=60;}
    timerminutes.text= min;
}
function starttimerhours(hrs,min,sec)
{
    if(min==0){hrs--;}
    print(hrs);

    timerhours.text= hrs;
}

function getTime() {

    var datefull=new Date();
    var minutes=datefull.getMinutes();
    var hours=datefull.getHours();


    if(minutes<10)
        minutes="0"+minutes;
    if(hours==0)
        hours=12;
    if(hours>12)
    {
        hours=hours-12;
        maintime.text=hours+ ":"+minutes;
        ampm.text=" PM";
        maintimel.text=hours+ ":"+minutes;
        ampml.text=" PM";
    }
    else
    {
        maintime.text=hours+ ":"+minutes;
        ampm.text=" PM";
        maintimel.text=hours+ ":"+minutes;
        ampml.text="AM"
    }
}

function getDate1() {
    var datefull=new Date();
    var monthname=new Array;
    monthname[0]="Jan";
    monthname[1]="Feb";
    monthname[2]="Mar";
    monthname[3]="Apr";
    monthname[4]="May";
    monthname[5]="Jun";
    monthname[6]="Jul";
    monthname[7]="Aug";
    monthname[8]="Sep";
    monthname[9]="Oct";
    monthname[10]="Nov";
    monthname[11]="Dec";
    var month=monthname[datefull.getMonth()];
    var day=datefull.getDate();
    var week = Qt.formatDateTime( datefull, "dddd" );
    week = week.substring(0,3);
    maindate.text= week +", "+ month +" "+day;
    maindatel.text= week +", "+ month +" "+day;
}
