
(function(){

	var _Capsule = {
		isRunningOnBrowser: function(){
			return true;
		},

		// OSX SPECIFIC
		

		// App specific
		showIconInDock: function(){},
		hideIconInDock: function(){},
		quit: function(){},
		
		// window management
		createNewWindow: function(){},
		closeWindow: function(){},
		disableCloseWindowButton: function(){},
		enableCloseWindowButton: function(){},
		disableMinimizeWindowButton: function(){},
		enableMinimizeWindowButton: function(){},
		minimizeWindow: function(){},
		unminimizeWindow: function(){},
		centerWindow: function(){},
		resizeWindow: function(){},
		disableWindowResize: function(){},
		enableWindowResize: function(){},
		hideWindowTitlebar: function(){},
		showWindowTitlebar: function(){},

		// status bar 
		addStatusBarItem: function(){},
		removeStatusBarItem: function(){},
		disableStatusBarItem: function(){},
		enableStatusBarItem: function(){},
		checkStatusBarItem: function(){},
		uncheckStatusBarItem: function(){},
		setStatusBarIcon: function(){},
		setStatusBarText: function(){},

		// file access
		readFile: function(){},
		writeFile: function(){},
		deleteFile: function(){}
	};
	

	window.capsuleReadyEvent = document.createEvent('Events');
	capsuleReadyEvent.initEvent('capsuleready',true,false);

	window.webviewReadyEvent = document.createEvent('Events');
	webviewReadyEvent.initEvent('webviewready',true,false);

	if (!/\.app/.test(location.href)){
		// is running in browser
		if (!Capsule){
			window.Capsule = _Capsule;
		}else{
			// merge with user defined capsule obj
		}

		window.addEventListener('load', function(){
			document.dispatchEvent(webviewReadyEvent);
		}, false);
	}

	document.addEventListener('webviewready', function(){
		// do stuff before initialization
		document.dispatchEvent(capsuleReadyEvent);
	}, false);

})();


