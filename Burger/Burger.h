//
//  App.h
//  Burger
//
//  Created by Juan Camilo Estela on 11/23/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebView.h>

@interface Burger : NSObject{
    NSWindow *appWindow;
    NSUserDefaults * userData;
    NSStatusItem * appStatusBar;
    NSFileManager *fileManager;
    WebView *appWebView;
}

- (void) show;
- (void) hide;
- (void) setAppWindow:(NSWindow *) win;
- (void) setAppWebView:(WebView *) webView;
- (void) setAppStatusBar:(NSStatusItem *) statusItem;
- (void) triggerCallback:(id)sender;
@end
