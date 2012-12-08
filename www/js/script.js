

var myApp = (function(){

	var myVar = '';

	function init(){
		console.log('my app started!');

		$('#console-input').keydown(function(e){
			if (e.which == 13){
				var src = $(this).val(),
					result = '';

				try{
					result = eval(src);
				}catch(error){
					result = error.message;
				}

				$('#console-output').val($('#console-output').val() + result + "\n").scrollTop($('#console-output')[0].scrollHeight);

			}
		});
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

	
	Capsule.hideIconInDock();
	Capsule.hideCloseWindowButton();
	Capsule.hideMinimizeWindowButton();
	Capsule.hideZoomWindowButton();

	setTimeout(function(){
		console.log('showing');
		Capsule.showIconInDock();
		Capsule.showCloseWindowButton();
		Capsule.showMinimizeWindowButton();
		Capsule.showZoomWindowButton();
		Capsule.centerWindow();
		Capsule.disableWindowResize();
		Capsule.setStatusBarText('Juank');

		var files = Capsule.readDir('/');
		for (var i in files){
			console.log(files[i] + ' isDir:' + Capsule.isDir('/'+files[i]) + ' isFile:' + Capsule.isFile('/'+files[i]));
		}

		setTimeout( function(){
			Capsule.disableCloseWindowButton();
			Capsule.disableMinimizeWindowButton();
			Capsule.disableZoomWindowButton();
			Capsule.resizeWindow(0,0,500,600);
			Capsule.enableWindowResize();
			Capsule.setStatusBarIcon('img/defaultStatusBarIcon.png','img/defaultActiveStatusBarIcon.png');
		},3000);
	},3000);

	//Capsule.quit();




	myApp.init();
}, false);