//
//  SampleObject.m
//  CoreAnimationListView
//
//  Created by Patrick Geiller on 07/04/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "GistObject.h"


@implementation GistObject

@synthesize  description;//, angle, name;

- (id)init
{
	if (![super init])	return nil;
	
//	name		= @"Sample";
	description = @"description";
//	angle		= 123;
	
	return	self;
}


/* 
	Key Value Bastard Observing (KVBO) is everything below.
	
	We overload setValue:forKey: to listen to all changes.

	We save self and the key name to static variables with the class method setLastModifiedKey:forInstance:

	setValue:forKey: then sets a new value for a dummy key (keyChanged) on a shared instance (a singleton for the observed class, here SampleObject).
	Changing this dummy key's value dispatches KVO notifications of our shared instance :any observer of that shared instance will receive all notifications of all changes of all instances of SampleObject.
	
	To receive KVBO notifications, register as an observer on the shared instance's dummy key.
	You'll need to setup a dummy key, its set method will be the notification recipient of KVBO.

		[myObserver bind:@"myKey" toObject:[SampleObject sharedInstance] withKeyPath:@"keyChanged" options:nil];
		
	myObserver's setMyKey will then be called for each change of any attribute of any instance.
	
*/

//
// setValue:forKey:
//	overload to dispatch change notification to our shared instance
//
- (void)setValue:(id)value forKey:(NSString*)key
{
	[super setValue:value forKey:key];
	
	// If this is the shared instance, don't go any further
	if (self == [GistObject sharedInstance])	return;
	
	// Class method - set last modified
	[GistObject setLastModifiedKey:key forInstance:self];

	// Instance method - dummy setValue to dispatch notifications 
	[[GistObject sharedInstance] setValue:self forKey:@"keyChanged"];
}



//
// sharedInstance
//	returns our the singleton instance that will be used for global observing
//
+ (GistObject*)sharedInstance
{
	static GistObject* singleton;
	@synchronized(self)
	{
		if (!singleton)
			singleton = [[GistObject alloc] init];
		return singleton;
	}
	return singleton;
}

//
// class methods for last modified key and instance - these are held as static data
//
static GistObject* lastModifiedInstance;
static NSString* lastModifiedKey;
+ (void)setLastModifiedKey:(NSString*)key forInstance:(id)object
{
	lastModifiedKey			= key;
	lastModifiedInstance	= object;
}
+ (GistObject*)lastModifiedInstance
{
	return lastModifiedInstance;
}
+ (NSString*)lastModifiedKey
{
	return lastModifiedKey;
}

// keyChanged - dummy key set by setValue:forKey: on our shared instance, used to dispatch KVO notifications
- (GistObject*)keyChanged
{
	return [GistObject sharedInstance];
}
- (void)setKeyChanged:(GistObject*)sampleObject
{
}


@end
