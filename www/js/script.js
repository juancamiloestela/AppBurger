

var myApp = (function(){

	var myVar = '';

	function init(){
		console.log('my app started!');
	}

	return{
		init: init
	};
})();


document.addEventListener('capsuleready', function(){
	// init app
	if (Capsule.isRunningOnBrowser()){
		console.log('is running on browser');
	}else{
		console.log('is running on app');
	}

	myApp.init();
}, false);