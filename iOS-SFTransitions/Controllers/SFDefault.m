//
//  SFDefault.m
//  iOS-SFTransitions
//
//  Created by Scott Freschet on 8/5/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFDefault.h"

///////////////////////////////////////
#pragma mark - Notification Constants
///////////////////////////////////////
NSString* const NOTIFICATION_TRANSITION = @"notification_transition";
NSString* const NOTIFICATION_TRANSITION_DK_SCREENSHOT = @"notification_transition_dk_screenshot";
NSString* const NOTIFICATION_RETURN = @"notification_return";
NSString* const NOTIFICATION_RETURN_DK_SCREENSHOT = @"notification_return_dk_screenshot";
NSString* const NOTIFICATION_RETURN_DK_IDENTIFIER = @"notification_return_dk_identifier";


@interface SFDefault ()
@end

@implementation SFDefault

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
    
    // Intialize variables.
    self.xScreenshotUtils = [[ScreenshotUtils alloc]init];
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Return:) name:NOTIFICATION_RETURN object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
//////////////////////////////////////////////////////////////////

-(void)notification_Return:(NSNotification*) notification
{
    NSLog(@"notification_Return");
    
    // Grab the notification data.
    NSDictionary* data = [notification object];
    UIImage* image = [data objectForKey:NOTIFICATION_RETURN_DK_SCREENSHOT];
    NSString* identifier = [data objectForKey:NOTIFICATION_RETURN_DK_IDENTIFIER];
    
    // Create a screenshot view.
    UIImageView* screenshot = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    screenshot.image = image;
    [self.view addSubview:screenshot];
    
    if ([identifier isEqualToString:@"Above"])
    {
        // Reposition the mainView.
        self.xView_Main.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        
        // Annimate.
        [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             [screenshot setFrame:CGRectMake(0, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
             [self.xView_Main setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
         }
                         completion:^(BOOL finished){
                             [screenshot removeFromSuperview];
                         }];
    }
    else if ([identifier isEqualToString:@"Right"])
    {
        // Reposition the mainView.
        self.xView_Main.frame = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        // Annimate.
        [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             [screenshot setFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
             [self.xView_Main setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
         }
                         completion:^(BOOL finished){
                             [screenshot removeFromSuperview];
                         }];
    }
    else if ([identifier isEqualToString:@"Bottom"])
    {
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
    else if ([identifier isEqualToString:@"Left"])
    {
        // Reposition the mainView.
        self.xView_Main.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        // Annimate.
        [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             [screenshot setFrame:CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
             [self.xView_Main setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
         }
                         completion:^(BOOL finished){
                             [screenshot removeFromSuperview];
                         }];
    }
    
    
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - IBActions.
/////////////////////////////////////////////////////////////////////////

-(IBAction)fromAboveTapped:(id)sender
{
    NSLog(@"fromAboveTapped");
    
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_TRANSITION_DK_SCREENSHOT,
                          nil];
    
    // Present appropriate viewController.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFAbove = [storyboard instantiateViewControllerWithIdentifier:@"SFAbove"];
    [self presentViewController:SFAbove animated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRANSITION object:data];
     }];
    
}
-(IBAction)fromRightTapped:(id)sender
{
    NSLog(@"fromRightTapped");
    
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_TRANSITION_DK_SCREENSHOT,
                          nil];
    
    // Present appropriate viewController.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFRight = [storyboard instantiateViewControllerWithIdentifier:@"SFRight"];
    [self presentViewController:SFRight animated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRANSITION object:data];
     }];
}
-(IBAction)fromBottomTapped:(id)sender
{
    NSLog(@"fromBottomTapped");
    
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_TRANSITION_DK_SCREENSHOT,
                          nil];
    
    // Present appropriate viewController.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFBottom = [storyboard instantiateViewControllerWithIdentifier:@"SFBottom"];
    [self presentViewController:SFBottom animated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRANSITION object:data];
     }];
}
-(IBAction)fromLeftTapped:(id)sender
{
    NSLog(@"fromLeftTapped");
    
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_TRANSITION_DK_SCREENSHOT,
                          nil];
    
    // Present appropriate viewController.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFLeft = [storyboard instantiateViewControllerWithIdentifier:@"SFLeft"];
    [self presentViewController:SFLeft animated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRANSITION object:data];
     }];
}


@end
