/**
 *
 */

'use strict'

//document.getElementById("geo").onClick = a();

function a(){

navigator.geolocation.getCurrentPosition(success,fail);

}

function success(pos){
	const lat =pos.coords.latitude;
	const lng = pos.coords.longitude;
	console.log('緯度:'+lat,'経度:'+lng);

	//set
	document.getElementById("lat").value = lat;
	document.getElementById("lng").value = lng;

//submit処理
	submit();


}
function fail(pos){
	alert('位置情報を取得しない場合、「お天気スイッチ」は東京で適用されます。');
	const lat = 'false';
	const lng = 'false';

	document.getElementById("lat").value = lat;
	document.getElementById("lng").value = lng;

	//submit処理
	submit();

}

function submit(){
	const geo=document.getElementsByName('geo');
	document.geo.submit();
}
