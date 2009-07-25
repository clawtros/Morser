//
//  MorseTouchView.m
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright 2009 Saltmine Software. All rights reserved.
//

#import "MorseTouchView.h"


@implementation MorseTouchView
@synthesize lastTouches;
@synthesize resultDelegate;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	pauseTime = lastTouchTime ? [event timestamp] - lastTouchTime : 0;
	lastTouchTime = [event timestamp];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[resultDelegate touchDurationReceived:[event timestamp] - lastTouchTime timeFromLastTap:pauseTime];
	lastTouchTime = [event timestamp];
}

@end
