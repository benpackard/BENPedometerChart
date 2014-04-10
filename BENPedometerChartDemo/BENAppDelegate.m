//
//  BENAppDelegate.m
//  BENPedometerChartDemo
//
//  Created by Ben Packard on 4/10/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENAppDelegate.h"

//controllers
#import "BENDemoController.h"

@implementation BENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	BENDemoController *controller = [[BENDemoController alloc] initWithNibName:nil bundle:nil];
	self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
