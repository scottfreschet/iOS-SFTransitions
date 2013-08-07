//
//  SFAbove.h
//  iOS-SFTransitions
//
//  Created by Scott Freschet on 8/5/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFDefault.h"

@interface SFAbove : UIViewController

// Variables.
@property (strong, nonatomic) ScreenshotUtils* xScreenshotUtils;

// IBOutlets.
@property (strong, nonatomic) IBOutlet UIView* xView_Main;

// IBActions.
-(IBAction)backTapped:(id)sender;

@end
