App = (function() {

	function generateApp(e) {
		e.preventDefault();

		var i,
			appName = document.getElementById('app-name').value,
			appDestination = document.getElementById('app-destination').value,
			appIdentifier = document.getElementById('app-identifier').value;

		if (appName === '' || appDestination === '' || appIdentifier === ''){
			return false;
		}

		Burger.copyFile(Burger.getWebRootPath() + '/rawBurger', appDestination);

		setAppName(appDestination, appName);
		setAppIdentifier(appDestination, appIdentifier);
		setAppFilenames(appDestination, appName);
	}

	function setAppName(appDestination, appName) {
		var filesToReplace = [
			'AppBurger.xcodeproj/project.pbxproj',
			'AppBurger.xcodeproj/project.xcworkspace/contents.xcworkspacedata',
			'AppBurger.xcodeproj/xcuserdata/juanestela.xcuserdatad/xcschemes/AppBurger.xcscheme',
			'AppBurger.xcodeproj/xcuserdata/juanestela.xcuserdatad/xcschemes/xcschememanagement.plist',
			'Burger/en.lproj/MainMenu.xib'
		];

		var contents = '';
		for (i in filesToReplace) {
			contents = Burger.readFile(appDestination + '/' + filesToReplace[i]);
			contents = contents.replace(/AppBurger/g, appName);
			Burger.writeFile(appDestination + '/' + filesToReplace[i], contents);
		}
	}

	function setAppIdentifier(appDestination, appIdentifier) {
		var filesToReplace = [
			'Burger/AppBurger-Info.plist',
			'Burger/AppDelegate.m'
		];

		var contents = '';
		for (i in filesToReplace) {
			contents = Burger.readFile(appDestination + '/' + filesToReplace[i]);
			contents = contents.replace(/com\.revolution/g, appIdentifier);
			Burger.writeFile(appDestination + '/' + filesToReplace[i], contents);
		}
	}

	function setAppFilenames(appDestination, appName) {
		var filesToRename = [
			'AppBurger.xcodeproj',
			'Burger/AppBurger-Info.plist',
			'Burger/AppBurger-Prefix.pch'
		];

		var renamed = '';
		for (i in filesToRename) {
			renamed = filesToRename[i].replace('AppBurger', appName);
			Burger.moveFile(appDestination + '/' + filesToRename[i], appDestination + '/' + renamed);
		}
	}

	function addEventListeners() {
		document.getElementById('generate-app-form').addEventListener('submit', generateApp, true);
	}

	function init() {
		Burger.setDockIcon('img/icon.png');
		Burger.setStatusBarIcon('img/statusBarIcon.png', 'img/statusBarIconActive.png');
		Burger.setWindowHeight(500);
		Burger.centerWindow();
		addEventListeners();
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