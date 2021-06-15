'use script'

    let appId = "8cf8297187f7c385c96059cae352789a";

    //現在の天気を取得する場所の名前
    let targetCityName = "kamakura";





//<input type="hidden" id="temp">
//      const url = "https://api.openweathermap.org/data/2.5/weather" + "?lat=" + lat + "&lon=" + lng + "&units=metric&APPID=" + appId;


    const requestUrl = "https://api.openweathermap.org/data/2.5/weather?APPID=" + appId + "&lang=ja&units=metric&q=" + targetCityName + ",jp;";

    //Ajax通信用のオブジェクトを作成
    let xhr =new XMLHttpRequest();

    //通信方式とURLを設定
    xhr.open("GET",requestUrl);

    //通信を実行する
    xhr.send();

    //通信ステータスが変わったら実行される関数
    xhr.onreadystatechange = function(){
        //通信が完了
        if(xhr.readyState == 4){
            ShowTodaysWeather(xhr.responseText);
        }
    }

    /**
     * 今日の天気を表示する
     */
    function ShowTodaysWeather(response){

        let obj = JSON.parse(response);

        let temp = obj.main.temp;


    document.getElementById('temp').value=temp;

    }