//
//  AppDelegate.m
//  Burger
//
//  Created by Juan Camilo Estela on 10/29/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import <Carbon/Carbon.h>
#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_persistentStoreCoordinator release];
    [_managedObjectModel release];
    [_managedObjectContext release];
    [super dealloc];
}

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
}

typedef struct
{
    // Where to add window information
    NSMutableArray * outputArray;
    // Tracks the index of the window when first inserted
    // so that we can always request that the windows be drawn in order.
    int order;
} WindowListApplierData;



-(void)awakeFromNib{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    configData = [[NSDictionary dictionaryWithContentsOfFile:path] retain];
    
    if ([[configData objectForKey:@"allowWebkitDebug"] boolValue]){
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"WebKitDeveloperExtras"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"WebKitDeveloperExtras"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSString *hex = [configData objectForKey:@"splashBackgroundColor"] ? : @"#ffffff";
    hex = [hex substringWithRange:NSMakeRange(1, [hex length] - 1)];
	unsigned int colorCode = 0;
	if (hex) {
		NSScanner *scanner = [NSScanner scannerWithString:hex];
		(void)[scanner scanHexInt:&colorCode];
	}

    NSColor *backgroundColor = [NSColor colorWithDeviceRed:((colorCode>>16)&0xFF)/255.0 green:((colorCode>>8)&0xFF)/255.0 blue:((colorCode)&0xFF)/255.0 alpha:1.0];
    [self.window setBackgroundColor: backgroundColor];
    
    NSImage *splashImage = [NSImage imageNamed:([configData objectForKey:@"splashScreenImage"] ? : @"splash-screen.png")];
    if (splashImage){
        splashImageView = [[NSImageView alloc] initWithFrame:[[[self window] contentView] frame]];
        [splashImageView setWantsLayer: YES];
        [splashImageView.layer setBackgroundColor: backgroundColor.CGColor];
        splashImageView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [splashImageView setImage:splashImage];
        [[[self window] contentView] addSubview:splashImageView];
    }

    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    [statusItem setMenu:statusMenu];
    [statusItem setTitle:@"Burger"];
    [statusItem setHighlightMode:YES];
    
    NSString *startPage = [configData objectForKey:@"startPage"] ? : @"index.html";
    NSString *indexPath;
    if ([startPage hasPrefix:@"http://"]){
        // is external
        indexPath = startPage;
    }else{
        NSString *resourceName = [startPage stringByDeletingPathExtension];
        indexPath = [[NSBundle mainBundle] pathForResource:resourceName ofType:@"html" inDirectory:@"www"];
    }
    
    //webView = [[AppWebView alloc] initWithFrame:[[[self window] contentView] bounds]];
    [webView setMainFrameURL:indexPath];
    [[[self window] contentView] addSubview:webView];
    
    [webView setFrameLoadDelegate:self];
	[webView setUIDelegate: self];
    [webView setPolicyDelegate:self];
    
    appInstance = [[Burger alloc] init];
    consoleInstance = [[Console alloc] init];
    
    [appInstance setAppWindow:[self window]];
    [appInstance setAppStatusBar:statusItem];
    
    
/*    NSSavePanel * savePanel = [NSSavePanel savePanel];
    // Restrict the file type to whatever you like
    [savePanel setAllowedFileTypes:@[@"txt"]];
    // Set the starting directory
    //[savePanel setDirectoryURL:someURL];
    // Perform other setup
    // Use a completion handler -- this is a block which takes one argument
    // which corresponds to the button that was clicked
    [savePanel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            // Close panel before handling errors
            [savePanel orderOut:self];
            // Do what you need to do with the selected path
        }
    }];*/
    
    /*NSString *name = @"filename";
    
    // Set the default name for the file and show the panel.
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    [savePanel setNameFieldStringValue:name];
    [savePanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton)
        {
            NSLog(@"Saving %@", [savePanel URL]);
            // Write the contents in the new format.
        }
    }];*/
    
    
    
    
    // create an open documet panel
    /*NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanChooseFiles:YES];
    [openPanel setMessage:@"Import one or more files or directories."];*/
    
    // display the panel
    /*[panel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            
            NSLog(@"Selected %@", [panel URLs]);
            
            // grab a reference to what has been selected
            NSURL *theDocument = [[panel URLs] objectAtIndex:0];
            
            // write our file name to a label
            NSString *theString = [NSString stringWithFormat:@"%@", theDocument];
            NSLog(@"Opened %@", theString);
            
        }
    }];*/
    
    /*[openPanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSLog(@"Selected %@", [openPanel URLs]);
        }
        
    }];*/
}

- (IBAction)openAppWindow:(id)sender {
    [appInstance show];
}
- (IBAction)quitApp:(id)sender {
    [NSApp terminate:self];
}

- (void) webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame{
    NSScrollView *mainScrollView = sender.mainFrame.frameView.documentView.enclosingScrollView;
    [mainScrollView setVerticalScrollElasticity:NSScrollElasticityNone];
    [mainScrollView setHorizontalScrollElasticity:NSScrollElasticityNone];
    
    [appInstance setAppWebView:sender];
    [sender stringByEvaluatingJavaScriptFromString:@"document.dispatchEvent(BurgerReadyEvent);"];
    [splashImageView removeFromSuperview];
}


- (void)webView:(WebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message {
    NSAlert *alert = [[[NSAlert alloc] init] autorelease];
    [alert setMessageText:message];
    [alert runModal];
}


- (void)webView:(WebView *)webView
decidePolicyForNavigationAction:(NSDictionary *)actionInformation
        request:(NSURLRequest *)request
          frame:(WebFrame *)frame
decisionListener:(id <WebPolicyDecisionListener>)listener
{
    NSLog(@"Navigating to %@", [request URL]);
    [listener use];
}

- (void)webView:(WebView *)webView
decidePolicyForNewWindowAction:(NSDictionary *)actionInformation
        request:(NSURLRequest *)request
   newFrameName:(NSString *)frameName
decisionListener:(id < WebPolicyDecisionListener >)listener {
    if ([actionInformation objectForKey:WebActionElementKey]) {
        NSLog(@"Opening in browser %@", [request URL]);
        [[NSWorkspace sharedWorkspace] openURL:[request URL]];
    }
}



/* this message is sent to the WebView's frame load delegate
 when the page is ready for JavaScript.  It will be called just after
 the page has loaded, but just before any JavaScripts start running on the
 page.  This is the perfect time to install any of your own JavaScript
 objects on the page.
 */
- (void)webView:(WebView *)webView windowScriptObjectAvailable:(WebScriptObject *)windowScriptObject {
	//NSLog(@"%@ received %@", self, NSStringFromSelector(_cmd));
    
    /* here we'll add our object to the window object as an object named
     'console'.  We can use this object in JavaScript by referencing the 'console'
     property of the 'window' object.   */
    [windowScriptObject setValue:consoleInstance forKey:@"console"];
    [windowScriptObject setValue:appInstance forKey:@"cBurger"];
}

- (id)invokeDefaultMethodWithArguments:(NSArray *)args{
    NSLog(@"invoke default method");    
    return nil;
}

- (id)invokeUndefinedMethodFromWebScript:(NSString *)name withArguments:(NSArray *)args{
    NSLog(@"invoke undefined method %@",name);
    return nil;
}





- (NSURL *)applicationFilesDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *appSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [appSupportURL URLByAppendingPathComponent:[[NSBundle mainBundle] bundleIdentifier]];
}

// Creates if necessary and returns the managed object model for the application.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Burger" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSManagedObjectModel *mom = [self managedObjectModel];
    if (!mom) {
        NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationFilesDirectory = [self applicationFilesDirectory];
    NSError *error = nil;
    
    NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    
    if (!properties) {
        BOOL ok = NO;
        if ([error code] == NSFileReadNoSuchFileError) {
            ok = [fileManager createDirectoryAtPath:[applicationFilesDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
        }
        if (!ok) {
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    } else {
        if (![properties[NSURLIsDirectoryKey] boolValue]) {
            // Customize and localize this error.
            NSString *failureDescription = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationFilesDirectory path]];
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:failureDescription forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:101 userInfo:dict];
            
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    
    NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent:@"Burger.storedata"];
    NSPersistentStoreCoordinator *coordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom] autorelease];
    if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _persistentStoreCoordinator = [coordinator retain];
    
    return _persistentStoreCoordinator;
}

// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) 
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"Failed to initialize the store" forKey:NSLocalizedDescriptionKey];
        [dict setValue:@"There was an error building up the data file." forKey:NSLocalizedFailureReasonErrorKey];
        NSError *error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];

    return _managedObjectContext;
}

// Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window
{
    return [[self managedObjectContext] undoManager];
}

// Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
- (IBAction)saveAction:(id)sender
{
    NSError *error = nil;
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    if (![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Save changes in the application's managed object context before the application terminates.
    
    if (!_managedObjectContext) {
        return NSTerminateNow;
    }
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (![[self managedObjectContext] hasChanges]) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {

        // Customize this code block to include application-specific recovery steps.              
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }

        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[[NSAlert alloc] init] autorelease];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertAlternateReturn) {
            return NSTerminateCancel;
        }
    }

    return NSTerminateNow;
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}


@end
