//
//  CalulatorViewController.m
//  Calulator
//
//  Created by Kunal Deo on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalulatorViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation CalulatorViewController

- (CalculatorBrain *)brain
{
	if(!brain) brain = [[CalculatorBrain alloc] init];
	return brain;
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



- (void)viewDidLoad {
    memoryvalue = 0;
    [super viewDidLoad];
}

- (void)vibrate {
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (IBAction) digitPressed:(UIButton *)sender
{
	NSString *digit = [[sender titleLabel] text];
    //[self vibrate];
    
	if(userIsInTheMiddleOfTypingANumber)
	{
		[display setText:[[display text] stringByAppendingString:digit]];
	}
	else 
	{
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;
	}
	
}

- (IBAction) backspace:(UIButton *) sender
{
    if ([[display text] length] == 0)
    {
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Operation" message:@"Nothing to Clear !!" delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil];
        [alert show];
        [alert release];    }
    else
    {
        display.text = [display.text substringToIndex:display.text.length - 1];
    }
    
}

- (IBAction) operationPressed:(UIButton *)sender
{
	if (userIsInTheMiddleOfTypingANumber) {
		[[self brain] setOperand:[[display text] doubleValue]];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText:[NSString stringWithFormat:@"%g",result]];
}

- (IBAction) memoryStoreButtonPressed:(UIButton *) sender
{
    memoryvalue = [[display text] doubleValue];
    userIsInTheMiddleOfTypingANumber = NO;
}

- (IBAction) memoryplus:(UIButton *) sender
{
    memoryvalue += [[display text] doubleValue];
    userIsInTheMiddleOfTypingANumber = NO;
}

- (IBAction) memoryrecall:(UIButton *) sender
{
    //[display setText:[NSString stringWithFormat:@"%g",memoryvalue]];
    [display setText:[NSString stringWithFormat:@"%g",memoryvalue]];
    userIsInTheMiddleOfTypingANumber = NO;
   
}

- (IBAction) clear:(UIButton *) sender
{
    memoryvalue = 0;
    [display setText:[NSString stringWithFormat:@"%g",memoryvalue]];
    userIsInTheMiddleOfTypingANumber = NO;
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
    [super dealloc];
}

@end
