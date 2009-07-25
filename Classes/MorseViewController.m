//
//  MorseViewController.m
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright Saltmine Software 2009. All rights reserved.
//

#import "MorseViewController.h"

#define TOUCH_UNIT 0.3

@implementation MorseViewController

@synthesize morseTouchView;
@synthesize resultView;
@synthesize parsedView;


-(NSString*)parseLetter:(NSString *)letterToParse {
	NSLog(letterToParse);
	if ([letterToParse isEqualToString:@".-"]) { return @"A"; }
	else if ([letterToParse isEqualToString:@"-..."]) { return @"B"; }
	else if ([letterToParse isEqualToString:@"-.-."]) { return @"C"; }
	else if ([letterToParse isEqualToString:@"-.."]) { return @"D"; }
	else if ([letterToParse isEqualToString:@"."]) { return @"E"; }
	else if ([letterToParse isEqualToString:@"..-."]) { return @"F"; }
	else if ([letterToParse isEqualToString:@"--."]) { return @"G"; }
	else if ([letterToParse isEqualToString:@"...."]) { return @"H"; }
	else if ([letterToParse isEqualToString:@".."]) { return @"I"; }
	else if ([letterToParse isEqualToString:@".---"]) { return @"J"; }
	else if ([letterToParse isEqualToString:@"-.-"]) { return @"K"; }
	else if ([letterToParse isEqualToString:@".-.."]) { return @"L"; }
	else if ([letterToParse isEqualToString:@"--"]) { return @"M"; }
	else if ([letterToParse isEqualToString:@"-."]) { return @"N"; }
	else if ([letterToParse isEqualToString:@"---"]) { return @"O"; }
	else if ([letterToParse isEqualToString:@".--."]) { return @"P"; }
	else if ([letterToParse isEqualToString:@"--.-"]) { return @"Q"; }
	else if ([letterToParse isEqualToString:@".-."]) { return @"R"; }
	else if ([letterToParse isEqualToString:@"..."]) { return @"S"; }
	else if ([letterToParse isEqualToString:@"-"]) { return @"T"; }
	else if ([letterToParse isEqualToString:@"..-"]) { return @"U"; }
	else if ([letterToParse isEqualToString:@"...-"]) { return @"V"; }
	else if ([letterToParse isEqualToString:@".--"]) { return @"W"; }
	else if ([letterToParse isEqualToString:@"-..-"]) { return @"X"; }
	else if ([letterToParse isEqualToString:@"-.--"]) { return @"Y"; }
	else if ([letterToParse isEqualToString:@"--.."]) { return @"Z"; }
	else if ([letterToParse isEqualToString:@".----"]) { return @"1"; }
	else if ([letterToParse isEqualToString:@"..---"]) { return @"2"; }
	else if ([letterToParse isEqualToString:@"...--"]) { return @"3"; }
	else if ([letterToParse isEqualToString:@"....-"]) { return @"4"; }
	else if ([letterToParse isEqualToString:@"....."]) { return @"5"; }
	else if ([letterToParse isEqualToString:@"-...."]) { return @"6"; }
	else if ([letterToParse isEqualToString:@"--..."]) { return @"7"; }
	else if ([letterToParse isEqualToString:@"---.."]) { return @"8"; }
	else if ([letterToParse isEqualToString:@"----."]) { return @"9"; }
	else if ([letterToParse isEqualToString:@"-----"]) { return @"0"; }
	else if ([letterToParse isEqualToString:@".-.-.-"]) { return @"."; }
	else if ([letterToParse isEqualToString:@"--..--"]) { return @","; }
	else if ([letterToParse isEqualToString:@"="]) { return @" "; }
	return @"?";
}

-(IBAction)resetText {
	resultView.text = @"";
}

-(NSString*)parseString:(NSString *)stringToParse {
	NSArray *letters = [stringToParse componentsSeparatedByString:@"/"];
	NSString *resultString = @"";
	for (NSString* letter in letters) {
		resultString = [resultString stringByAppendingString:[self parseLetter:letter]];
	}
	return resultString;
}


-(void)touchDurationReceived:(double)touchDuration timeFromLastTap:(double)pauseTime {
	resultView.text = [NSString stringWithFormat:@"%@%@%@", 
					   resultView.text, 
					   pauseTime > TOUCH_UNIT * 7 ? @"/=/" : pauseTime > TOUCH_UNIT * 3 ? @"/" : @"",
					   touchDuration > TOUCH_UNIT ? @"-" : @"."];
	parsedView.text = [self parseString:resultView.text];
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
