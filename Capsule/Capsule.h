//
//  App.h
//  Capsule
//
//  Created by Juan Camilo Estela on 11/23/12.
//  Copyright (c) 2012 Juan Camilo Estela. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Capsule : NSObject{
    NSWindow *appWindow;
    NSUserDefaults * userData;
}

/*- (NSString *) get:(NSString *) url;
- (NSString *) post:(NSString *) url withXMLDataString: (NSString *) xmlString;*/


- (void) show;
- (void) hide;
- (void) setAppWindow:(NSWindow *) win;
@end
