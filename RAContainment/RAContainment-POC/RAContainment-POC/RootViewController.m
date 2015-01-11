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


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -
#pragma mark - First Tab Click
#pragma mark -

- (IBAction)firstDetail:(id)sender {

    FirstViewController *fvc = [FirstViewController new];
    [self presentDetailController:fvc];

}


#pragma mark -
#pragma mark - Second Tab Click
#pragma mark -

- (IBAction)secondDetail:(id)sender {

    SecondViewController *svc = [SecondViewController new];
    [self presentDetailController:svc];

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
