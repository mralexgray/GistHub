//
//  GHAppDelegate.h
//  GistHub
//
//  Created by Alex Gray on 7/2/12.
//  Copyright (c) 2012 mrgray.com, inc. All rights reserved.
//

#import <Foundation/Foundation.h> 
//#import 	"/Volumes/2T/ServiceData/dev/GistHub/DerivedData/GistHub/Build/Products/Debug/UAGithubEngine.framework/Versions/A/Headers/UAGithubEngine.h"
/** a gust is 
 description,
 "pushed_at",
 language,
 fork,
 url,
 "open_issues",
 "updated_at",
 owner,
 "has_downloads",
 "mirror_url",
 private,
 "git_url",
 forks,
 name,
 homepage,
 "svn_url",
 size,
 watchers,
 id,
 "has_wiki",
 "full_name",
 "ssh_url",
 "has_issues",
 permissions,
 "clone_url",
 "created_at",
 "html_url"
*/
@class UAGithubEngine;
@interface GHAppDelegate : NSObject  <NSApplicationDelegate, NSWindowDelegate>
{
	UAGithubEngine *engine;
	IBOutlet 	NSWindow *window;
	IBOutlet	NSArrayController*	arrayController;
				NSMutableArray *content;
	IBOutlet	NSTableView *tv;
}
@end
