/**
 * AppBurger Generator
 * An app made with AppBurger to generate new
 * AppBurger apps.
 * @author  Juan Camilo Estela
 * @version  0.1
 */

App = (function() {

	function init() {
		Burger.setDockIcon('img/icon.png');
		Burger.setStatusBarIcon('img/statusBarIcon.png', 'img/statusBarIconActive.png');
		Burger.setWindowHeight(500);
		Burger.centerWindow();
		// wait for it...
		setTimeout(function() {
			// useless but fancy boot up sequence delay
			document.body.className = 'running';
		}, 1000);
	}

	return {
		init: init
	};

})();


document.addEventListener('burgerready', function() {
	// init app
	App.init();
}, false);