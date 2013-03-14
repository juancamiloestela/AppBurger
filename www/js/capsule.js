


(function(){

	window.Capsule = {
		
		// Helpers
		_basicHash: function(str){
			str = 'C' + str.replace(/[^a-zA-Z0-9]/ig,'');
			while (str.length < 32){
				str += str;
			}
			var length = str.length,
				segmentLength = Math.floor(length/32),
				i = 0,
				chars = [];

			for (i = 0; i < length; i = i+segmentLength){
				chars.push(str.charAt(i));
			}
			return chars.join('');
		},
		_callbacks:{},
		_registerCallback: function(callback){
			if (typeof callback === 'function'){
				var callbackId = Capsule._basicHash(callback.toString());
				Capsule._callbacks[callbackId] = callback;
				return callbackId;
			}
			return false;
		},

		// Environment
		isRunningOnBrowser: function(){
			return cCapsule.isRunningOnBrowser();
		},

		// OSX SPECIFIC
		

		// App specific
		showDockIcon: function(){
			return cCapsule.showDockIcon();
		},
		hideDockIcon: function(){
			return cCapsule.hideDockIcon();
		},
		quit: function(){
			return cCapsule.quit();
		},
		setDockIcon: function(){

		},

		// user data
		getUserData: function(key){
			return cCapsule.getUserData(key);
		},
		setUserData: function(key, value){}, // Done
		
		// window management
		createNewWindow: function(){
			return cCapsule.createNewWindow();
		},
		closeWindow: function(){
			return cCapsule.closeWindow();
		},
		hideWindow: function(){
			return cCapsule.hideWindow();
		},
		showWindow: function(){
			return cCapsule.showWindow();
		},
		disableCloseWindowButton: function(){
			return cCapsule.disableCloseWindowButton();
		}, // Done
		enableCloseWindowButton: function(){
			return cCapsule.enableCloseWindowButton();
		}, // Done
		disableMinimizeWindowButton: function(){
			return cCapsule.disableMinimizeWindowButton();
		}, // Done
		enableMinimizeWindowButton: function(){
			return cCapsule.enableMinimizeWindowButton();
		}, // Done
		disableZoomWindowButton: function(){
			return cCapsule.disableZoomWindowButton();
		}, // Done
		enableZoomWindowButton: function(){
			return cCapsule.enableZoomWindowButton();
		}, // Done
		hideCloseWindowButton: function(){
			return cCapsule.hideCloseWindowButton();
		}, // Done
		showCloseWindowButton: function(){
			return cCapsule.showCloseWindowButton();
		}, // Done
		hideMinimizeWindowButton: function(){
			return cCapsule.hideMinimizeWindowButton();
		}, // Done
		showZoomWindowButton: function(){
			return cCapsule.showZoomWindowButton();
		}, // Done
		hideZoomWindowButton: function(){
			return cCapsule.hideZoomWindowButton();
		}, // Done
		showMinimizeWindowButton: function(){
			return cCapsule.showMinimizeWindowButton();
		}, // Done
		minimizeWindow: function(){
			return cCapsule.minimizeWindow();
		}, // Done
		unminimizeWindow: function(){
			return cCapsule.unminimizeWindow();
		}, // Done
		centerWindow: function(){
			return cCapsule.centerWindow();
		}, // Done
		resizeWindow: function(x,y,width,height){
			return cCapsule.resizeWindow(x,y,width,height);
		}, // Done
		setWindowX: function(){
			return cCapsule.setWindowX();
		},
		setWindowY: function(){
			return cCapsule.setWindowY();
		},
		setWindowWidth: function(){
			return cCapsule.setWindowWidth();
		},
		setWindowHeight: function(){
			return cCapsule.setWindowHeight();
		},
		disableWindowResize: function(){
			return cCapsule.disableWindowResize();
		}, // Done
		enableWindowResize: function(){
			return cCapsule.enableWindowResize();
		}, // Done
		hideWindowTitleBar: function(){
			return cCapsule.hideWindowTitleBar();
		}, // Done
		showWindowTitleBar: function(){
			return cCapsule.showWindowTitleBar();
		}, // Buggy - buttons dissapear
		setWindowTitle: function(title){
			return cCapsule.setWindowTitle(title);
		}, // Done
		getWindowTitle: function(){
			return cCapsule.getWindowTitle();
		}, // Done

		// status bar
		addStatusBarItem: function(label, callback){
			var callbackId = Capsule._registerCallback(callback);
			return cCapsule.addStatusBarItem(label, callbackId);
		},
		removeStatusBarItem: function(){},
		disableStatusBarItem: function(){},
		enableStatusBarItem: function(){},
		checkStatusBarItem: function(){},
		uncheckStatusBarItem: function(){},
		setStatusBarIcon: function(pathToIcon, pathToActiveIcon){
			return cCapsule.setStatusBarIcon(pathToIcon, pathToActiveIcon);
		}, // Done
		setStatusBarLabel: function(label){
			return cCapsule.setStatusBarLabel(label);
		}, // Done

		// application menu
		hideAppMenu: function(){},
		showAppMenu: function(){},
		addAppMenuItem: function(label,parent, callback){},

		// file access
		getCwd: function(){
			return cCapsule.getCwd();
		}, // Done
		setCwd: function(path){
			return cCapsule.setCwd(path);
		}, // Done
		isDir: function(path){
			return cCapsule.isDir(path);
		}, // Done
		isFile: function(path){
			return cCapsule.isFile(path);
		}, // Done
		readDir: function(path){
			return cCapsule.readDir(path);
		}, // Done
		makeDir: function(path){
			return cCapsule.makeDir(path);
		}, // Done
		deleteDir: function(path){
			return cCapsule.deleteDir(path);
		}, // Done
		readFile: function(path){
			return cCapsule.readFile(path);
		}, // Done
		writeFile: function(path, data, mode){
			return cCapsule.writeFile(path, data, mode);
		}, // Done, pending mode
		deleteFile: function(path){
			return cCapsule.deleteFile(path);
		}, // Done
		copyFile: function(from, to){
			return cCapsule.copyFile(from, to);
		}, // Done
		moveFile: function(from, to){
			return cCapsule.moveFile(from, to);
		} // Done
	};




	var jsCapsule = {
		isRunningOnBrowser: function(){
			return true;
		},


		loadPlugin: function(){}, // ??

		_basicHash: function(str){
			str = 'C' + str.replace(/[^a-zA-Z0-9]/ig,'');
			while (str.length < 32){
				str += str;
			}
			var length = str.length,
				segmentLength = Math.floor(length/32),
				i = 0,
				chars = [];

			for (i = 0; i < length; i = i+segmentLength){
				chars.push(str.charAt(i));
			}
			return chars.join('');
		},
		_callbacks:{},
		_registerCallback: function(callback){
			if (typeof callback === 'function'){
				var callbackId = jsCapsule._basicHash(callback.toString());
				jsCapsule._callbacks[callbackId] = callback;
				return callbackId;
			}
			return false;
		},

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
		addStatusBarItem: function(label, callback){
			console.log('adding status bar item on browser');
		},
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
			if (cCapsule){
				// merge with jsCapsule
			}
		}catch(e){
			window.Capsule = jsCapsule;
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



