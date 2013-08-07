//
//  SFDefault.h
//  iOS-SFTransitions
//
//  Created by Scott Freschet on 8/5/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenshotUtils.h"

// Notification Constants
extern NSString* const NOTIFICATION_TRANSITION;
extern NSString* const NOTIFICATION_TRANSITION_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_RETURN;
extern NSString* const NOTIFICATION_RETURN_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_RETURN_DK_IDENTIFIER;


@interface SFDefault : UIViewController

// Variables.
@property (strong, nonatomic) ScreenshotUtils* xScreenshotUtils;

// IBOutlets.
@property (strong, nonatomic) IBOutlet UIView* xView_Main;

// IBActions.
-(IBAction)fromAboveTapped:(id)sender;
-(IBAction)fromRightTapped:(id)sender;
-(IBAction)fromBottomTapped:(id)sender;
-(IBAction)fromLeftTapped:(id)sender;



@end
