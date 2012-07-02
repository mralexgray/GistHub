//
//  GHAppDelegate.m
//  GistHub
//
//  Created by Alex Gray on 7/2/12.
//  Copyright (c) 2012 mrgray.com, inc. All rights reserved.
//

#import "GHAppDelegate.h"
#import	<UAGithubEngine/UAGithubEngine.h>
#import "GistObject.h"
#import <AtoZ/AtoZ.h>


/**	Gist fields: 	description,	comments,	id,		"created_at",	url,
					files,			"git_push_url",		"html_url",		
					"updated_at",	"git_pull_url", 	user,			public
*/

@implementation GHAppDelegate

- (id)init
{
	if (![super init])	return nil;
	
	engine = [[UAGithubEngine alloc] initWithUsername:@"mralexgray" password:@"ag979390" withReachability:YES];
	content = [NSMutableArray array];
	[engine	 gistsWithSuccess:^(id gists) { 	// big block of gists/
		for (id thing in gists) {   			// array of gist dicts.
			NSLog(@"%@", [thing allValues]);
			GistObject *new = [GistObject new];
			new.description = [thing valueForKey:@"description"];
			 NSLog(@"A RANDO : %@", [[thing allKeys]randomElement] );
			[content addObject:new];
		}
	} failure:^(NSError *e) {
		NSLog(@"error");
	}];
//		
//		GistObject *g = [[GistObject alloc]init];
//		g.description = [gist valueForKey:@"description"];
//		[content addObject:g];
//		NSLog(@"added gist, %@", g.description);
//	} failure:^(NSError *e) {
//		NSLog(@"Error: %@", e);
//	}];

//	repositoriesWithSuccess:^(id obj) { 
//				[content addObject:obj];
				
	//			NSLog(@"%ld: %@, class: %@",idx, obj, [obj allKeys]);
//		}];
//
//	content = [NSMutableArray arrayWithArray: [[DBXObject sharedInstance].sortedApps arrayUsingBlock:^id(id obj) {
//		SampleObject* object;
//		object = [[SampleObject alloc]init];
//		object.name = [obj valueForKey:@"name"];
//		object.description = [obj valueForKey:@"icon"];//@"This is an example";
//		object.color = [obj valueForKey:@"color"];// [NSColor colorWithDeviceRed:1.0 green:0.5 blue:0.5 
//		object.app = obj;
//		//	/	alpha:1.0];
//		//		[objects addObject:object];
//		return  object;
//	}]];
	
	return self;
}

-(void) awakeFromNib {
	
	// Observe changes to the controller's objects array, 
//	[caListView bind:@"objects" toObject:arrayController withKeyPath:@"arrangedObjects" options:nil];
	// and to each key of each instance of SampleObject
//	[caListView bind:@"objectsKeyChanged" toObject:[SampleObject sharedInstance] withKeyPath:@"keyChanged" options:nil];
	
	
	// Setup drag and drop our tableview
//	[tableView registerForDraggedTypes:[NSArray arrayWithObject:SampleObjectDataType] ];
//	[tableView setDataSource:(id)self];

}

-(void) applicationDidFinishLaunching:(NSNotification *)notification {


//	engine = [[UAGithubEngine alloc] initWithUsername:@"mralexgray" password:@"ag979390" withReachability:YES];
//	
//	[engine repositoriesWithSuccess:^(id obj) { 
//	[obj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//		NSLog(@"%ld: %@, class: %@",idx, obj, [obj allKeys]);
//	}];
//	NSLog(@"Class: %@",  [obj class]);
//	self.content = [[NSMutableDictionary alloc]initWithObjects:[obj allValues] forKeys:[obj allKeys] count:[obj count]];
//	content = obj;
//		NSLog(@"Got an array of repos: %@", obj); 
//	} failure:^(NSError *error) { 
//		NSLog(@"Oops: %@", error);
//	}];  
	
//	[engine user:@"this_guy" isCollaboratorForRepository:@"UAGithubEngine" success:^(BOOL collaborates) { 
//		NSLog(@"%d", collaborates); 
//	} failure:^(NSError *error){ 
//		NSLog(@"D'oh: %@", error); 
//	}];

}
@end
