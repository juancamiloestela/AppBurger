//
//  App.m
//  Capsule
//
//  Created by Juan Camilo Estela on 11/23/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import "Capsule.h"

@implementation Capsule

- (id) init{
    userData = [NSUserDefaults standardUserDefaults];
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
    }else if(sel == @selector(hideIconInDock:)){
        return @"hideIconInDock";
    }else if(sel == @selector(showIconInDock:)){
        return @"showIconInDock";
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
    }else if(sel == @selector(center:)){
        return @"center";
    }else if(sel == @selector(resizeWindowAtX:andY:andWidth:andHeight:)){
        return @"resizeWindow";
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

- (void) setUserDataWithKey:(NSString *)key andValue:(NSString *) value{
    NSLog(@"setting user data %@: %@",key,value);
    [userData setObject:value forKey:key];
}

- (NSString *) getUserDataWithKey:(NSString *)key {
    NSLog(@"getting user data %@",key);
    return [userData stringForKey:key];
}

- (void) hideIconInDock{
    NSLog(@"hide icon dock");
    ProcessSerialNumber psn = { 0, kCurrentProcess };;
    TransformProcessType(&psn, kProcessTransformToUIElementApplication);
}

- (void) showIconInDock{
    NSLog(@"show icon dock");
    ProcessSerialNumber psn = { 0, kCurrentProcess };
	TransformProcessType(&psn, kProcessTransformToForegroundApplication);
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
