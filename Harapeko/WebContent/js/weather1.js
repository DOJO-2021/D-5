/**
 *
 */
'use strict'

	//OpenWeatherMapのAPIキー。
    let appId = "8cf8297187f7c385c96059cae352789a";

    //現在の天気を取得する場所の名前（位置情報取得失敗した場合に使う）
    let targetCityName = "Tokyo";

	//緯度経度をsuggest.jspのhiddenから取得
	let lat=document.getElementById('lat').textContent;
	let lng=document.getElementById('lng').textContent;
	console.log('緯度:'+lat,'経度:'+lng);

	//緯度経度取得出来なかった場合とできた場合のopenwathermapのURL
	if(lat == 'false' || lat == ""){
		var requestUrl = "https://api.openweathermap.org/data/2.5/weather?APPID=" + appId + "&lang=ja&units=metric&q=" + targetCityName + ",jp;";
	}else{
    	var requestUrl = "https://api.openweathermap.org/data/2.5/weather" + "?lat=" + lat + "&lon=" + lng + "&units=metric&APPID=" + appId;
	}

    //Ajax通信用のオブジェクトを作成（ここからはコピペだペコ）
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
        console.log('現在地の気温:'+temp);

	//Suggest.jspに気温を挿入する
    document.getElementById('temp').value=temp;

    }