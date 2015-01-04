//
//  SecondViewController.m
//  RAContainment
//
//  Created by Rohan Aurora on 1/3/15.
//  Copyright (c) 2015 Rohan Aurora. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Second View Controller Dismissed :)");
    }];
    
}
@end
