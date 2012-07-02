//
//  SampleObject.h
//  CoreAnimationListView
//
//  Created by Patrick Geiller on 07/04/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface GistObject : NSObject {

//	NSString*	;
//	NSString*	description;
//	float		angle;
}

// Shared instance is the object modified after each key change
+ (GistObject*)sharedInstance;
// After being notified of change to the shared instance, call this to get last modified key of last modified instance
+ (GistObject*)lastModifiedInstance;
+ (NSString*)lastModifiedKey;
+ (void)setLastModifiedKey:(NSString*)key forInstance:(id)object;


//@property (copy)	NSString*	name;
@property (copy)	NSString*	description;
//@property			float		angle;

@end
