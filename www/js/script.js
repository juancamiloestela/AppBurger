

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

	
	Capsule.hideDockIcon();
	Capsule.hideCloseWindowButton();
	Capsule.hideMinimizeWindowButton();
	Capsule.hideZoomWindowButton();

	setTimeout(function(){
		console.log('showing');
		Capsule.showDockIcon();
		Capsule.showCloseWindowButton();
		Capsule.showMinimizeWindowButton();
		Capsule.showZoomWindowButton();
		Capsule.centerWindow();
		Capsule.disableWindowResize();
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
	},3000);

	//Capsule.quit();




	myApp.init();
}, false);