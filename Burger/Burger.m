//
//  App.m
//  Burger
//
//  Created by Juan Camilo Estela on 11/23/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import "Burger.h"
#import "BurgerMenuItem.h"



@implementation Burger

- (id) init{
    userData = [NSUserDefaults standardUserDefaults];
    fileManager = [NSFileManager defaultManager];
    
    return self;
}


+ (NSString *) webScriptNameForSelector:(SEL)sel {
    if (sel == @selector(get:)) {
        return @"get";
    }else if(sel == @selector(post:withXMLDataString:)){
        return @"post";
    }else if(sel == @selector(put:)){
        return @"put";
    }else if(sel == @selector(delete:)){
        return @"delete";
    }else if(sel == @selector(hide:)){
        return @"hide";
    }else if(sel == @selector(show:)){
        return @"show";
    }else if(sel == @selector(setUserDataWithKey:andValue:)){
        return @"setUserData";
    }else if(sel == @selector(getUserDataWithKey:)){
        return @"getUserData";
    }else if(sel == @selector(isRunningOnBrowser:)){
        return @"isRunningOnBrowser";
    }else if(sel == @selector(hideDockIcon:)){
        return @"hideDockIcon";
    }else if(sel == @selector(showDockIcon:)){
        return @"showDockIcon";
    }else if(sel == @selector(setDockIcon:)){
        return @"setDockIcon";
    }else if(sel == @selector(quit:)){
        return @"quit";
    }else if(sel == @selector(hideCloseWindowButton:)){
        return @"hideCloseWindowButton";
    }else if(sel == @selector(showCloseWindowButton:)){
        return @"showCloseWindowButton";
    }else if(sel == @selector(hideMinimizeWindowButton:)){
        return @"hideMinimizeWindowButton";
    }else if(sel == @selector(showMinimizeWindowButton:)){
        return @"showMinimizeWindowButton";
    }else if(sel == @selector(hideZoomWindowButton:)){
        return @"hideZoomWindowButton";
    }else if(sel == @selector(showZoomWindowButton:)){
        return @"showZoomWindowButton";
    }else if(sel == @selector(disableCloseWindowButton:)){
        return @"disableCloseWindowButton";
    }else if(sel == @selector(enableCloseWindowButton:)){
        return @"enableCloseWindowButton";
    }else if(sel == @selector(disableMinimizeWindowButton:)){
        return @"disableMinimizeWindowButton";
    }else if(sel == @selector(enableMinimizeWindowButton:)){
        return @"enableMinimizeWindowButton";
    }else if(sel == @selector(disableZoomWindowButton:)){
        return @"disableZoomWindowButton";
    }else if(sel == @selector(enableZoomWindowButton:)){
        return @"enableZoomWindowButton";
    }else if(sel == @selector(minimizeWindow:)){
        return @"minimizeWindow";
    }else if(sel == @selector(unminimizeWindow:)){
        return @"unminimizeWindow";
    }else if(sel == @selector(centerWindow:)){
        return @"centerWindow";
    }else if(sel == @selector(resizeWindowAtX:andY:andWidth:andHeight:)){
        return @"resizeWindow";
    }else if(sel == @selector(setWindowX:)){
        return @"setWindowX";
    }else if(sel == @selector(setWindowY:)){
        return @"setWindowY";
    }else if(sel == @selector(setWindowWidth:)){
        return @"setWindowWidth";
    }else if(sel == @selector(setWindowHeight:)){
        return @"setWindowHeight";
    }else if(sel == @selector(disableWindowResize:)){
        return @"disableWindowResize";
    }else if(sel == @selector(enableWindowResize:)){
        return @"enableWindowResize";
    }else if(sel == @selector(hideWindowTitleBar:)){
        return @"hideWindowTitleBar";
    }else if(sel == @selector(showWindowTitleBar:)){
        return @"showWindowTitleBar";
    }else if(sel == @selector(setWindowTitle:)){
        return @"setWindowTitle";
    }else if(sel == @selector(getWindowTitle:)){
        return @"getWindowTitle";
    }else if(sel == @selector(allowWebkitDebug:)){
        return @"allowWebkitDebug";
    }else if(sel == @selector(getCurrentUsername:)){
        return @"getCurrentUsername";
    }else if(sel == @selector(addStatusBarItem:withCallbackNamed:)){
        return @"addStatusBarItem";
    }else if(sel == @selector(removeStatusBarItem:)){
        return @"removeStatusBarItem";
    }else if(sel == @selector(setStatusBarIcon:withActiveIcon:)){
        return @"setStatusBarIcon";
    }else if (sel == @selector(setStatusBarLabel:)){
        return @"setStatusBarLabel";
    }else if (sel == @selector(getAppPath:)){
        return @"getAppPath";
    }else if (sel == @selector(getResourcePath:)){
        return @"getResourcePath";
    }else if (sel == @selector(getWebRootPath:)){
        return @"getWebRootPath";
    }else if (sel == @selector(getCwd:)){
        return @"getCwd";
    }else if (sel == @selector(setCwd:)){
        return @"setCwd";
    }else if (sel == @selector(isDir:)){
        return @"isDir";
    }else if (sel == @selector(isFile:)){
        return @"isFile";
    }else if (sel == @selector(readDir:)){
        return @"readDir";
    }else if (sel == @selector(makeDir:)){
        return @"makeDir";
    }else if (sel == @selector(deleteDir:)){
        return @"deleteDir";
    }else if (sel == @selector(readFile:)){
        return @"readFile";
    }else if (sel == @selector(writeFile:withContents:andMode:)){
        return @"writeFile";
    }else if (sel == @selector(deleteFile:)){
        return @"deleteFile";
    }else if (sel == @selector(copyFile:to:)){
        return @"copyFile";
    }else if (sel == @selector(moveFile:to:)){
        return @"moveFile";
    }else if (sel == @selector(download:to:)){
        return @"download";
    }else if (sel == @selector(unzip:to:)){
        return @"unzip";
    }else if (sel == @selector(getAppSupportPath:)){
        return @"getAppSupportPath";
    }else if (sel == @selector(sendNotificationWithTitle:andMessage:withSound:)){
        return @"sendNotification";
    }else if (sel == @selector(bounceDockIcon:)){
        return @"bounceDockIcon";
    }else if (sel == @selector(showSaveDialog:)){
        return @"showSaveDialog";
    }else if (sel == @selector(showOpenDialog:canChooseDirectories:canChooseFiles:allowsMultipleSelection:withMessage:)){
        return @"showOpenDialog";
    }else if (sel == @selector(showSaveDialog:withFilename:)){
        return @"showSaveDialog";
    }
    return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)selector {
    return NO;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)property {
    return NO;
}

