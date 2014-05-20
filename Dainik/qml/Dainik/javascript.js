// Globals
var apiKey = "f38312530d213810130102";
var localTime = new Date();
var success = false;
var currentError = -1;
var currentForeignWeathercode = -1;
var currentForecastWeatherCode = -1;


// TRANSLATION SUPPORT ////////////////////////////////////////////
var english = ["Indoor", "Temperature" ,"City/Zip", "Search", "Humidity", "Feels Like", "Today's Forecast"
               , "Max", "Min", "Precipitation", "Wind", "Current Condions", "Cloud Cover"
               , "Tonight's Forecast", "Language", "Units", "Standard", "Metric", "Please search above"
               , "Unable to find any matching weather location to the query submitted!"
               , "Are you connected?"];
var lithuanian = ["Vidinis", "temperatūra", "Miestas", "Ieškoti", "Drėgmė", "Saltas", "Siandien Prognozė"
                  , "Maks", "Min", "Krituliai", "Vėjas", "Dabartinės Sąlygos", "Debesuotumas"
                  , "Vakaro Prognozė", "Kalba", "Vienetai", "Standartas", "Metrinis", "Prašome paiešką aukščiau"
                  , "Nepavyko rasti bet tinkančių orų vietą į pateiktą užklausą!"
                  , "Jums prijungti?"];
// English alerts are at even indices, odd indices contain lithuanian alerts
var alerts = ["No alerts...yet", "Nėra įspėjimų ... dar"
              , "A cold weather advisory is in place", "Šaltas oras patariamoji yra"
              , "A hot weather advisory is in place", "Karštas oras patariamoji yra"
              , "A wind advisory is in place", "Vėjo patariamoji yra vieta"
              , "A flood warning is in effect", "A flood warning is in effect"
              , "This is a sample weather alert! There are actual weather alerts calculated " +
                "from the weather stats..."
              , "Tai pavyzdys oras perspėjimas!Yra Aktualaus oro perspėjimų, apskaičiuotos nuo " +
               " aplinkos oro sąlygų statistika ..."];

// English weather descriptions
var englishWeatherDescriptions =
        ["Clear/Sunny", "Partly Cloudy", "Cloudy", "Overcast", "Mist", "Patchy Rain"
      , "Patchy Snow", "Patchy Sleet", "Patchy Freezing Drizzle", "Thundery Outbreaks"
      , "Blowing Snow", "Blizzard", "Fog", "Freezing Fog", "Patchy Light Drizzle"
      , "Light Drizzle", "Freezing Drizzle", "Heavy Freezing Drizzle", "Patchy Light Rain"
      , "Light Rain", "Moderate Rain", "Heavy Rain", "Light Freezing Rain"
      , "Moderate Freezing Rain", "Light Sleet", "Moderate Sleet", "Patchy Light Snow"
      , "Light Snow", "Patchy Moderate Snow", "Moderate Snow", "Patchy Heavy Snow"
      , "Heavy Snow", "Ice Pellets", "Light Rain Shower", "Moderate Rain Shower"
      , "Torrential Rain Shower", "Light Sleet Showers", "Moderate Sleet Showers"
                                  , "Light Snow Showers", "Moderate Snow Showers"];
// Lithanian Weather Descriptions
var lithuanianWeatherDescriptions =
        ["Skaidrus/Saulėta", "Debesuota pragiedruliais", "Drumstas", "Tamsus", "Rūkas", "Fragmentiškas Lietus"
         , "Fragmentiškas Sniego", "fragmentiškas Šlapdriba", "Fragmentiškas Lijundra", "Audros protrūkiai"
         , "JUDĖKITE", "pūga", "rūkas", "Rūkas ir plikšala", "Fragmentiškas Silpna dulksna"
         , "Silpna dulksna", "Lijundra", "Sunkusis Lijundra", "Fragmentiškas lietus"
         , "nedidelis lietus", "Šiek tiek palis", "smarkus lietus", "Lietus ir plikšala"
         , "Lietus ir plikšala", "šviesos Šlapdriba", "sunkumo Šlapdriba", "Fragmentiškas nedidelis"
         , "Truputį pasnigs", "Fragmentiškas Saikingas", "vidutinio Sniego", "Fragmentiškas Smarkus"
         , "Smarkus sniegas", "Ledukai", "Šviesos lietaus dušo", "Vidutinis lietaus dušo"
         , "Liūčių Dušo", "lietus ir sniegas", "Šlapdriba Dušos"
         , "Šviesos trumpai pasnigs", "Vidutinio trumpai pasnigs"];

