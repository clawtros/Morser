//
//  MorseViewController.m
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright Saltmine Software 2009. All rights reserved.
//

#import "MorseViewController.h"
#import "MorseParser.h"


@implementation MorseViewController

@synthesize morseTouchView;
@synthesize resultView;
@synthesize parsedView;


-(IBAction)resetText {
	resultView.text = @"";
}
-(IBAction)toggleSound:(id)sender {
	[(MorseTouchView*)morseTouchView toggleSound];
}
-(void)touchDurationReceived:(double)touchDuration timeFromLastTap:(double)pauseTime {
	resultView.text = [NSString stringWithFormat:@"%@%@%@", 
					   resultView.text, 
					   // UNIT * 7 is a space
					   pauseTime > TOUCH_UNIT * 7 && ![resultView.text isEqualToString:@""] ? @"/=/" : 
					   // UNIT * 3 is a word break
						pauseTime > TOUCH_UNIT * 3 && ![resultView.text isEqualToString:@""] ? @"/" : @"",
					   // Anything less is a letter segment
					   touchDuration > TOUCH_UNIT ? @"-" : @"."];
	parsedView.text = [MorseParser parseString:resultView.text];
}

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[(MorseTouchView*)morseTouchView setResultDelegate:self];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[morseTouchView release];
    [resultView release];
	[parsedView release];
	[super dealloc];
}

@end
