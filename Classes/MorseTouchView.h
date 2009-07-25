//
//  MorseTouchView.h
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright 2009 Saltmine Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MorseViewController.h"
#import "MorseResultProcessorDelegate.h"

@protocol MorseTouchResultDelegate
@end;

@interface MorseTouchView : UIView {
	NSSet *lastTouches;
	double lastTouchTime;
	double pauseTime;
	NSObject <MorseResultProcessorDelegate> *resultDelegate;
}
@property (nonatomic, retain) NSSet *lastTouches;
@property (nonatomic, retain) NSObject <MorseResultProcessorDelegate> *resultDelegate;
@end
