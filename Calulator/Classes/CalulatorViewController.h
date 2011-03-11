//
//  CalulatorViewController.h
//  Calulator
//
//  Created by Kunal Deo on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalulatorViewController : UIViewController {
	
	IBOutlet UILabel *display;
	BOOL userIsInTheMiddleOfTypingANumber;
	CalculatorBrain *brain;
    double memoryvalue;

}

- (IBAction) digitPressed:(UIButton *)sender;
- (IBAction) operationPressed:(UIButton *)sender;
- (IBAction) memoryStoreButtonPressed:(UIButton *) sender;
- (IBAction) memoryplus:(UIButton *) sender;
- (IBAction) memoryrecall:(UIButton *) sender;
- (IBAction) clear:(UIButton *) sender;
- (IBAction) backspace:(UIButton *) sender;



@end

