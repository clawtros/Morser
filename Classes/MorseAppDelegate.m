//
//  MorseAppDelegate.m
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright Saltmine Software 2009. All rights reserved.
//

#import "MorseAppDelegate.h"
#import "MorseViewController.h"

@implementation MorseAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