// Set alert(s)
function setAlert() {
    // First determine language and use it as an offset in the alert array
    var offset = listView.currentIndex;
    if(offset > 1) return;   // Other languages are not in place
    // If the user hasn't found a city
    if(!success) {
        alert.visible = false;
        noAlertText.visible = true;
        noAlertText.text = alerts[0 + offset];
    }
    else {
        noAlertText.visible = false;
        alert.visible = true;
        alert.text = alerts[calcAlert() + offset];
    }
}

// This function runs through current conditions and calculates an alert
function calcAlert() {
    var lowerTempBoundary = 15;
    var upperTempBoundary = 90;
    var windBoundary = 20;
    var precipBoundary = .5
    // Do a check on the current measurements
    if(tempListView.currentIndex === 1) {
        lowerTempBoundary = fHToCelcius(lowerTempBoundary);
        upperTempBoundary = fHToCelcius(upperTempBoundary);
    }
    if(measurementsListView.currentIndex === 1) {
        windBoundary = milesTokm(windBoundary);
        precipBoundary = inchesTomm(precipBoundary);
    }
    if(parseInt(outdoorTemp.text) < lowerTempBoundary) return 2;
    if(parseInt(outdoorTemp.text) > upperTempBoundary) return 4;
    if(parseInt(currentWind.text.split(" ")[1]) > windBoundary) return 6;
    if(parseFloat(outdoorPrecipitation.text) > precipBoundary) return 8;
    return 10;
}

// Set the language of the interface
function setLanguage(locale) {
    if(locale === "en") {    // If english
        setLanguageFromArray(english);
    }
    else if(locale === "lt"){ // if lithuanian
        setLanguageFromArray(lithuanian);
    }
    setWeatherDesc();
}

// Sets the language with the array passed
function setLanguageFromArray(lang) {
    indoorTitle.text = lang[0];
    cityZipText.text = lang[2] + ":";
    serachButton.text = lang[3];
    indoorHumidityTitle.text = lang[4] + ":";
    outdoorHumidityTitle.text = lang[4] + ":";
    feelsLikeText.text = lang[5] + ":";
    forecastText.text = lang[6] + ":";
    maxText.text = lang[7];
    minText.text = lang[8] + ":";
    precipitationText.text = lang[9] + ":";
    outdoorPrecipitationTitle.text = lang[9] + ":";
    windText.text = lang[10] + ":";
    currentWindTitle.text = lang[10] + ":";
    currentConditionText.text = lang[11];
    cloudCoverTitle.text = lang[12] + ":"
    languageText.text = lang[14];
    unitSettingsText.text = lang[15];
    helpMessageTitle.text = lang[18];
    if(currentError !== -1)
        errorMessage.text = lang[currentError] + "";
    if(isDay())
        forecastText.text = lang[6] + ":";
    else forecastText.text = lang[13] + ":";
}

// This function sets the weather description according to the current language
function setWeatherDesc() {
    var i = mapCodeToWeatherArray(currentForeignWeathercode);
    var j = mapCodeToWeatherArray(currentForecastWeatherCode);
    if(i < 0 || j < 0) return;
    if(listView.currentIndex === 0) {
        weatherDescription.text = englishWeatherDescriptions[i];
        todaysForecast.text = englishWeatherDescriptions[j];
    }
    else {
        weatherDescription.text = lithuanianWeatherDescriptions[i];
        todaysForecast.text = lithuanianWeatherDescriptions[j];
    }
}

// Function that searches for weather data, calls function to load the UI on success
function search(input) {
    showLoadScreen();
    citySearch(input);
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
       if (doc.readyState === XMLHttpRequest.DONE) {
           try {
               var jsonObject = JSON.parse(doc.responseText);
               if(typeof jsonObject.data.error != 'undefined')
                   failureHandler(19);  // There was an error
               else successHandler(jsonObject);  // Success!
           }
           catch(e) {
               console.log(e);
               failureHandler(20);
           }
        }
    }
    // Open the doc and send it
    var URL = "http://free.worldweatheronline.com/feed/weather.ashx?q=" + input
            + "&format=json&num_of_days=2&key=" + apiKey + "&extra=localObsTime";
    doc.open("GET", URL);
    doc.send();
}

