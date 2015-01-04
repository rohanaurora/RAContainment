//
//  ViewController.m
//  RAContainment
//
//  Created by Rohan Aurora on 1/3/15.
//  Copyright (c) 2015 Rohan Aurora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIViewController *vc;
@end

@implementation ViewController


-(void) viewDidAppear:(BOOL)animated {
    
    
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    

//    if ([self.selectedViewController.title isEqualToString:@"menu"]) {

        [self performSegueWithIdentifier: @"menu" sender: self];
        NSLog(@"selected %lu",(unsigned long)tabBarController.selectedIndex);
        
//    } else {
//        
//        NSLog(@"Foo");
//    }
    
}

@end
