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

@interface RootViewController ()

@property (weak, nonatomic) UIViewController            * currentChildViewController;
@property (strong, nonatomic) IBOutlet UIView           * rootView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem    * homeButton;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // TODO
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
#pragma mark - Present New VC
#pragma mark -

- (void)presentDetailController:(UIViewController*)newVC {
    
    // Remove the current child VC if any
    if(self.currentChildViewController)
    {
        [self removeCurrentChildViewController];
    }
    
    self.currentChildViewController = newVC;
    
    // Add the new VC controller as child of the container
    [self addChildViewController:newVC];
    
    // Add the new controller's view to the Container's view and save a reference to the detail View Controller
    [self.rootView addSubview:newVC.view];
    
    [self.rootView removeConstraints:self.rootView.constraints];
    
    [self.rootView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [newVC.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.rootView addConstraint:[NSLayoutConstraint constraintWithItem:newVC.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rootView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.rootView addConstraint:[NSLayoutConstraint constraintWithItem:newVC.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.rootView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.rootView addConstraint:[NSLayoutConstraint constraintWithItem:newVC.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rootView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self.rootView addConstraint:[NSLayoutConstraint constraintWithItem:newVC.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.rootView attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    
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
