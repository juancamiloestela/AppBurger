

CapsuleConsole = function(){
	
	var _consoleInput,
		_consoleOutput;

	function onConsoleKeyDown(e){
		var commandSource = false,
			result = undefined;

		if (e.keyCode == 13){
			commandSource = _consoleInput.value;

			try{
				result = eval(commandSource);
			} catch (error){
				result = error.message;
			}

			_consoleOutput.value = _consoleOutput.value + (result + "\n");
			_consoleOutput.scrollTop = _consoleOutput.scrollHeight;
		}
	}

	(function init(){
		_consoleInput = document.getElementById('console-input');
		_consoleOutput = document.getElementById('console-output');
		_consoleInput.addEventListener('keydown', onConsoleKeyDown, false);	
	})();
};


CapsuleApp = function(){


	function generate(){

	}

	function getLatestVersion(){

	}

	function download(){

	}

	function update(){

	}

	return {
		update: update
	};
};





App = (function(){
	
	var _capsuleConsole = new CapsuleConsole(),
		_appSupportPath;
        
	(function init(){
		_appSupportPath = Capsule.getAppSupportPath();

		Capsule.download('https://github.com/juancamiloestela/Gear/archive/master.zip', _appSupportPath);
	})();
})();






document.addEventListener('capsuleready', function(){
	// init app
	App.init();


	/*if (Capsule.isRunningOnBrowser()){
		console.log('is running on browser');
	}else{
		console.log('is running on app');
	}

	
	//Capsule.hideDockIcon(); will hide mainMenu and will not show back
	Capsule.hideCloseWindowButton();
	Capsule.hideMinimizeWindowButton();
	Capsule.hideZoomWindowButton();

	setTimeout(function(){
		console.log('showing');
		//Capsule.showDockIcon();
		Capsule.showCloseWindowButton();
		Capsule.showMinimizeWindowButton();
		Capsule.showZoomWindowButton();
		Capsule.centerWindow();
		Capsule.disableWindowResize();


		Capsule.addStatusBarItem('status item label', function(){
			console.log('status item label clicked!');
		});

		Capsule.setStatusBarLabel('Juank');

		if (Capsule.makeDir('~/CapsuleTestDir')){
			Capsule.makeDir('~/CapsuleTestDir/subDir/');
			Capsule.makeDir('~/CapsuleTestDir/emptySubDirToDelete/');
			Capsule.makeDir('~/CapsuleTestDir/subDirToDelete/');

			if (Capsule.copyFile('~/colbon.jpg','~/CapsuleTestDir/testCopiedImage.jpg')){
				console.log('copied image');
			}else{
				console.log('could not copy image');
			}

			var files = Capsule.readDir('~/CapsuleTestDir');
			for (var i in files){
				console.log(files[i] + ' isDir:' + Capsule.isDir('/'+files[i]) + ' isFile:' + Capsule.isFile('/'+files[i]));
				if (Capsule.isFile('~/CapsuleTestDir/' + files[i])){
					Capsule.copyFile('~/CapsuleTestDir/' + files[i], '~/CapsuleTestDir/subDirToDelete/' + files[i]);
					Capsule.moveFile('~/CapsuleTestDir/' + files[i], '~/CapsuleTestDir/subDir/' + files[i]);
				}
			}

			if (Capsule.deleteDir('~/CapsuleTestDir/subDirToDelete/')){
				console.log('deleted /CapsuleTestDir/subDirToDelete/');
			}else{
				console.log('could not delete /CapsuleTestDir/subDirToDelete/');
			}

			if (Capsule.deleteDir('~/CapsuleTestDir/emptySubDirToDelete/')){
				console.log('deleted /CapsuleTestDir/emptySubDirToDelete/');
			}else{
				console.log('could not delete /CapsuleTestDir/emptySubDirToDelete/');
			}

			Capsule.writeFile('~/CapsuleTestDir/testWrittenFile.txt','Hello World!');
			var readContents = Capsule.readFile('~/CapsuleTestDir/testWrittenFile.txt');
			console.log('Read File: ' + readContents);
		}else{
			console.log('could not make dir');
		}

		setTimeout( function(){
			Capsule.disableCloseWindowButton();
			Capsule.disableMinimizeWindowButton();
			Capsule.disableZoomWindowButton();
			Capsule.resizeWindow(0,0,500,600);
			Capsule.enableWindowResize();
			Capsule.setStatusBarIcon('img/defaultStatusBarIcon.png','img/defaultActiveStatusBarIcon.png');
		},3000);
	},3000);*/

	//Capsule.quit();

}, false);
