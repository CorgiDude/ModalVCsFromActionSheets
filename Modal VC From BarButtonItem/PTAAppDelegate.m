//
//  PTAAppDelegate.m
//  Modal VC From BarButtonItem
//
//  Created by Andrew Wilcox on 2012-Nov-14.
//  Copyright (c) 2012 Wilcox Technologies LLC. All rights reserved.
//

#import "PTAAppDelegate.h"
#import "PTAMainViewController.h"

@implementation PTAAppDelegate

- (void)dealloc
{
	[_window release];
	[super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	// Override point for customization after application launch.
	PTAMainViewController *mainVC = [[PTAMainViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:mainVC];
	[mainVC release];
	self.window.rootViewController = navi;
	[navi release];
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
