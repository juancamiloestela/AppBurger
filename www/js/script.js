
App = (function(){

	(function init(){
		Capsule.centerWindow();

		setTimeout(function(){
			
		}, 2000);
	})();
})();


document.addEventListener('capsuleready', function(){
	// init app
	App.init();
}, false);
