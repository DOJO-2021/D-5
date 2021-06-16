$(document).ready(function() {
	for(let i = 1; i <= 100; i++){
	    $('#dish' + i).jqFloat({
	        width: 1000,
	        height: 500,
	        speed: 5000
	    });
    }
});