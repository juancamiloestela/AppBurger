
(function(){

	var _Capsule = {
		isRunningOnBrowser: function(){
			return true;
		},


		loadPlugin: function(){}, // ??

		// OSX SPECIFIC
		

		// App specific
		showDockIcon: function(){}, // Done
		hideDockIcon: function(){}, // Buggy - window hides sometimes
		quit: function(){}, // Done
		setDockIcon: function(){},

		// user data
		getUserData: function(key){}, // Done
		setUserData: function(key, value){}, // Done
		
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
		resizeWindow: function(x,y,width,height){}, // Done
		setWindowX: function(){},
		setWindowY: function(){},
		setWindowWidth: function(){},
		setWindowHeight: function(){},
		disableWindowResize: function(){}, // Done
		enableWindowResize: function(){}, // Done
		hideWindowTitleBar: function(){}, // Done
		showWindowTitleBar: function(){}, // Buggy - buttons dissapear
		setWindowTitle: function(title){}, // Done
		getWindowTitle: function(){}, // Done

		// status bar
		addStatusBarItem: function(){},
		removeStatusBarItem: function(){},
		disableStatusBarItem: function(){},
		enableStatusBarItem: function(){},
		checkStatusBarItem: function(){},
		uncheckStatusBarItem: function(){},
		setStatusBarIcon: function(pathToIcon, pathToActiveIcon){}, // Done
		setStatusBarLabel: function(label){}, // Done

		// application menu
		hideAppMenu: function(){},
		showAppMenu: function(){},
		addAppMenuItem: function(label,parent, callback){},

		// file access
		getCwd: function(){}, // Done
		setCwd: function(path){}, // Done
		isDir: function(path){}, // Done
		isFile: function(path){}, // Done
		readDir: function(path){}, // Done
		makeDir: function(path){}, // Done
		deleteDir: function(path){}, // Done
		readFile: function(path){}, // Done
		writeFile: function(path, data, mode){}, // Done, pending mode
		deleteFile: function(path){}, // Done
		copyFile: function(from, to){}, // Done
		moveFile: function(from, to){} // Done
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


