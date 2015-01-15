//
//  RootViewController.m
//  RAContainment
//
//  Created by Rohan Aurora on 1/11/15.
//  Copyright (c) 2015 Rohan Aurora. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

#define kToolbarHeight 44.0

@interface RootViewController ()

@property (weak, nonatomic) UIViewController * currentChildViewController;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.homeButton.title = @"Home1";
    [self.homeButton setImage:[UIImage imageNamed:@"airplane-20"]];
}

#pragma mark -
#pragma mark -  Tab Clicks
#pragma mark -

- (IBAction)firstDetail:(id)sender {

    FirstViewController *fvc = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [self presentDetailController:fvc];

}

- (IBAction)secondDetail:(id)sender {

    SecondViewController *svc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self presentDetailController:svc];

}

- (IBAction)homeItem:(id)sender {
    
    [self removeCurrentChildViewController];
    
}

#pragma mark -
#pragma mark - Set Frames for VC
#pragma mark -

 - (CGRect)updateFrames {
    
    CGRect detailFrame = CGRectMake(0, kToolbarHeight, self.rootView.frame.size.width, self.rootView.frame.size.height - (kToolbarHeight * 2));
    return detailFrame;
}

#pragma mark -
#pragma mark - Present New VC
#pragma mark -

 - (void)presentDetailController:(UIViewController*)newVC {
    
    // Remove the current child VC if any
    if(self.currentChildViewController) {
        
        [self removeCurrentChildViewController];
    }
    
    // Add the new VC controller as child of the container
    [self addChildViewController:newVC];
    newVC.view.frame = [self updateFrames];
    
    // Add the new controller's view to the Container's view and save a reference to the detail View Controller
    [self.rootView addSubview:newVC.view];
    self.currentChildViewController = newVC;
    
    // Complete the add flow calling the function didMoveToParentViewController
    [newVC didMoveToParentViewController:self];
    
}

#pragma mark -
#pragma mark - Remove Child VC
#pragma mark -

 - (void)removeCurrentChildViewController {
    
    [self.currentChildViewController willMoveToParentViewController:nil];
    [self.currentChildViewController.view removeFromSuperview];
    [self.currentChildViewController removeFromParentViewController];
}

@end
