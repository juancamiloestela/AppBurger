//
//  Console.m
//  Burger
//
//  Created by Juan Camilo Estela on 11/23/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import "Console.h"

@implementation Console


+ (NSString *) webScriptNameForSelector:(SEL)sel {
    //NSLog(@"%@ received %@ with sel='%@'", self, NSStringFromSelector(_cmd), NSStringFromSelector(sel));
    if (sel == @selector(log:)) {
        return @"log";
    }else if(sel == @selector(warn:)){
        return @"warn";
    }else if(sel == @selector(error:)){
        return @"error";
    }
    return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)selector {
    return NO;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)property {
    return NO;
}



- (void)log: (NSString *) msg{
    NSLog(@"jslog: %@", msg);
}

- (void)error: (NSString *) msg {
    NSLog(@"jserror: %@", msg);
}

- (void)warn: (NSString *) msg {
    NSLog(@"jswarn: %@", msg);
}

@end
