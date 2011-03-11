//
//  CalulatorAppDelegate.h
//  Calulator
//
//  Created by Kunal Deo on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalulatorViewController;

@interface CalulatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CalulatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CalulatorViewController *viewController;

@end

