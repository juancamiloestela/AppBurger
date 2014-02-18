
App = (function(){

	function init(){
		Capsule.centerWindow();
		setTimeout(function(){
			// useless but fancy boot up sequence delay
			document.body.className = 'running';
			document.querySelector('.status').innerHTML = 'All systems OK';
		}, 1000);
	};

	return {
		init: init
	};

})();


document.addEventListener('capsuleready', function(){
	// init app
	App.init();
}, false);
