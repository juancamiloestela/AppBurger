
(function(){

	var _Capsule = {
		isRunningOnBrowser: function(){
			return true;
		},

		// OSX SPECIFIC
		

		// App specific
		showIconInDock: function(){}, // Done
		hideIconInDock: function(){}, // Buggy - window hides sometimes
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
		resizeWindow: function(){}, // Done
		setWindowX: function(){},
		setWindowY: function(){},
		setWindowWidth: function(){},
		setWindowHeight: function(){},
		disableWindowResize: function(){}, // Done
		enableWindowResize: function(){}, // Done
		hideWindowTitleBar: function(){}, // Done
		showWindowTitleBar: function(){}, // Buggy - buttons dissapear
		setWindowTitle: function(){}, // Done
		getWindowTitle: function(){}, // Done

		// status bar 
		addStatusBarItem: function(){},
		removeStatusBarItem: function(){},
		disableStatusBarItem: function(){},
		enableStatusBarItem: function(){},
		checkStatusBarItem: function(){},
		uncheckStatusBarItem: function(){},
		setStatusBarIcon: function(){}, // Done
		setStatusBarText: function(){}, // Done

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


