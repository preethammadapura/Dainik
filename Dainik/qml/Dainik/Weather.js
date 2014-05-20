var flipFlag;

function loadWeather1(jsonObject1){
    displayWeatherMini.text = jsonObject1.data.current_condition[0].temp_F;
}

function loadWeather(jsonObject) {

    degreeF.text = jsonObject.data.current_condition[0].temp_F;
    degreeC.text = jsonObject.data.current_condition[0].temp_C;

    if(flipFlag !== 1 || flipFlag !== 2)
    {
        degreeF.visible = true;
        degreeC.visible = false;
    }

    weatherDesc.text = jsonObject.data.current_condition[0].weatherDesc[0].value;
    var weatherCode = jsonObject.data.current_condition[0].weatherCode;

    windText.text = jsonObject.data.current_condition[0].windspeedMiles + ' mil/h';
    windText2.text = jsonObject.data.current_condition[0].winddir16Point;

    var revDate = jsonObject.data.current_condition[0].localObsDateTime;
    var dayOrNight = revDate.substring(17,19);
    console.log("day Night "+dayOrNight);
    var timeHours = revDate.substring(11,13);
    console.log("time Hours "+timeHours);
    getWeatherBg(weatherCode, timeHours, dayOrNight);
    console.log("background "+weatherBg.source);

    cloudText.text = jsonObject.data.current_condition[0].cloudcover + ' %';
    visiText.text = jsonObject.data.current_condition[0].visibility + ' miles';
    precipText.text = jsonObject.data.current_condition[0].precipMM + ' mm';
    pressureText.text = jsonObject.data.current_condition[0].pressure + ' mb';
    humidityText.text = jsonObject.data.current_condition[0].humidity + ' %';

    //Today's Predictions
    tempMinFToday = jsonObject.data.weather[0].tempMinF;
    tempMinCToday = jsonObject.data.weather[0].tempMinC;
    temp_min.text = tempMinFToday + '°F';

    tempMaxFToday = jsonObject.data.weather[0].tempMaxF;
    tempMaxCToday = jsonObject.data.weather[0].tempMaxC;
    temp_max.text = tempMaxFToday + '°F';

    precipToday = jsonObject.data.weather[0].precipMM;
    precip_today.text = precipToday + 'mm';

    predWindMT = jsonObject.data.weather[0].windspeedMiles;
    predWindKT = jsonObject.data.weather[0].windspeedKmph;
    wind_predict.text = predWindMT + ' miles/h';

    wCodeToday = jsonObject.data.weather[0].weatherCode;
    desc_predict.text = jsonObject.data.weather[0].weatherDesc[0].value;


    //Tomorrow's Predictions
    tempMinFTomo = jsonObject.data.weather[1].tempMinF;
    tempMinCTomo = jsonObject.data.weather[1].tempMinC;
    tomo_min.text = tempMinFTomo + '°F';

    tempMaxFTomo = jsonObject.data.weather[1].tempMaxF;
    tempMaxCTomo = jsonObject.data.weather[1].tempMaxC;
    tomo_max.text = tempMaxFTomo + '°F';

    precipTomo = jsonObject.data.weather[1].precipMM;
    precip_tomo.text = precipTomo + 'mm';

    predWindMTomo = jsonObject.data.weather[1].windspeedMiles;
    predWindKTomo = jsonObject.data.weather[1].windspeedKmph;
    wind_tomo.text = predWindMTomo + ' miles/h';

    wCodeTomo = jsonObject.data.weather[1].weatherCode;
    desc_tomo.text = jsonObject.data.weather[1].weatherDesc[0].value;


}