- (BOOL)isRunningOnBrowser{
    return NO;
}

- (NSImage *) getImage: (NSString *)imagePath{
    NSImage *image = nil;
    
    if ([imagePath hasPrefix:@"http"]){
        image = [[NSImage alloc] initByReferencingURL:[[NSURL alloc] initWithString:imagePath]];
    }else{
        NSString *resourceName = [[imagePath lastPathComponent] stringByDeletingPathExtension];
        NSString *resourceExt = [imagePath pathExtension];
        NSString *resourcePath = [imagePath stringByDeletingLastPathComponent];
        NSString *rootPath = @"www/";
        
        imagePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:resourceExt inDirectory: [NSString stringWithFormat:@"%@%@/",rootPath,resourcePath]];
        image = [[NSImage alloc] initByReferencingFile:imagePath];
    }
    
    return image;
}

- (void) setUserDataWithKey:(NSString *)key andValue:(NSString *) value{
    NSLog(@"setting user data %@: %@",key,value);
    [userData setObject:value forKey:key];
}

- (NSString *) getUserDataWithKey:(NSString *)key {
    NSLog(@"getting user data %@",key);
    return [userData stringForKey:key];
}

- (void) hideDockIcon{
    NSLog(@"hide icon dock");
    BOOL canHide = [appWindow canHide];
    [appWindow setCanHide:NO];
    ProcessSerialNumber psn = { 0, kCurrentProcess };;
    TransformProcessType(&psn, kProcessTransformToUIElementApplication);
    [appWindow setCanHide:canHide];
}