// This function resolves the name of the city
function citySearch(input)
{
    var replaced = input + "";
    replaced = replaced.replace(" ", "+");
    replaced = replaced.replace(",", "");
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if(doc.readyState === XMLHttpRequest.DONE) {
            var jsonObject = eval('(' + doc.responseText + ')');
            outdoorTitle.text = jsonObject.search_api.result[0].areaName[0].value;
        }
    }
    doc.open("GET", "http://www.worldweatheronline.com/feed/search.ashx?q=" + replaced
             + "&format=json&num_of_results=1&key=" + apiKey);
    doc.send();
}

// Function to show the loading screen
function showLoadScreen()
{
    outdoorInfo.visible = false;
    helpscreen.visible = false;
    loadScreen.visible = true;
    errorMessage.text = "";
}

// Function to hide the loading screen and show the weather data
function showWeatherData()
{
    helpscreen.visible = false;
    loadScreen.visible = false;
    outdoorInfo.visible = true;
}

// Function to load the simple help screen
function showHelpScreen()
{
    outdoorInfo.visible = false;
    loadScreen.visible = false;
    helpscreen.visible = true;
}

// Handles a successful weather data query
function successHandler(jsonOjbect)
{
    // Save the local time
    localTime = new Date(jsonOjbect.data.current_condition[0].localObsDateTime);
    success = true;
    // Load the UI with the information from the request
    loadUI(jsonOjbect);
    showWeatherData(); // Call the function to make the weather data visible
}

// Handles an unsuccessful weather data query
// Needs to hide the load screen and display the "help" screen
function failureHandler(error)
{
    success = false;
    localTime = null;
    if(listView.currentIndex === 0)
        errorMessage.text = english[error];
    else errorMessage.text = lithuanian[error];
    currentError = error;
    showHelpScreen();
}

// Function that loads the UI with weather info
function loadUI(jsonObject)
{
    // Get the wind speed and temp to calculate the wind chill
    // Set in Celcius, kilometers, meters, milimeters
    var currentWindSpeed = parseInt(jsonObject.data.current_condition[0].windspeedKmph);
    var temp = parseInt(jsonObject.data.current_condition[0].temp_C);
    var precip = parseFloat(jsonObject.data.current_condition[0].precipMM);
    var forecastWindSpeed = parseInt(jsonObject.data.weather[0].windspeedKmph);
    var maxTemperature = parseInt(jsonObject.data.weather[0].tempMaxC);
    var mintemperature = parseInt(jsonObject.data.weather[0].tempMinC);
    var forecastPrecip = jsonObject.data.weather[0].precipMM;

    // Wind chill is calculated in FH
    var windChill = calculateWindChill(kmToMiles(currentWindSpeed), celciusToFH(temp));
    // degree population in the GUI
    if(tempListView.currentIndex === 0)
    {
        outdoorTemp.text = celciusToFH(temp) + "°";
        feelsLikeTemp.text = windChill + "°";
        maxTemp.text = celciusToFH(maxTemperature) + "°";
        minTemp.text = "/" + celciusToFH(mintemperature) + "°";
    }
    else
    {
        outdoorTemp.text = temp + "°";
        feelsLikeTemp.text = fHToCelcius(windChill) + "°";
        maxTemp.text = maxTemperature + "°";
        minTemp.text = "/" + mintemperature + "°";
    }
    if(measurementsListView.currentIndex === 0)
    {
        outdoorPrecipitation.text = mmToInches(precip) + " in";
        precipitation.text = mmToInches(forecastPrecip) + " in";
        wind.text = jsonObject.data.weather[0].winddirection + " "
                + kmToMiles(forecastWindSpeed) + " mph";
        currentWind.text = jsonObject.data.current_condition[0].winddir16Point + " "
                + kmToMiles(currentWindSpeed) + " mph";
    }
    else
    {
        outdoorPrecipitation.text = precip + " mm";
        precipitation.text = forecastPrecip + " mm";
        wind.text = jsonObject.data.weather[0].winddirection + " "
                + forecastWindSpeed + " kmph";
        currentWind.text = jsonObject.data.current_condition[0].winddir16Point + " "
                + currentWindSpeed + " kmph";
    }
    // Obtain and save the weather code in case there is a language change
    var weathercode = parseInt(jsonObject.data.current_condition[0].weatherCode, 10);
    var fWeatherCode = parseInt(jsonObject.data.weather[0].weatherCode, 10);
    currentForeignWeathercode = weathercode;
    currentForecastWeatherCode = fWeatherCode;
    weatherIcon.source = getWeatherIconString(weathercode);
    outdoorHumidity.text = jsonObject.data.current_condition[0].humidity + "%";
    cloudCoverPerc.text = jsonObject.data.current_condition[0].cloudcover + "%";
    foreceastIcon.source = getWeatherIconString(fWeatherCode);

    // Set the weather description text
    //weatherDescription.text = jsonObject.data.current_condition[0].weatherDesc[0].value;
    //todaysForecast.text = jsonObject.data.weather[0].weatherDesc[0].value;
    setWeatherDesc();
}

