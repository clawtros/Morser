//
//  MorseViewController.h
//  Morse
//
//  Created by Adam Benzan on 09-07-24.
//  Copyright Saltmine Software 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MorseTouchView.h"
#import "MorseResultProcessorDelegate.h"

@interface MorseViewController : UIViewController <MorseResultProcessorDelegate> {
	IBOutlet UIView *morseTouchView;
	IBOutlet UITextView *resultView;
	IBOutlet UITextView *parsedView;
	
}

-(IBAction)resetText;
-(IBAction)toggleSound:(id)sender;
@property (nonatomic, retain) IBOutlet UITextView *resultView;
@property (nonatomic, retain) IBOutlet UITextView *parsedView;
@property (nonatomic, retain) IBOutlet UIView *morseTouchView;

@end

