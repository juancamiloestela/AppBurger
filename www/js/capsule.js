
(function(){

	var _Capsule = {
		isRunningOnBrowser: function(){
			return true;
		},

		// OSX SPECIFIC
		

		// App specific
		showIconInDock: function(){}, // Done
		hideIconInDock: function(){}, // Done
		quit: function(){}, // Done
		
		// window management
		createNewWindow: function(){},
		closeWindow: function(){},
		hideWindow: function(){},
		showWindow: function(){},
		disableCloseWindowButton: function(){}, // Done
		enableCloseWindowButton: function(){}, // Done
		disableMinimizeWindowButton: function(){}, // Done
		enableMinimizeWindowButton: function(){}, // Done
		disableZoomWindowButton: function(){}, // Done
		enableZoomWindowButton: function(){}, // Done
		hideCloseWindowButton: function(){}, // Done
		showCloseWindowButton: function(){}, // Done
		hideMinimizeWindowButton: function(){}, // Done
		showZoomWindowButton: function(){}, // Done
		hideZoomWindowButton: function(){}, // Done
		showMinimizeWindowButton: function(){}, // Done
		minimizeWindow: function(){}, // Done
		unminimizeWindow: function(){}, // Done
		centerWindow: function(){}, // Done
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
		readDir: function(){},
		makeDir: function(){},
		deleteDir: function(){},
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
		try {
			if (Capsule){
				// merge with _Capsule
			}
		}catch(e){
			window.Capsule = _Capsule;
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