// Function to set all measurements to either standard or metric
function reloadMeasurements()
{
    if(!loaded) return;  // Return if the UI isn't loaded yet
    var precip = parseFloat(precipitation.text);
    var currentPrecip = parseFloat(outdoorPrecipitation.text);
    var currentWindSpeed = parseInt(currentWind.text.split(" ")[1]);
    var currentWindDir = currentWind.text.split(" ")[0];
    var forecastWindSpeed = parseInt(wind.text.split(" ")[1]);
    var forecastWindDir = wind.text.split(" ")[0];
    if(measurementsListView.currentIndex === 0)
    {
        outdoorPrecipitation.text = mmToInches(currentPrecip) + " in";
        precipitation.text = mmToInches(precip) + " in";
        currentWind.text = currentWindDir + " " + kmToMiles(currentWindSpeed) + " mph";
        wind.text = forecastWindDir + " " + kmToMiles(forecastWindSpeed) + " mph";
    }
    else
    {
        outdoorPrecipitation.text = inchesTomm(currentPrecip) + " mm";
        precipitation.text = inchesTomm(precip) + " mm";
        currentWind.text = currentWindDir + " " + milesTokm(currentWindSpeed) + " kmph";
        wind.text = forecastWindDir + " " + milesTokm(forecastWindSpeed) + " kmph";
    }
}

// Function to reload the degrees (C or FH)
function reloadDegrees()
{
    if(!loaded) return;  // Return if the UI isn't loaded yet
    if(tempListView.currentIndex === 0)
    {
        indoorTemp.text = celciusToFH(parseInt(indoorTemp.text));
        outdoorTemp.text = celciusToFH(parseInt(outdoorTemp.text)) + "°";
        feelsLikeTemp.text = celciusToFH(parseInt(feelsLikeTemp.text)) + "°";
        maxTemp.text = celciusToFH(parseInt(maxTemp.text)) + "°";
        minTemp.text = "/" + celciusToFH(parseInt(minTemp.text.substring(1, minTemp.text.length - 1))) + "°";
    }
    else
    {
        indoorTemp.text = fHToCelcius(parseInt(indoorTemp.text));
        outdoorTemp.text = fHToCelcius(parseInt(outdoorTemp.text)) + "°";
        feelsLikeTemp.text = fHToCelcius(parseInt(feelsLikeTemp.text)) + "°";
        maxTemp.text = fHToCelcius(parseInt(maxTemp.text)) + "°";
        minTemp.text = "/" + fHToCelcius(parseInt(minTemp.text.substring(1, minTemp.text.length - 1))) + "°";
    }
}

// Convert Celcius to FH
function celciusToFH(celcius)
{
    return Math.round(((9/5)*celcius + 32));
}

// Convert FH to Celcius
function fHToCelcius(FH)
{
    return Math.round(((5/9)*(FH - 32)));
}

// Convert mm to inches to two decimals
function mmToInches(mm)
{
    return Math.round((mm * 0.039370)*100) / 100;
}

