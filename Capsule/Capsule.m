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