- (void) showDockIcon{
    NSLog(@"show icon dock");
    ProcessSerialNumber psn = { 0, kCurrentProcess };
	TransformProcessType(&psn, kProcessTransformToForegroundApplication);
}

- (void) setDockIcon: (NSString *) imagePath{
    [NSApp setApplicationIconImage: [self getImage:imagePath]];
}

- (void) quit{
    [NSApp terminate:self];
}

- (void) disableCloseWindowButton{
    [[appWindow standardWindowButton:NSWindowCloseButton] setEnabled:NO];
}

- (void) enableCloseWindowButton{
    [[appWindow standardWindowButton:NSWindowCloseButton] setEnabled:YES];
}

- (void) disableMinimizeWindowButton{
    [[appWindow standardWindowButton:NSWindowMiniaturizeButton] setEnabled:NO];
}

- (void) enableMinimizeWindowButton{
    [[appWindow standardWindowButton:NSWindowMiniaturizeButton] setEnabled:YES];
}

- (void) disableZoomWindowButton{
    [[appWindow standardWindowButton:NSWindowZoomButton] setEnabled:NO];
}

- (void) enableZoomWindowButton{
    [[appWindow standardWindowButton:NSWindowZoomButton] setEnabled:YES];
}


- (void) hideCloseWindowButton{
    [[appWindow standardWindowButton:NSWindowCloseButton] setHidden:YES];
}

- (void) showCloseWindowButton{
    [[appWindow standardWindowButton:NSWindowCloseButton] setHidden:NO];
}

