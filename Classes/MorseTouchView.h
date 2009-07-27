//
//  MorseTouchView.h
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright 2009 Saltmine Software. All rights reserved.
//
#import <AVFoundation/AVAudioPlayer.h>
#import <Foundation/Foundation.h>
#import "MorseViewController.h"
#import "MorseResultProcessorDelegate.h"
#define TOUCH_UNIT 0.20

@interface MorseTouchView : UIView <AVAudioPlayerDelegate> {
	CGPoint touchLoc;
	NSTimer *timer;
	BOOL fingerDown;
	double dateOffset;
	double lastTouchTime;
	double pauseTime;
	AVAudioPlayer *_player;
	BOOL soundEnabled;
	NSObject <MorseResultProcessorDelegate> *resultDelegate;
}
-(void)toggleSound;
@property (nonatomic, retain) AVAudioPlayer *_player;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) NSObject <MorseResultProcessorDelegate> *resultDelegate;
@end
