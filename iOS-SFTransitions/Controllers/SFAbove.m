//
//  SFAbove.m
//  iOS-SFTransitions
//
//  Created by Scott Freschet on 8/5/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFAbove.h"

@interface SFAbove ()

@end

@implementation SFAbove

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Instantiate variables.
    self.xScreenshotUtils = [[ScreenshotUtils alloc]init];
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Transition:) name:NOTIFICATION_TRANSITION object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
//////////////////////////////////////////////////////////////////

-(void)notification_Transition:(NSNotification*) notification
{
    NSLog(@"notification_Transition");
    
    // Grab the notification data.
    NSDictionary* data = [notification object];
    UIImage* image = [data objectForKey:NOTIFICATION_TRANSITION_DK_SCREENSHOT];
    
    // Create a screenshot view.
    UIImageView* screenshot = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    screenshot.image = image;
    [self.view addSubview:screenshot];
    
    // Reposition the mainView.
    self.xView_Main.frame = CGRectMake(0, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    
    // Annimate.
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
     {
         [screenshot setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
         [self.xView_Main setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     }
                     completion:^(BOOL finished){
                         [screenshot removeFromSuperview];
                     }];
}

///////////////////////////////////////////////////////////////////////////////
#pragma mark - IBActions.
///////////////////////////////////////////////////////////////////////////////

-(IBAction)backTapped:(id)sender
{
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_RETURN_DK_SCREENSHOT,
                          @"Above", NOTIFICATION_RETURN_DK_IDENTIFIER,
                          nil];
    
    // Dismiss viewController.
    [self dismissViewControllerAnimated:NO completion:^
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_RETURN object:data];
    }];
}

@end
