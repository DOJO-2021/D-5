/**
 *
 */

'use strict'

//document.getElementById("geo").onClick = a();
a();

function a(){

navigator.geolocation.getCurrentPosition(success,fail);

function success(pos){
	alert('現在地取得完了');
	const lat =pos.coords.latitude;
	const lng = pos.coords.longitude;
	console.log('緯度:'+lat,'経度:'+lng);

	document.getElementById("lat").value = lat;
	document.getElementById("lng").value = lng;

}
function fail(pos){
	alert('位置情報を取得しない場合、「お天気スイッチ」は東京で適用されます。');
	const lat = false;
	const lng = false;

	document.getElementById("lat").value = lat;
	document.getElementById("lng").value = lng;
}
}