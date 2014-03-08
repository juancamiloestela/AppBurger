
App = (function(){
       
    function generateApp(e){
        e.preventDefault();
       
        var appName = document.getElementById('app-name'),
            appDestination = document.getElementById('app-destination');
       
       console.log('Generating ' + appName.value);
       console.log('Into ' + appDestination.value);

       // check if folder exists
       if (!Burger.isDir(appDestination.value)){
           alert(appDestination.value + ' does not exist, please create it. Thanks :)');
           //return;
       }

       console.log(Burger.getCwd());
    }
       
    function addEventListeners(){
       document.getElementById('generate-app-form').addEventListener('submit', generateApp, true);
    }

	function init(){
		Burger.centerWindow();
        addEventListeners();
        // wait for it...
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
