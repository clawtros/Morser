//
//  MorseAppDelegate.h
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright Saltmine Software 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MorseViewController;

@interface MorseAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MorseViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MorseViewController *viewController;

@end

