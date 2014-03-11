/**
 * Burger.js
 * Javascript api for AppBurger
 * @author Juan Camilo Estela
 * @version  0.1
 */


(function(){

	/**
	 * Burger Object
	 * This object has the functions that call 
	 * obj-c methods. Only used when obj-c is
	 * available
	 */
	window.Burger = {
		
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
				var callbackId = Burger._basicHash(callback.toString());
				Burger._callbacks[callbackId] = callback;
				return callbackId;
			}
			return false;
		},

		// Environment
		isRunningOnBrowser: function(){
			return cBurger.isRunningOnBrowser();
		},

		// OSX SPECIFIC
		

		// App specific
		showDockIcon: function(){
			return cBurger.showDockIcon();
		}, // Done
		hideDockIcon: function(){
			return cBurger.hideDockIcon();
		}, // Done
		quit: function(){
			return cBurger.quit();
		}, // Done
		setDockIcon: function(iconPath){
            return cBurger.setDockIcon(iconPath);
		},
		bounceDockIcon: function(type){
			type = (type === undefined) ? 'informative' : type;
			return cBurger.bounceDockIcon(type);
		}, // Done

		// user data
		getUserData: function(key){
			return cBurger.getUserData(key);
		}, // Done
		setUserData: function(key, value){
			return cBurger.setUserData(key, value);
		}, // Done
		
		// window management
		createNewWindow: function(){
			return cBurger.createNewWindow();
		},
		closeWindow: function(){
			return cBurger.closeWindow();
		},
		hideWindow: function(){
			return cBurger.hideWindow();
		},
		showWindow: function(){
			return cBurger.showWindow();
		},

		disableCloseWindowButton: function(){
			return cBurger.disableCloseWindowButton();
		}, // Done
		enableCloseWindowButton: function(){
			return cBurger.enableCloseWindowButton();
		}, // Done
		disableMinimizeWindowButton: function(){
			return cBurger.disableMinimizeWindowButton();
		}, // Done
		enableMinimizeWindowButton: function(){
			return cBurger.enableMinimizeWindowButton();
		}, // Done
		disableZoomWindowButton: function(){
			return cBurger.disableZoomWindowButton();
		}, // Done
		enableZoomWindowButton: function(){
			return cBurger.enableZoomWindowButton();
		}, // Done
		hideCloseWindowButton: function(){
			return cBurger.hideCloseWindowButton();
		}, // Done
		showCloseWindowButton: function(){
			return cBurger.showCloseWindowButton();
		}, // Done
		hideMinimizeWindowButton: function(){
			return cBurger.hideMinimizeWindowButton();
		}, // Done
		showZoomWindowButton: function(){
			return cBurger.showZoomWindowButton();
		}, // Done
		hideZoomWindowButton: function(){
			return cBurger.hideZoomWindowButton();
		}, // Done
		showMinimizeWindowButton: function(){
			return cBurger.showMinimizeWindowButton();
		}, // Done
		minimizeWindow: function(){
			return cBurger.minimizeWindow();
		}, // Done
		unminimizeWindow: function(){
			return cBurger.unminimizeWindow();
		}, // Done
		centerWindow: function(){
			return cBurger.centerWindow();
		}, // Done
		resizeWindow: function(x,y,width,height){
			return cBurger.resizeWindow(x,y,width,height);
		}, // Done
		setWindowX: function(x){
			return cBurger.setWindowX(x);
		}, // Done
		setWindowY: function(y){
			return cBurger.setWindowY(y);
		}, // Done
		setWindowWidth: function(w){
			return cBurger.setWindowWidth(w);
		}, // Done
		setWindowHeight: function(h){
			return cBurger.setWindowHeight(h);
		}, // Done
		disableWindowResize: function(){
			return cBurger.disableWindowResize();
		}, // Done
		enableWindowResize: function(){
			return cBurger.enableWindowResize();
		}, // Done
		hideWindowTitleBar: function(){
			return cBurger.hideWindowTitleBar();
		}, // Done
		showWindowTitleBar: function(){
			return cBurger.showWindowTitleBar();
		}, // Buggy - buttons dissapear
		setWindowTitle: function(title){
			return cBurger.setWindowTitle(title);
		}, // Done
		getWindowTitle: function(){
			return cBurger.getWindowTitle();
		}, // Done

		// status bar
		addStatusBarItem: function(label, callback){
			var callbackId = Burger._registerCallback(callback);
			return cBurger.addStatusBarItem(label, callbackId);
		}, // Done
		removeStatusBarItem: function(label){
			return cBurger.removeStatusBarItem(label, callbackId);
		},
		disableStatusBarItem: function(){},
		enableStatusBarItem: function(){},
		checkStatusBarItem: function(){},
		uncheckStatusBarItem: function(){},
		setStatusBarIcon: function(pathToIcon, pathToActiveIcon){
			return cBurger.setStatusBarIcon(pathToIcon, pathToActiveIcon);
		}, // Done
		setStatusBarLabel: function(label){
			return cBurger.setStatusBarLabel(label);
		}, // Done

		// application menu
		hideAppMenu: function(){},
		showAppMenu: function(){},
		addAppMenuItem: function(label,parent, callback){},

		// file access
		getWebRootPath: function(){
			return cBurger.getWebRootPath();
		},
		getResourcePath: function(){ // TODO delete this, is alias of appPath
			return cBurger.getResourcePath();
		},
		getAppPath: function(){
			return cBurger.getAppPath();
		},
		getCwd: function(){
			return cBurger.getCwd();
		}, // Done
		setCwd: function(path){
			return cBurger.setCwd(path);
		}, // Done
		isDir: function(path){
			return cBurger.isDir(path);
		}, // Done
		isFile: function(path){
			return cBurger.isFile(path);
		}, // Done
		readDir: function(path){
			return cBurger.readDir(path);
		}, // Done
		makeDir: function(path){
			return cBurger.makeDir(path);
		}, // Done
		deleteDir: function(path){
			return cBurger.deleteDir(path);
		}, // Done
		readFile: function(path){
			return cBurger.readFile(path);
		}, // Done
		writeFile: function(path, data, mode){
			return cBurger.writeFile(path, data, mode);
		}, // Done, pending mode
		deleteFile: function(path){
			return cBurger.deleteFile(path);
		}, // Done
		copyFile: function(from, to){
			return cBurger.copyFile(from, to);
		}, // Done
		moveFile: function(from, to){
			return cBurger.moveFile(from, to);
		}, // Done
        download: function(url, to){
            return cBurger.download(url, to);
        }, // Done
        unzip: function(source, to){
            return cBurger.unzip(source, to);
        }, // Done - Cannot overwrite!
        getAppSupportPath: function(){
            return cBurger.getAppSupportPath();
        }, // Done
        sendNotification: function(title, message, sound){
            sound = (sound === undefined) ? true : sound;
            return cBurger.sendNotification(title, message, sound);
        } // Done
	};



	/**
	 * jsBurger Object
	 * This object is executed on the browser when no
	 * obj c wrapper is present
	 */
	var jsBurger = {
		isRunningOnBrowser: function(){
			return true;
		},

		loadPlugin: function(){}, // Pending

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
				var callbackId = jsBurger._basicHash(callback.toString());
				jsBurger._callbacks[callbackId] = callback;
				return callbackId;
			}
			return false;
		},

		// OSX SPECIFIC

		// App specific
		showDockIcon: function(){}, // Done
		hideDockIcon: function(){}, // Buggy - window hides sometimes
		quit: function(){}, // Done
		setDockIcon: function(){}, // Done
		bounceDockIcon: function(){}, // Done

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
		setWindowX: function(){}, // Done
		setWindowY: function(){}, // Done
		setWindowWidth: function(){}, // Done
		setWindowHeight: function(){}, // Done
		disableWindowResize: function(){}, // Done
		enableWindowResize: function(){}, // Done
		hideWindowTitleBar: function(){}, // Done
		showWindowTitleBar: function(){}, // Buggy - buttons dissapear
		setWindowTitle: function(title){}, // Done
		getWindowTitle: function(){}, // Done

		// status bar
		addStatusBarItem: function(label, callback){
			console.log('adding status bar item on browser');
		}, // Done
		removeStatusBarItem: function(){}, // Done
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
		getWebRootPath: function(){}, // Done
		getResourcePath: function(){}, // Done
		getAppPath: function(){}, // Done
		getAppSupportPath: function(){}, // Done
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
		moveFile: function(from, to){}, // Done

		// misc
		download: function(url, to){}, // Done
		sendNotification: function(){}, // Done
	};
	

	window.BurgerReadyEvent = document.createEvent('Events');
	BurgerReadyEvent.initEvent('burgerready',true,false);

	window.webviewReadyEvent = document.createEvent('Events');
	webviewReadyEvent.initEvent('webviewready',true,false);

	if (!/\.app/.test(location.href)){
		// is running in browser
		try {
			if (cBurger){
				// dont remember what I planned to do here...
			}
		}catch(e){
			window.Burger = jsBurger;
		}

		window.addEventListener('load', function(){
			document.dispatchEvent(webviewReadyEvent);
		}, false);
	}

	document.addEventListener('webviewready', function(){
		// do stuff before initialization
		document.dispatchEvent(BurgerReadyEvent);
	}, false);

})();


