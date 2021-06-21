/**
 *
 */
				//位置情報を取得し緯度経度をmain.jspに挿入しサブミット処理をする

'use strict'

//位置情報の取得
function a(){
navigator.geolocation.getCurrentPosition(success,fail);
}

//緯度経度を取得
function success(pos){
	const lat =pos.coords.latitude;
	const lng = pos.coords.longitude;
	console.log('緯度:'+lat,'経度:'+lng);

	//mainのhiddenのformにセット
	document.getElementById("lat").value = lat;
	document.getElementById("lng").value = lng;

	//submitファンクションの呼び出し
	submit();
}

//位置情報取得しない場合、緯度経度をfalseにセット（ifでfalseの場合は東京になる）。
function fail(pos){
	alert('位置情報を取得しない場合、「お天気スイッチ」は東京で適用されます。');
	const lat = 'false';
	const lng = 'false';

	//セット
	document.getElementById("lat").value = lat;
	document.getElementById("lng").value = lng;

	//submitファンクション呼び出し
	submit();

}

//サブミット処理
function submit(){
	const geo=document.getElementsByName('geo');
	document.geo.submit();
}
