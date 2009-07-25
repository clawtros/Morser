//
//  MorseViewController.m
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright Saltmine Software 2009. All rights reserved.
//

#import "MorseViewController.h"
#import "MorseParser.h"

#define TOUCH_UNIT 0.3

@implementation MorseViewController

@synthesize morseTouchView;
@synthesize resultView;
@synthesize parsedView;


-(IBAction)resetText {
	resultView.text = @"";
}




-(void)touchDurationReceived:(double)touchDuration timeFromLastTap:(double)pauseTime {
	resultView.text = [NSString stringWithFormat:@"%@%@%@", 
					   resultView.text, 
					   pauseTime > TOUCH_UNIT * 7 ? @"/=/" : pauseTime > TOUCH_UNIT * 3 ? @"/" : @"",
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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[morseTouchView setResultDelegate:self];
	NSLog(@"%@",parsedView);
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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
    [resultView release];
	[super dealloc];
}

@end