function getWeatherBg(weatherCode, timeHours, dayOrNight)
{
    if(((dayOrNight =='AM') && (timeHours >= 6 && timeHours <= 11)) ||
            ((dayOrNight == 'PM') && (timeHours == 12 || (timeHours >= 1 && timeHours <=5))))
    {
        //day icons

        if(weatherCode == '395')
            weatherBg.source = "./icons/HeavySnowDay.jpg";
        else if(weatherCode == '392')
            weatherBg.source = "./icons/ThunderShowersDay.jpg";
        else if(weatherCode == '389')
            weatherBg.source = "./icons/ThunderstormsDay.jpg";
        else if(weatherCode == '386')
            weatherBg.source = "./icons/ThunderShowersDay.jpg";
        else if(weatherCode == '377')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '374')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '371')
            weatherBg.source = "./icons/HeavySnowDay.jpg";
        else if(weatherCode == '368')
            weatherBg.source = "./icons/LightSnowDay.jpg";
        else if(weatherCode == '365')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '362')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '359')
            weatherBg.source = "./icons/TorrentialRainDay.jpg";
        else if(weatherCode == '356')
            weatherBg.source = "./icons/HeavyRainDay.jpg";
        else if(weatherCode == '353')
            weatherBg.source = "./icons/LightRain.jpg";
        else if(weatherCode == '350')
            weatherBg.source = "./icons/IcePelletsDay.jpg";
        else if(weatherCode == '338')
            weatherBg.source = "./icons/HeavySnowDay.jpg";
        else if(weatherCode == '335')
            weatherBg.source = "./icons/HeavySnowDay.jpg";
        else if(weatherCode == '332')
            weatherBg.source = "./icons/ModerateSnowDay.jpg";
        else if(weatherCode == '329')
            weatherBg.source = "./icons/ModerateSnowDay.jpg";
        else if(weatherCode == '326')
            weatherBg.source = "./icons/LightSnowDay.jpg";
        else if(weatherCode == '323')
            weatherBg.source = "./icons/LightSnowDay.jpg";
        else if(weatherCode == '320')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '317')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '314')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '311')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '308')
            weatherBg.source = "./icons/HeavyRainDay.jpg";
        else if(weatherCode == '305')
            weatherBg.source = "./icons/HeavyRainDay.jpg";
        else if(weatherCode == '302')
            weatherBg.source = "./icons/ModerateRainDay.jpg";
        else if(weatherCode == '299')
            weatherBg.source = "./icons/ModerateRainDay.jpg";
        else if(weatherCode == '296')
            weatherBg.source = "./icons/LightRain.jpg";
        else if(weatherCode == '293')
            weatherBg.source = "./icons/LightRain.jpg";
        else if(weatherCode == '284')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '281')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg";
        else if(weatherCode == '266')
            weatherBg.source = "./icons/PatchyLightDrizzleDay.jpg";
        else if(weatherCode == '263')
            weatherBg.source = "./icons/PatchyLightDrizzleDay.jpg";
        else if(weatherCode == '260')
            weatherBg.source = "./icons/FreezingFogDay.jpg"
        else if(weatherCode == '248')
            weatherBg.source = "./icons/FogDay.png"
        else if(weatherCode == '230')
            weatherBg.source = "./icons/BlizzardDay.jpg"
        else if(weatherCode == '227')
            weatherBg.source = "./icons/BlowingSnowDay.jpg"
        else if(weatherCode == '200')
            weatherBg.source = "./icons/ThunderShowersDay.jpg"
        else if(weatherCode == '185')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg"
        else if(weatherCode == '182')
            weatherBg.source = "./icons/PatchySleetNearbyDay.jpg"
        else if(weatherCode == '179')
            weatherBg.source = "./icons/PatchySnowNearbyDay.png"
        else if(weatherCode == '176')
            weatherBg.source = "./icons/PatchyRainNearbyDay.jpg"
        else if(weatherCode == '143')
            weatherBg.source = "./icons/MistDay.jpg"
        else if(weatherCode == '122')
            weatherBg.source = "./icons/OvercastDay.jpg"
        else if(weatherCode == '119')
            weatherBg.source = "./icons/CloudyDay.jpg"
        else if(weatherCode == '116')
            weatherBg.source = "./icons/PartlyCloudyDay.jpg"
        else if(weatherCode == '113')
            weatherBg.source = "./icons/ClearDay.jpg"

    }
    else if(((dayOrNight =='PM') && (timeHours >= 6 && timeHours <= 11)) ||
            ((dayOrNight == 'AM') && (timeHours == 12 || (timeHours >= 1 && timeHours <=5))))
    {
        //night icons

        if(weatherCode == '395')
            weatherBg.source = "./icons/HeavySnowNight.jpg";
        else if(weatherCode == '392')
            weatherBg.source = "./icons/ThunderShowersNight.jpg";
        else if(weatherCode == '389')
            weatherBg.source = "./icons/ThunderstormsNight.jpg";
        else if(weatherCode == '386')
            weatherBg.source = "./icons/ThunderShowersNight.jpg";
        else if(weatherCode == '377')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '374')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '371')
            weatherBg.source = "./icons/HeavySnowNight.jpg";
        else if(weatherCode == '368')
            weatherBg.source = "./icons/LightSnowNight.jpg";
        else if(weatherCode == '365')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '362')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '359')
            weatherBg.source = "./icons/TorrentialRainNight.jpg";
        else if(weatherCode == '356')
            weatherBg.source = "./icons/HeavyRainNight.jpg";
        else if(weatherCode == '353')
            weatherBg.source = "./icons/LightRainNight.jpg";
        else if(weatherCode == '350')
            weatherBg.source = "./icons/IcePelletsNight.jpg";
        else if(weatherCode == '338')
            weatherBg.source = "./icons/HeavySnowNight.jpg";
        else if(weatherCode == '335')
            weatherBg.source = "./icons/HeavySnowNight.jpg";
        else if(weatherCode == '332')
            weatherBg.source = "./icons/ModerateSnowNight.jpg";
        else if(weatherCode == '329')
            weatherBg.source = "./icons/ModerateSnowNight.jpg";
        else if(weatherCode == '326')
            weatherBg.source = "./icons/LightSnowNight.jpg";
        else if(weatherCode == '323')
            weatherBg.source = "./icons/LightSnowNight.jpg";
        else if(weatherCode == '320')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '317')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '314')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '311')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '308')
            weatherBg.source = "./icons/HeavyRainNight.jpg";
        else if(weatherCode == '305')
            weatherBg.source = "./icons/HeavyRainNight.jpg";
        else if(weatherCode == '302')
            weatherBg.source = "./icons/ModerateRainNight.jpg";
        else if(weatherCode == '299')
            weatherBg.source = "./icons/ModerateRainNight.jpg";
        else if(weatherCode == '296')
            weatherBg.source = "./icons/LightRainNight.jpg";
        else if(weatherCode == '293')
            weatherBg.source = "./icons/LightRainNight.jpg";
        else if(weatherCode == '284')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '281')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg";
        else if(weatherCode == '266')
            weatherBg.source = "./icons/PatchyLightDrizzleNight.jpg";
        else if(weatherCode == '263')
            weatherBg.source = "./icons/PatchyLightDrizzleNight.jpg";
        else if(weatherCode == '260')
            weatherBg.source = "./icons/FreezingFogNight.jpg"
        else if(weatherCode == '248')
            weatherBg.source = "icons/FogNight.png"
        else if(weatherCode == '230')
            weatherBg.source = "./icons/BlizzardNight.jpg"
        else if(weatherCode == '227')
            weatherBg.source = "./icons/BlowingSnowNight.jpg"
        else if(weatherCode == '200')
            weatherBg.source = "./icons/ThunderShowersNight.jpg"
        else if(weatherCode == '185')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg"
        else if(weatherCode == '182')
            weatherBg.source = "./icons/PatchySleetNearbyNight.jpg"
        else if(weatherCode == '179')
            weatherBg.source = "./icons/PatchySnowNearbyNight.png"
        else if(weatherCode == '176')
            weatherBg.source = "./icons/PatchyRainNearbyNight.jpg"
        else if(weatherCode == '143')
            weatherBg.source = "./icons/MistNight.jpg"
        else if(weatherCode == '122')
            weatherBg.source = "./icons/OvercastNight.jpg"
        else if(weatherCode == '119')
            weatherBg.source = "./icons/CloudyNight.jpg"
        else if(weatherCode == '116')
            weatherBg.source = "./icons/PartlyCloudyNight.jpg"
        else if(weatherCode == '113')
            weatherBg.source = "./icons/ClearNight.jpg";
    }
}

function getWeather()
{
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {
            var jsonObject1 = eval('(' + doc.responseText + ')');
            loadWeather1(jsonObject1);
        }
    }
    console.log("In Weather Function");
    doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + "Chicago" + "&format=json&num_of_days=1&key=80b4744b8c193111130202");
    doc.send();
}