- (void) hideMinimizeWindowButton{
    [[appWindow standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];
}

- (void) showMinimizeWindowButton{
    [[appWindow standardWindowButton:NSWindowMiniaturizeButton] setHidden:NO];
}

- (void) hideZoomWindowButton{
    [[appWindow standardWindowButton:NSWindowZoomButton] setHidden:YES];
}

- (void) showZoomWindowButton{
    [[appWindow standardWindowButton:NSWindowZoomButton] setHidden:NO];
}

- (void) minimizeWindow{
    [appWindow miniaturize:self];
}

- (void) unminimizeWindow{
    [appWindow deminiaturize:self];
}

- (void) centerWindow{
    [appWindow center];
}

- (void) resizeWindowAtX:(float)x andY:(float)y andWidth:(float)width andHeight:(float)height{
    [appWindow setFrame:NSMakeRect(x, y, width, height) display:YES animate:YES];
}

- (void) setWindowX:(float)x{
    NSRect rect = NSMakeRect(x, [appWindow frame].origin.y, [appWindow frame].size.width, [appWindow frame].size.height);
    [appWindow setFrame:rect display:YES animate:YES];
}

- (void) setWindowY:(float)y{
    NSRect rect = NSMakeRect([appWindow frame].origin.x, y, [appWindow frame].size.width, [appWindow frame].size.height);
    [appWindow setFrame:rect display:YES animate:YES];
}

- (void) setWindowWidth:(float)w{
    NSRect rect = NSMakeRect([appWindow frame].origin.x, [appWindow frame].origin.y, w, [appWindow frame].size.height);
    [appWindow setFrame:rect display:YES animate:YES];
}

- (void) setWindowHeight:(float)h{
    NSRect rect = NSMakeRect([appWindow frame].origin.x, [appWindow frame].origin.y, [appWindow frame].size.width, h);
    [appWindow setFrame:rect display:YES animate:YES];
}

- (void) disableWindowResize{
    [appWindow setStyleMask:[appWindow styleMask] & ~NSResizableWindowMask];
}

- (void) enableWindowResize{
    [appWindow setStyleMask:[appWindow styleMask] | NSResizableWindowMask];
}

- (void) hideWindowTitleBar{
    [appWindow setStyleMask:NSBorderlessWindowMask];
}

- (void) showWindowTitleBar{
    [appWindow setStyleMask:NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask | NSMiniaturizableWindowMask];
}

- (void) setWindowTitle:(NSString *)title{
    [appWindow setTitle:title];
}

- (NSString *)getWindowTitle{
    return [appWindow title];
}

- (void) allowWebkitDebug{
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"WebKitDeveloperExtras"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *) getCurrentUsername{
    return NSUserName();
}




- (int) addStatusBarItem:(NSString *)label withCallbackNamed:(NSString *)callbackId{
    NSLog(@"Added status bar item %@, %@",label,callbackId);
    
    if (!appStatusBar){
        return NO;
    }
    
    BurgerMenuItem *menuItem = [[BurgerMenuItem alloc] initWithTitle:label action:@selector(triggerCallback:) keyEquivalent:@""];
    [menuItem setTarget:self];
    [menuItem setCallbackId:callbackId];
    [[appStatusBar menu] addItem:menuItem];
    return YES;
}

- (BOOL) removeStatusBarItem:(NSString *)label{
    if (!appStatusBar){
        return NO;
    }
    
    return YES;
}

- (void) triggerCallback:(id)sender{
    BurgerMenuItem *menuItem = (BurgerMenuItem *)sender;
    NSLog(@"Triggering Callback %@", menuItem.callbackId);
    
    NSString *js = [NSString stringWithFormat:@"Burger._triggerCallback('%@');", menuItem.callbackId];
    [appWebView stringByEvaluatingJavaScriptFromString:js];
}

- (void) setStatusBarIcon:(NSString *)imagePath withActiveIcon:(NSString *)activeImagePath{
    if (!appStatusBar){
        return;
    }
    
    [appStatusBar setImage:[self getImage:imagePath]];
    [appStatusBar setAlternateImage:[self getImage:activeImagePath]];
}

- (void) setStatusBarLabel:(NSString *)text{
    if (!appStatusBar){
        return;
    }
    
    [appStatusBar setTitle:text];
}


- (NSString *) getWebRootPath{
    NSBundle *mainBundle = [NSBundle mainBundle];
    return [[mainBundle resourcePath] stringByAppendingString:@"/www"];
}

- (NSString *) getResourcePath{
    NSBundle *mainBundle = [NSBundle mainBundle];
    return [mainBundle resourcePath];
}

- (NSString *) getAppPath{
    NSBundle *mainBundle = [NSBundle mainBundle];
    return [mainBundle bundlePath];
}

- (NSString *) getCwd{
    NSLog (@"Current directory is %@", [fileManager currentDirectoryPath]);
    return [fileManager currentDirectoryPath];
}

- (BOOL) setCwd:(NSString *) path{
    NSLog(@"setCwd %@",path);    
    path = [path stringByExpandingTildeInPath];
    if ([fileManager changeCurrentDirectoryPath: path]){
        NSLog (@"Current directory is %@", [fileManager currentDirectoryPath]);
        return YES;
    }else{
        NSLog (@"Cannot change directory.");
        return NO;
    }
}

- (BOOL) isDir:(NSString *)path{
    NSLog(@"isDir %@",path);    
    path = [path stringByExpandingTildeInPath];
    BOOL isDir;
    BOOL fileExists = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if (fileExists){
        return isDir;
    }
    return NO;
}

- (BOOL) isFile:(NSString *)path{
    NSLog(@"isFile %@",path);    
    path = [path stringByExpandingTildeInPath];
    return ![self isDir:path];
}

- (NSArray *) readDir:(NSString *)path{
    NSLog(@"readDir %@",path);    
    path = [path stringByExpandingTildeInPath];
    NSLog(@"reading dir %@",path);
    NSError *error = nil;
    if ([self setCwd:path]){
        return [fileManager contentsOfDirectoryAtPath:path error:&error];
    }
    return [[NSArray alloc] init];
}

- (BOOL) makeDir:(NSString *)path{
    NSLog(@"makeDir %@",path);
    path = [path stringByExpandingTildeInPath];
    NSError *error = nil;
    BOOL result = [fileManager createDirectoryAtPath: path withIntermediateDirectories:YES attributes: nil error:&error];
    if (result){
        NSLog(@"Created Dir: %@", path);
    }else{
        NSLog(@"Could not create Dir: %@", path);
    }
    return result;
}

- (BOOL) deleteDir:(NSString *)path{
    NSLog(@"deleteDir %@",path);
    path = [path stringByExpandingTildeInPath];
    NSError *error = nil;
    BOOL result = [fileManager removeItemAtPath:path error:&error];
    if (result){
        NSLog(@"Deleted Dir: %@", path);
    }else{
        NSLog(@"Could not delete Dir: %@", path);
    }
    return result;
}

- (NSString *)readFile:(NSString *)path{
    NSLog(@"readfile %@",path);
    path = [path stringByExpandingTildeInPath];
    if ([self isFile:path]){
        NSError *error = nil;
        NSString *str = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        if (error){
            NSLog(@"Error reading file!!");
        }
        return str;
    }
    NSLog(@"Could not read file %@\n", path);
    return @"";
}

- (BOOL) writeFile: (NSString *)path withContents:(NSString *)content andMode:(NSString *)mode{
    NSLog(@"write %@",path);
    // TODO: implement mode
    path = [path stringByExpandingTildeInPath];
    NSError *error = nil;
    BOOL result = [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result){
        NSLog(@"Wrote file %@\n",path);
    }else{
        NSLog(@"Could not write file %@\n",path);
    }
    return result;
}

- (BOOL) deleteFile: (NSString *)path{
    NSLog(@"deletefile %@",path);
    path = [path stringByExpandingTildeInPath];
    NSError *error = nil;
    return [fileManager removeItemAtPath:path error:&error];
}

- (BOOL) copyFile: (NSString *)path to:(NSString *)targetPath{
    NSLog(@"copyfile %@",path);
    path = [path stringByExpandingTildeInPath];
    targetPath = [targetPath stringByExpandingTildeInPath];
    NSError *error = nil;
    BOOL result = [fileManager copyItemAtPath:path toPath:targetPath error:&error];
    if (result){
        NSLog(@"Copied file %@ to %@\n",path, targetPath);
    }else{
        NSLog(@"Could not copy file %@ to %@\n",path, targetPath);
        NSLog(@"%@\n",error);
    }
    return result;
}

- (BOOL) moveFile: (NSString *)path to:(NSString *)targetPath{
    NSLog(@"movefile %@",path);
    path = [path stringByExpandingTildeInPath];
    targetPath = [targetPath stringByExpandingTildeInPath];
    
    if ([fileManager fileExistsAtPath:path]) {
        NSLog(@"%@ Exists\n", path);
    }
    
    if ([fileManager fileExistsAtPath:targetPath]) {
        NSLog(@"%@ Exists\n", targetPath);
    }
    
    NSError *error = nil;
    BOOL result = [fileManager moveItemAtPath:path toPath:targetPath error:&error];
    if (result){
        NSLog(@"Moved file %@ to %@\n",path, targetPath);
    }else{
        NSLog(@"Could not move file %@ to %@\n",path, targetPath);
    }
    return result;
}

- (BOOL) download: (NSString *)url to:(NSString *)targetPath{
    NSLog(@"download %@ to %@",url,targetPath);
    NSError* error = nil;
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url] options:NSDataReadingUncached error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        return false;
    } else {
        NSLog(@"Data has loaded successfully.");
        // TODO get file name and extension, if no targetPath filename use same as source
        
        NSString *dirPath = [targetPath stringByDeletingLastPathComponent];

        NSError *error = nil;
        BOOL success = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    
        if (!success) {
            NSLog(@"Failed to create directory with error: %@", [error description]);
        }
        
        return [data writeToFile:targetPath atomically:YES];
    }
}

