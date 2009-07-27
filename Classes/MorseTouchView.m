//
//  MorseTouchView.m
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright 2009 Saltmine Software. All rights reserved.
//

#import "MorseTouchView.h"

@implementation MorseTouchView
@synthesize resultDelegate;
@synthesize timer;
@synthesize _player;
-(void)redraw {
	[self setNeedsDisplay];
}

-(void)toggleSound {
	soundEnabled = !soundEnabled;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		NSString *tone = [[NSBundle mainBundle] pathForResource:@"dah" ofType:@"aiff"];
		_player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:tone] error:nil];
		[_player setDelegate:self];
		soundEnabled = YES;
	}
	return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	touchLoc = [(UITouch *)[[touches allObjects] objectAtIndex:0] locationInView:self];
	pauseTime = lastTouchTime ? [event timestamp] - lastTouchTime : 0;
	lastTouchTime = [event timestamp];
	fingerDown = YES;
	dateOffset = [NSDate timeIntervalSinceReferenceDate] - lastTouchTime;
	if (soundEnabled) {
		[_player prepareToPlay];
		[_player play];
	}
	timer = [NSTimer scheduledTimerWithTimeInterval:TOUCH_UNIT / 5.0 
											 target:self 
										   selector:@selector(redraw) 
										   userInfo:nil 
											repeats:YES];
	[self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	touchLoc = [(UITouch *)[[touches allObjects] objectAtIndex:0] locationInView:self];	
	[self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[_player stop];
	[resultDelegate touchDurationReceived:[event timestamp] - lastTouchTime 
						  timeFromLastTap:pauseTime];
	lastTouchTime = [event timestamp];
	fingerDown = NO;
	[timer invalidate];
	[self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect {
	if (fingerDown) {
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		[[UIColor blackColor] set];
		if ([NSDate timeIntervalSinceReferenceDate] - (lastTouchTime + dateOffset) < TOUCH_UNIT) { 
			CGContextFillEllipseInRect(ctx, CGRectMake(touchLoc.x-20, touchLoc.y-20, 40,40));
		} else {
			CGContextFillRect(ctx, CGRectMake(touchLoc.x-40, touchLoc.y-20, 80, 40));
		}
	}
}

- (void) dealloc {
	[_player release];
	[super dealloc];
}

@end
