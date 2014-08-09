/**
 * AppBurger Generator
 * An app made with AppBurger to generate new
 * AppBurger apps.
 * @author  Juan Camilo Estela
 * @version  0.2
 */

App = (function() {

	function generateApp(e) {
		e.preventDefault();

		var i,
			appName = document.getElementById('app-name').value,
			appDestination = document.getElementById('app-destination').value + '/' + appName,
			appIdentifier = document.getElementById('app-identifier').value;

		if (appName === '' || appDestination === '' || appIdentifier === ''){
            alert('Please fill all the fields...');
			return false;
		}

       
       try{
            Burger.copyFile(Burger.getWebRootPath() + '/rawBurger', appDestination);

            setAppName(appDestination, appName);
            setAppIdentifier(appDestination, appIdentifier);
            setAppFilenames(appDestination, appName);
            alert('done!');
       }catch(e){
            alert('There seems to have been an error, please check destination folder is writeable');
       }
	}

	function setAppName(appDestination, appName) {
		var filesToReplace = [
			'AppBurger.rawproject/project.pbxproj',
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
            'AppBurger.rawproject',
			'Burger/AppBurger-Info.plist',
			'Burger/AppBurger-Prefix.pch'
		];

		var renamed = '',
            segments = [],
            filename = '',
            username = Burger.getCurrentUsername();

		for (i in filesToRename) {
            segments = filesToRename[i].split('/');
            filename = segments.pop();
            filename = filename.replace(/AppBurger/g, appName).replace(/USERNAME/g, username).replace('.rawproject', '.xcodeproj');
            segments.push(filename);
            renamed = segments.join('/');
			Burger.moveFile(appDestination + '/' + filesToRename[i], appDestination + '/' + renamed);
		}
	}

	function addEventListeners() {
		document.getElementById('generate-app-form').addEventListener('submit', generateApp, true);
        document.getElementById('app-destination').addEventListener('click', function(){
            Burger.showOpenDialog(function(path){
                document.getElementById('app-destination').value = path;
            }, true, false, false, 'Choose the folder to create your app in');
        }, true);
	}

	function init() {
		Burger.setDockIcon('img/icon.png');
		Burger.setStatusBarIcon('img/statusBarIcon.png', 'img/statusBarIconActive.png');
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


window.addEventListener('load', function(){
	// init app
	App.init();
}, false);