- (void) unzip: (NSString *)source to:(NSString *)targetFolder{
    NSFileManager* fm = [NSFileManager defaultManager];
    
    [fm createDirectoryAtPath:targetFolder withIntermediateDirectories:NO
                   attributes:nil error:NULL];

    NSArray *arguments = [NSArray arrayWithObject:source];
    NSTask *unzipTask = [[NSTask alloc] init];
    [unzipTask setLaunchPath:@"/usr/bin/unzip"];
    [unzipTask setCurrentDirectoryPath:targetFolder];
    [unzipTask setArguments:arguments];
    [unzipTask launch];
    //[unzipTask waitUntilExit];
}

- (NSString *) getAppSupportPath{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory,
                                                            NSUserDomainMask,
                                                            YES);
    
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"Burger"];
}

- (void) sendNotificationWithTitle: (NSString *) title andMessage: (NSString *) message withSound: (BOOL) sound{
    NSLog(@"sending notif");

    NSUserNotification *notification = [[NSUserNotification alloc] init];
    [notification setTitle: title];
    [notification setInformativeText: message];
    //[notification setDeliveryDate:[NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]]];
    
    if (sound){
        [notification setSoundName:NSUserNotificationDefaultSoundName];
    }else{
        [notification setSoundName:nil];
    }
    
    NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center deliverNotification:notification];
}

