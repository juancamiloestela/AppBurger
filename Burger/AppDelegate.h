//
//  AppDelegate.h
//  Burger
//
//  Created by Juan Camilo Estela on 10/29/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>
#import <WebKit/WebKit.h>
#import "Burger.h"
#import "Console.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,NSXMLParserDelegate, NSUserNotificationCenterDelegate,WebOpenPanelResultListener>{
    IBOutlet NSMenu *statusMenu;
    IBOutlet NSMenu *appMenu;
    IBOutlet WebView *webView;
    NSStatusItem *statusItem;
    Burger *appInstance;
    Console *consoleInstance;
    NSDictionary *configData;
    NSImageView *splashImageView;
}

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;


- (IBAction)openAppWindow:(id)sender;

@end