// Convert inches to mm to two decimals
function inchesTomm(inches)
{
    return Math.round((inches / 0.039370)*100) / 100;
}

// Convert km to miles
function kmToMiles(km)
{
    return Math.round(km * 0.62137);
}

// Convert miles to km
function milesTokm(miles)
{
    return Math.round(miles / 0.62137);
}

// For getting the weather icon
function getWeatherIconString(code)
{
    var goodCode = mapBadAPICodesToGoodOnes(code);
    if(goodCode !== -1)
    {
        var pad = "";
        if(goodCode < 10)   // Need to pad with two digits
            pad = "0";
        return iconPath + pad + goodCode + ".png";
    }
    else return iconPath + "25.png";
}

// Determine if it is night or day from the current time
function isDay()
{
    if(localTime.getHours() < 18)  // We'll say for now it gets dark around 6 PM
        return true;
    else return false;
}

function doIt() {
    //console.log(calculateWindChill(9, 39));
}

// Function to calculate the wind chill
// Inputs: V = Wind Speed (MPH)
//         T = Temperature (F)
// Returns the wind chill
function calculateWindChill(V, T)
{
    if(V < 1) V = 1;
    return Math.round(35.74 + (0.6215*T) - (35.75*Math.pow(V, 0.16)) + (0.4275*T*Math.pow(V, 0.16)));
}

// For mapping the World Weather Online weather codes to normal weather codes!
function mapBadAPICodesToGoodOnes(code)
{
    switch(code)
    {
    case 395: return 43;
    case 392: return 42;
    case 389: return 40;
    case 377: return 17;
    case 374: return 17;
    case 371: return 43;
    case 368: return 14;
    case 365: return 06;
    case 362: return 06;
    case 359: return 12;
    case 356: return 12;
    case 353: return 11;
    case 350: return 17;
    case 338: return 43;
    case 335: return 42;
    case 332: return 16;
    case 329: return 42;
    case 326: return 14;
    case 323: return 14;
    case 320: return 18;
    case 317: return 18;
    case 314: return 10;
    case 311: return 10;
    case 308: return 12;
    case 305: return 12;
    case 302: return 12;
    case 299: return 11;
    case 296: return 11;
    case 293: return 11;
    case 284: return 08;
    case 281: return 08;
    case 266: return 09;
    case 263: return 09;
    case 230: return 15;
    case 227: return 15;
    case 200: return 35;
    case 185: return 08;
    case 182: return 06;
    case 179: return 14;
    case 176: return 40;
    case 143: return 20;
    case 122: return 26;
    case 260: if(isDay()) return 22; else return 21;
    case 248: if(isDay()) return 22; else return 21;
    case 119: if(isDay()) return 28; else return 27;
    case 116: if(isDay()) return 30; else return 29;
    case 113: if(isDay()) return 32; else return 31;
    default: return -1;
    }
}

// Maps the current weather code to the weather descriptions index
function mapCodeToWeatherArray(code) {
    switch(code) {
    case 113: return 0;
    case 116: return 1;
    case 119: return 2;
    case 122: return 3;
    case 143: return 4;
    case 176: return 5;
    case 179: return 6;
    case 182: return 7;
    case 185: return 8;
    case 200: return 9;
    case 227: return 10;
    case 230: return 11;
    case 248: return 12;
    case 260: return 13;
    case 263: return 14;
    case 266: return 15;
    case 281: return 16;
    case 284: return 17;
    case 293: return 18;
    case 296: return 19;
    case 299: return 20;
    case 302: return 20;
    case 305: return 21;
    case 308: return 21;
    case 311: return 22;
    case 314: return 23;
    case 317: return 24;
    case 320: return 25;
    case 323: return 26;
    case 326: return 27;
    case 329: return 28;
    case 332: return 29;
    case 335: return 30;
    case 338: return 31;
    case 350: return 32;
    case 353: return 33;
    case 356: return 34;
    case 359: return 35;
    case 362: return 36;
    case 365: return 37;
    case 368: return 38;
    case 371: return 39;
    case 374: return 32;
    case 377: return 32;
    case 386: return 18;
    case 389: return 20;
    case 392: return 31;
    default: return -1;
    }
}