- (void) bounceDockIcon: (NSString *) type {
    NSInteger *request = NSInformationalRequest;
    
    if ([type isEqualToString:@"critical"]){
        request = NSCriticalRequest;
    }
    
    [NSApp requestUserAttention:request];
}

- (void) showSaveDialog:(NSString *) callbackId withFilename:(NSString *) filename {
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    [savePanel setNameFieldStringValue:filename];
    [savePanel setCanCreateDirectories:YES];
    
    [savePanel beginSheetModalForWindow:appWindow completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton)
        {
            NSLog(@"Saving %@", [savePanel URL]);
            NSString *js = @"";
            if (result == NSFileHandlingPanelOKButton) {
                js = [NSString stringWithFormat:@"Burger._triggerCallback('%@', '%@');", callbackId, [savePanel URL].path ];
            }else{
                js = [NSString stringWithFormat:@"Burger._triggerCallback('%@', false);", callbackId];
            }
            [appWebView stringByEvaluatingJavaScriptFromString:js];
        }
    }];
}

- (void) showOpenDialog: (NSString *) callbackId canChooseDirectories: (BOOL)d canChooseFiles: (BOOL) f allowsMultipleSelection: (BOOL) m withMessage: (NSString *) message{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:d];
    [openPanel setCanChooseFiles:f];
    [openPanel setAllowsMultipleSelection:m];
    [openPanel setMessage:message];
    [openPanel setCanCreateDirectories:YES];

    [openPanel beginSheetModalForWindow:appWindow completionHandler:^(NSInteger result){
        NSString *js = @"";
        if (result == NSFileHandlingPanelOKButton) {
            js = [NSString stringWithFormat:@"Burger._triggerCallback('%@', ['%@']);", callbackId, [[[openPanel URLs] valueForKey:@"path"] componentsJoinedByString:@"','"]];
        }else{
            js = [NSString stringWithFormat:@"Burger._triggerCallback('%@', false);", callbackId];
        }
        [appWebView stringByEvaluatingJavaScriptFromString:js];
    }];
}














- (NSString *) get:(NSString *) url{
    NSLog(@"Getting %@",url);
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &error];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    return responseString;
}

- (NSString *) post:(NSString *) url withXMLDataString: (NSString *) xmlString{
    NSLog(@"posting %@ - %@",url,xmlString);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/xml" forHTTPHeaderField:@"Content-type"];
    
    [request setValue:[NSString stringWithFormat:@"%ld",[xmlString length]] forHTTPHeaderField:@"Content-length"];
    
    [request setHTTPBody:[xmlString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Code: %ld", [urlResponse statusCode]);
    NSLog(@"Response: %@", result);
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
        NSLog(@"Response: %@", result);
    }

    return result;
}

- (NSString *) put:(NSString *) url{
    // WIP
    return @"putting";
}

- (NSString *) delete:(NSString *) url{
    // WIP
    return @"deleting";
}


- (void) setAppWindow:(NSWindow *) win{
    appWindow = win;
}

- (void) setAppWebView:(WebView *) webView{
    appWebView = webView;
}

- (void) setAppStatusBar:(NSStatusItem *) statusItem{
    appStatusBar = statusItem;
}

- (void) hide {
    NSLog(@"hide app");
    [appWindow orderOut:self];
}

- (void) show {
    NSLog(@"show app %@",appWindow);
    [appWindow makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
    [appWindow center];
}


@end
