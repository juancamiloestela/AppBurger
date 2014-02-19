
App = (function(){

	function init(){
		Burger.centerWindow();
		setTimeout(function(){
			// useless but fancy boot up sequence delay
			document.body.className = 'running';
		}, 1000);
	}

	return {
		init: init
	};

})();


document.addEventListener('burgerready', function(){
	// init app
	App.init();
}, false);
